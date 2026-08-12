import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ocrServiceProvider = Provider<OcrService>((ref) {
  return OcrService();
});

class OcrService {
  final TextRecognizer _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  /// Processes an image and extracts raw text.
  Future<String> processImage(InputImage inputImage) async {
    try {
      final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);
      return recognizedText.text;
    } catch (e) {
      // Return empty string or handle error properly
      return '';
    }
  }

  void dispose() {
    _textRecognizer.close();
  }
}
