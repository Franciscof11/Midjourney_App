import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class OpenAIService {
  final String _apiKey = 'SUA_CHAVE_DE_API';
  final Dio _dio = Dio();

  Future<void> setupRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    // Configura as definições padrão (caso deseje)
    await remoteConfig.setDefaults({
      'api_key': 'default_value',
    });

    // Sincroniza o Remote Config com o servidor Firebase
    await remoteConfig.fetchAndActivate();

    // Busca o valor da API key
    String apiKey = remoteConfig.getString('api_key');
    print("API Key: $apiKey");

    // Agora você pode usar essa apiKey no seu app
  }

  Future<String> generateImage(String prompt) async {
    try {
      Response response = await _dio.post(
        'https://api.openai.com/v1/images/generations',
        data: jsonEncode(
          {
            'prompt': prompt,
            'n': 1, // Quantidade de imagens
            'size': '1024x1024', // Tamanho da imagem
          },
        ),
        options: Options(
          headers: {
            'Authorization': 'Bearer $_apiKey',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = response.data;

        return data['data'][0]['url']; // Retorna a URL da imagem gerada
      } else {
        throw Exception('Erro ao gerar imagem: ${response.statusCode}');
      }
    } on DioException catch (e) {
      debugPrint('Erro de Dio: ${e.message}');

      throw Exception('Erro ao se conectar à API: ${e.response?.data}');
    }
  }
}
