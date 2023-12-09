class ManualResponse {
  final String? guideId;
  final String? type;
  final String? tag;
  final String? title;
  final String? content;

  ManualResponse({
    this.guideId,
    this.type,
    this.tag,
    this.title,
    this.content,
  });

  ManualResponse.fromJson(Map<String, dynamic> json)
      : guideId = json['guideId'] as String?,
        type = json['type'] as String?,
        tag = json['tag'] as String?,
        title = json['title'] as String?,
        content = json['content'] as String?;

  Map<String, dynamic> toJson() => {
        'guideId': guideId,
        'type': type,
        'tag': tag,
        'title': title,
        'content': content
      };
}
