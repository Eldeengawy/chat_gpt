class EndPoints {
  const EndPoints._();

  // Authentication Endpoints
  static const String baseUrl = 'https://api.openai.com/v1/engines/text-'
      'davinci-003';

  // Split your API key into multiple parts
  static const String apiKeyPart1 = 'AIzaSy';
  static const String apiKeyPart2 = 'CaH_t_kEhFxa4p2sTas73JtaQzeCoEFOk';

  // Combine the parts when needed
  static String get geminiApi => '$apiKeyPart1$apiKeyPart2';
}
