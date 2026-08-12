import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../domain/ingredient_model.dart';

class GeminiService {
  static String get _apiKey => dotenv.env['GEMINI_API_KEY'] ?? '';

  static Future<List<Ingredient>> evaluateUnknownIngredients(
      List<String> unknownIngredients) async {
    if (unknownIngredients.isEmpty) return [];

    try {
      final model = GenerativeModel(
        model: 'gemini-3-flash',
        apiKey: _apiKey,
      );

      final prompt = '''
      You are an expert food scientist and data extractor.
      Analyze the following unknown food ingredients/OCR tokens.
      For each ingredient, identify its scientific name, E-Number (if applicable), its most likely physical sources in food manufacturing, and a brief explanation of what it is.
      DO NOT classify it as Halal or Haram. Just provide the factual data.
      Return ONLY a valid JSON array of objects. Do not include markdown formatting like ```json.
      
      Format: 
      [
        {
          "name": "original_token",
          "correctedName": "clean_ingredient_name",
          "possibleSources": ["Fish", "Pig", "Cow", "Plant", "Synthetic", "Microbial"],
          "eNumber": "E123",
          "scientificName": "Scientific name",
          "explanation": "Brief context about its use in food."
        }
      ]
      
      Ingredients: ${unknownIngredients.join(', ')}
      ''';

      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      String responseText = response.text ?? '[]';
      responseText =
          responseText.replaceAll('```json', '').replaceAll('```', '').trim();

      final List<dynamic> jsonList = jsonDecode(responseText);

      return jsonList.map((map) {
        return Ingredient(
          id: 'ai_generated',
          name: map['correctedName'] ?? map['name'] ?? '',
          status: IngredientStatus.unknown, // Will be evaluated by Rule Engine
          possibleSources: List<String>.from(map['possibleSources'] ?? []),
          eNumber: map['eNumber'],
          scientificName: map['scientificName'],
          explanation: map['explanation'],
        );
      }).toList();
    } catch (e) {
      // If AI fails, return them as strictly unknown so we don't accidentally mark haram as halal
      return unknownIngredients
          .map((name) => Ingredient(
                id: 'ai_failed',
                name: name,
                status: IngredientStatus.unknown,
              ))
          .toList();
    }
  }
}
