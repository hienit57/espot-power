class BaseResponseWithListObj<T> {
  final int? code;
  final String? msg;
  final bool? ok;
  final String? i18n;
  final List<T>? obj;

  BaseResponseWithListObj({
    this.code,
    this.msg,
    this.ok,
    this.obj,
    this.i18n,
  });

  factory BaseResponseWithListObj.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    BaseResponseWithListObj<T> resultGeneric = BaseResponseWithListObj<T>(
      code: json['code'] as int? ?? 0,
      msg: json['msg'] as String? ?? "",
      ok: json['ok'] as bool,
      i18n: json['i18n'] as String? ?? "",
    );

    if (json['obj'] != null) {
      if (json['obj'] is List?) {
        return resultGeneric.copyWith(
          obj: (json['obj'] as List).map(fromJsonT).toList(),
        );
      }
    }

    return resultGeneric;
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'msg': msg,
        'ok': ok,
        'i18n': i18n,
        'obj': obj,
      };

  BaseResponseWithListObj<T> copyWith({
    int? code,
    String? msg,
    bool? ok,
    String? i18n,
    List<T>? obj,
  }) {
    return BaseResponseWithListObj<T>(
      code: code ?? this.code,
      msg: msg ?? this.msg,
      ok: ok ?? this.ok,
      i18n: i18n ?? this.i18n,
      obj: obj ?? this.obj,
    );
  }
}
