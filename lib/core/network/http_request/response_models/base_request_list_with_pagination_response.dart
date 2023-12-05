import 'package:bas_clean_architecture/core/network/http_request/response_models/base_request_list_response.dart';

class BaseRequestListResponseWithPagination<T>
    extends BaseRequestListResponse<T> {
  final Pagination? pagination;

  BaseRequestListResponseWithPagination({
    int? status,
    List<T>? data,
    String? message,
    this.pagination,
  }) : super(
          status: status,
          data: data,
          message: message,
        );

  factory BaseRequestListResponseWithPagination.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return BaseRequestListResponseWithPagination<T>(
      status: json['Status'] as int? ?? 0,
      message: json['Message'] as String? ?? "",
      data: (json['Data'] != null && json['Data'] is List)
          ? (json['Data'] as List).map(fromJsonT).toList()
          : null,
      pagination: Pagination.fromJson(json['Pagination']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['Pagination'] = pagination?.toJson();
    return data;
  }

  @override
  BaseRequestListResponseWithPagination<T> copyWith({
    List<T>? data,
    int? status,
    String? userMessage,
    Pagination? pagination,
  }) {
    return BaseRequestListResponseWithPagination<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      message: userMessage ?? message,
      pagination: pagination ?? this.pagination,
    );
  }
}

class Pagination {
  final int? totalItems;
  final int? currentPage;
  final int? position;
  final int? itemsPerPage;

  Pagination({
    this.totalItems,
    this.currentPage,
    this.position,
    this.itemsPerPage,
  });

  Pagination.fromJson(Map<String, dynamic> json)
      : totalItems = json['TotalItems'] as int?,
        currentPage = json['CurrentPage'] as int?,
        position = json['Position'] as int?,
        itemsPerPage = json['ItemsPerPage'] as int?;

  Map<String, dynamic> toJson() => {
        'TotalItems': totalItems,
        'CurrentPage': currentPage,
        'Position': position,
        'ItemsPerPage': itemsPerPage,
      };
}
