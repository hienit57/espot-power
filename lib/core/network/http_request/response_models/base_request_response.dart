class BaseResponseWithObj {
  final int? code;
  final String? msg;
  final bool? ok;
  final dynamic obj;
  final String? i18n;
  final dynamic data;

  BaseResponseWithObj({
    this.code,
    this.msg,
    this.ok,
    this.obj,
    this.i18n,
    this.data,
  });

  BaseResponseWithObj.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        msg = json['msg'] as String?,
        ok = json['ok'] as bool?,
        obj = json['obj'],
        i18n = json['i18n'] as String?,
        data = json['data'];

  Map<String, dynamic> toJson() => {
        'code': code,
        'msg': msg,
        'ok': ok,
        'obj': obj,
        'i18n': i18n,
        'data': data,
      };
}
