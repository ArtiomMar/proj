import 'dart:convert';

import 'package:http/http.dart' as http;

class ChatService {
  final String apiKey =
      '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';
  final String apiUrl = 'https://api.openai.com/v1/chat/completions';

  Future<String> sendMessage(String message) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'system', 'content': 'You are a helpful assistant.'},
          {'role': 'user', 'content': message},
        ],
        'max_tokens': 150,
        'temperature': 0.7,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return responseBody['choices'][0]['message']['content'];
    } else if (response.statusCode == 429) {
      // Обработка ошибки 429: Повторить запрос после задержки
      print('Ошибка 429: Превышен лимит запросов. Пытаемся снова...');
      await Future.delayed(Duration(seconds: 10)); // Задержка 10 секунд
      return sendMessage(message); // Попробовать снова
    } else {
      throw Exception('Ошибка при запросе: ${response.statusCode}');
    }
  }
}
