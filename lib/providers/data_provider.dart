import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:imagetools/models/Predictions.dart';
import 'package:imagetools/utils.dart';

final cookiesProvider = FutureProvider<dynamic>((ref) async {
  return ref.watch(replicateApiProvider).getCookies();
});

final predictionProvider =
    FutureProvider.family<Prediction, String>((ref, image) async {
  return ref.watch(replicateApiProvider).getPrediction(image);
});
