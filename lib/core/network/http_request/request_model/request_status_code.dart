// ignore_for_file: constant_identifier_names

enum RequestStatusCode {
  success,
  failure,
}

extension RequestStatusExtension on RequestStatusCode {
  int get value {
    switch (this) {
      case RequestStatusCode.success:
        return 0;
      default:
        return -1;
    }
  }
}

enum SystemStatuses {
  cancelled,
}

extension SystemStatusesExtension on SystemStatuses {
  String get value {
    switch (this) {
      case SystemStatuses.cancelled:
        return 'Cancelled';
      default:
        return '';
    }
  }
}
