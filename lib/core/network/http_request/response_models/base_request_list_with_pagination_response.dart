import 'package:espot_power/core/network/http_request/response_models/base_request_list_response.dart';

class BaseResponseWithPagination<T> extends BaseResponseWithListObj<T> {
  final int? pageNo;
  final int? pageSize;
  final int? totalPage;
  final int? totalSize;

  BaseResponseWithPagination({
    int? code,
    bool? ok,
    String? msg,
    String? i18n,
    List<T>? obj,
    this.pageNo,
    this.pageSize,
    this.totalPage,
    this.totalSize,
  }) : super(
          code: code,
          ok: ok,
          msg: msg,
          i18n: i18n,
          obj: obj,
        );

  factory BaseResponseWithPagination.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return BaseResponseWithPagination<T>(
      code: json['code'] as int? ?? 0,
      ok: json['cokode'] as bool? ?? false,
      msg: json['msg'] as String? ?? "",
      i18n: json['i18n'] as String? ?? "",
      obj: (json['obj'] != null && json['obj'] is List)
          ? (json['obj'] as List).map(fromJsonT).toList()
          : null,
      pageNo: json['pageNo'] as int? ?? 0,
      pageSize: json['pageSize'] as int? ?? 0,
      totalPage: json['totalPage'] as int? ?? 0,
      totalSize: json['totalSize'] as int? ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['pageNo'] = pageNo;
    data['pageSize'] = pageSize;
    data['totalPage'] = totalPage;
    data['totalSize'] = totalSize;

    return data;
  }

  @override
  BaseResponseWithPagination<T> copyWith({
    int? code,
    bool? ok,
    String? msg,
    String? i18n,
    List<T>? obj,
    int? pageNo,
    int? pageSize,
    int? totalPage,
    int? totalSize,
  }) {
    return BaseResponseWithPagination<T>(
      code: code ?? this.code,
      ok: ok ?? this.ok,
      msg: msg ?? this.msg,
      i18n: i18n ?? this.i18n,
      obj: obj ?? this.obj,
      pageNo: pageNo ?? this.pageNo,
      pageSize: pageSize ?? this.pageSize,
      totalPage: totalPage ?? this.totalPage,
      totalSize: totalSize ?? this.totalSize,
    );
  }
}
