import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:imagetools/models/Predictions.dart';
import 'package:imagetools/providers/data_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageProcessor {
  // final ImagePicker _picker = ImagePicker();
  FileType _pickingType = FileType.image;
  final WidgetRef _ref;
  ImageProcessor(this._ref);

  Future<File?> pickImage() async {
    // final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    final pickedFile = await FilePicker.platform.pickFiles(
      type: _pickingType,
      allowMultiple: false,
    );
    if (pickedFile != null) {
      return File(pickedFile.files.single.path!);
    }
    return null;
  }

  Future<File?> upscaleImage(File imageFile) async {
    final base64Image = base64Encode(await imageFile.readAsBytes());
    final replicateApiToken = _ref.read(apiTokenProvider);
    final response = await http.post(
      Uri.parse('https://api.replicate.com/v1/predictions'),
      headers: {
        'Authorization': 'Token $replicateApiToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'version':
            '1b976a4d456ed9e4d1a846597b7614e79eadad3032e9124fa63859db0fd59b56',
        'input': {'img': 'data:image/jpeg;base64,$base64Image'},
      }),
    );
    print('statusCode: ${response.statusCode}');
    print('response: ${response.body}');

    if (response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body);
      final predictionId = jsonResponse['id'];
      print('predictionId: $predictionId');

      while (true) {
        final statusResponse = await http.get(
          Uri.parse('https://api.replicate.com/v1/predictions/$predictionId'),
          headers: {
            'Authorization': 'Token $replicateApiToken',
            'Content-Type': 'application/json',
          },
        );

        if (statusResponse.statusCode == 200) {
          final statusJson = jsonDecode(statusResponse.body);
          final status = statusJson['status'];

          if (status == 'succeeded') {
            final String upscaledImageUrl = statusJson['output'];
            final imageResponse = await http.get(Uri.parse(upscaledImageUrl));
            if (imageResponse.statusCode == 200) {
              final Directory tempDir = await getTemporaryDirectory();
              final String tempPath = tempDir.path;
              final File tempFile = File(
                  '$tempPath/upscaled_${DateTime.now().millisecondsSinceEpoch}.jpg');
              await tempFile.writeAsBytes(imageResponse.bodyBytes);
              return tempFile;
            } else {
              return null;
            }
          } else if (status != 'starting' && status != 'processing') {
            return null;
          }

          await Future.delayed(Duration(seconds: 1));
        } else {
          return null;
        }
      }
    }
    return null;
  }
}

class ApiTokenNotifier extends StateNotifier<String?> {
  ApiTokenNotifier() : super(null) {
    _loadApiToken();
  }

  Future<void> _loadApiToken() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getString('replicateApiToken');
  }

  Future<void> saveApiToken(String? token) async {
    final prefs = await SharedPreferences.getInstance();
    if (token == null || token.isEmpty) {
      await prefs.remove('replicateApiToken');
    } else {
      await prefs.setString('replicateApiToken', token);
    }
    state = token;
  }
}
