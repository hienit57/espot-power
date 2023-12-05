import 'package:bas_clean_architecture/core/network/http_request/loggers/pretty_dio_logger.dart';

final PrettyDioLogger dioLogger = PrettyDioLogger(
  requestHeader: true,
  requestBody: true,
  request: true,
  maxWidth: 100,
  responseBody: true,
  responseHeader: false,
  error: true,
  compact: true,
);
