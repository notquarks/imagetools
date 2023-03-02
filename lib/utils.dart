import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:imagetools/models/Predictions.dart';

class ReplicateApi {
  static String csrfToken = "";
  static String anonymousId = "";
  String url = 'https://replicate.com/xinntao/realesrgan';
  Future getCookies() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var setCookie = response.headers['set-cookie'];
      var cookies = setCookie!.split(';');
      for (var cookie in cookies) {
        if (cookie.startsWith('csrftoken=')) {
          csrfToken = cookie.split('=')[1];
          //idk why it needs space before Secure...
        } else if (cookie.startsWith(' Secure,replicate_anonymous_id')) {
          anonymousId = cookie.split('=')[1];
        }
      }
      return {'csrfToken': csrfToken, 'anonymousId': anonymousId};
    } else {
      print('Response status: ${response.statusCode}');
      print('Failed to get Replicate REALERSGAN');
      throw Exception(response.reasonPhrase);
    }
  }

  Future submitImage(String image) async {
    var response = await http.post(
      Uri.parse(
          'https://replicate.com/api/upload/${image}?content_type=image/png'),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRFToken': csrfToken,
        'Cookie': 'csrftoken=$csrfToken;replicate_anonymous_id=$anonymousId',
      },
      body: '{"image": "$image"}',
    );
    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } else {
      print('Response status: ${response.statusCode}');
      print('Failed to submit image');
      throw Exception(response.reasonPhrase);
    }
  }

  Future<Prediction> getPrediction(String image) async {
    var response = await http.post(
      Uri.parse(
          'https://replicate.com/api/upload/${image}?content_type=image/png'),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRFToken': csrfToken,
        'Cookie': 'csrftoken=$csrfToken;replicate_anonymous_id=$anonymousId',
      },
      body: '{"image": "$image"}',
    );
    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      var res = predictionFromJson(response.body);
      return res;
    } else {
      print('Response status: ${response.statusCode}');
      print('Failed to get prediction');
      throw Exception(response.reasonPhrase);
    }
  }
}

final replicateApiProvider = Provider<ReplicateApi>((ref) => ReplicateApi());
