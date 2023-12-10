class FeedbackModelRequest {
  final String? idDevice;
  final String? typeError;
  final String? informationError;
  final String? phoneReport;
  final String? emailReport;

  FeedbackModelRequest({
    this.idDevice,
    this.typeError,
    this.informationError,
    this.phoneReport,
    this.emailReport,
  });
}
