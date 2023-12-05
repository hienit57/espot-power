class SupportedLanguage {
  final int? id;
  final String? languageCode;
  final String? flag;
  final String? title;

  SupportedLanguage({
    this.id,
    this.languageCode,
    this.flag,
    this.title,
  });

  SupportedLanguage.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        languageCode = json['language_code'] as String?,
        flag = json['flag'] as String?,
        title = json['title'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'language_code': languageCode,
        'flag': flag,
        'title': title,
      };
}

List<SupportedLanguage> supportedLanguage = [
  SupportedLanguage(
    id: 0,
    flag: '',
    languageCode: 'en',
    title: 'English',
  ),
  SupportedLanguage(
    id: 0,
    flag: '',
    languageCode: 'zh',
    title: '中国人',
  ),
];
