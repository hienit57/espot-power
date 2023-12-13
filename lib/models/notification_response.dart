class NotificationResponse {
  final int? id;
  final String? title;
  final String? content;
  final String? category;
  final String? type;
  final String? imageUrl;
  final bool? push;
  final bool? deleted;
  final String? createdDate;
  final dynamic updatedDate;

  NotificationResponse({
    this.id,
    this.title,
    this.content,
    this.category,
    this.type,
    this.imageUrl,
    this.push,
    this.deleted,
    this.createdDate,
    this.updatedDate,
  });

  NotificationResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        content = json['content'] as String?,
        category = json['category'] as String?,
        type = json['type'] as String?,
        imageUrl = json['imageUrl'] as String?,
        push = json['push'] as bool?,
        deleted = json['deleted'] as bool?,
        createdDate = json['createdDate'] as String?,
        updatedDate = json['updatedDate'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'category': category,
        'type': type,
        'imageUrl': imageUrl,
        'push': push,
        'deleted': deleted,
        'createdDate': createdDate,
        'updatedDate': updatedDate
      };
}
