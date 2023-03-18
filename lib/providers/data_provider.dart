import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:imagetools/models/Predictions.dart';
import 'package:imagetools/utils.dart';
import 'package:image_picker/image_picker.dart';

// final cookiesProvider = FutureProvider<dynamic>((ref) async {
//   return ref.watch(replicateApiProvider).getCookies();
// });

// final predictionProvider =
//     FutureProvider.family<Prediction, String>((ref, image) async {
//   return ref.watch(replicateApiProvider).getPrediction(image);
// });

final imagePickerController = StateProvider.autoDispose((ref) {
  return ImagePicker();
});

final imageFileProvider = StateProvider<File?>((ref) {
  return null;
});

final upscaledImageProvider = StateProvider<File?>((ref) {
  return null;
});

final isProcessingProvider = StateProvider<bool>((ref) {
  return false;
});

final errorMessagesProvider = StateProvider<String?>((ref) {
  return null;
});

final apiTokenProvider = StateNotifierProvider<ApiTokenNotifier, String?>(
    (ref) => ApiTokenNotifier());
