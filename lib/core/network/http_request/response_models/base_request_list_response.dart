class BaseRequestListResponse<T> {
  final List<T>? data;
  final int? status;
  final String? message;

  BaseRequestListResponse({
    this.status,
    this.data,
    this.message,
  });

  factory BaseRequestListResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    BaseRequestListResponse<T> resultGeneric = BaseRequestListResponse<T>(
      status: json['Status'] as int? ?? 0,
      message: json['Message'] as String? ?? "",
    );

    if (json['Data'] != null) {
      if (json['Data'] is List?) {
        return resultGeneric.copyWith(
          data: (json['Data'] as List).map(fromJsonT).toList(),
        );
      }
    }

    return resultGeneric;
  }

  Map<String, dynamic> toJson() => {
        'Data': data,
        'Status': status,
        'Message': message,
      };

  BaseRequestListResponse<T> copyWith({
    List<T>? data,
    int? status,
    String? userMessage,
  }) {
    return BaseRequestListResponse<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      message: userMessage ?? this.message,
    );
  }
}
