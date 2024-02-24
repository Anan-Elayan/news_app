extension AppString on String{
  String get baseUrlNews => 'newsapi.org';
  String get baseUrl => '/v2/$this';
  String get baseUrlWithEverything => 'everything'.baseUrl;
  String get baseUrlWithTop => 'top-headlines'.baseUrl;
  String get getApiKey => 'a6247dae05a74835835e91c387550b3a';
}