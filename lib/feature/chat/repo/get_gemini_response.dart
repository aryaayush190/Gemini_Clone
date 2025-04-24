import 'package:gemini_clone/secreats/api_keys.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GeminiApiService {
  Future<String> sendPrompt(String prompt) async {
    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${Secret().geminiKey}',
    );
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": prompt},
            ],
          },
        ],
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return "${json['candidates'][0]['content']['parts'][0]['text']}";
    } else {
      throw Exception('Failed to load response');
    }
  }
}
