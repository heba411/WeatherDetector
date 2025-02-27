import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../domain/repos/ml_repo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MLRepositoryImpl implements MLRepository {
  final Dio dio;

  MLRepositoryImpl(this.dio);

  @override
  // Future<int> getPrediction(List<int> features) async {
  //   try {
  //     // final response = await dio.post(
  //     //   'http://10.0.2.2:5001/predict',
  //     //   data: {'features': features},
  //     // );
  //     final response = await http.post(
  //       Uri.parse('http://10.0.2.2:5001/predict'),
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({'features': features}),
  //     );
  //     print('Prediction: ${jsonDecode(response.body)}');
  //
  //     if (response.statusCode == 200) {
  //       print('############################ML######################');
  //       final data = jsonDecode(response.body);
  //       print('Prediction: ${data['prediction']}');
  //       // print(response.data);
  //       return data['prediction'];
  //     } else {
  //       throw Exception('Failed to get prediction');
  //     }
  //   } catch (e) {
  //     throw Exception('Error getting prediction: $e');
  //   }
  // }

  Future<int> getPrediction(List<int> features) async {
    final url = Uri.parse('http://192.168.1.9:5001/predict');

    // Create the POST request body
    Map<String, dynamic> body = {
      'features': features
    };

    // Send the POST request
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    // Handle the response
    if (response.statusCode == 200) {
      final prediction = json.decode(response.body)['prediction'];
      if (kDebugMode) {
        print('Prediction: $prediction');
        return prediction[0];
      }
      return prediction[0];
    } else {
      if (kDebugMode) {
        print('Failed to get prediction');
      }
      return -1;
    }
  }
}
