part of 'voucher_cubit.dart';

class VoucherState extends Equatable {
  final RequestStatus? onApplyVoucher;
  final String? msgApplyVoucher;
  final VoucherResponse? voucherResponse;

  const VoucherState({
    this.onApplyVoucher,
    this.msgApplyVoucher,
    this.voucherResponse,
  });

  VoucherState copyWith({
    RequestStatus? onApplyVoucher,
    String? msgApplyVoucher,
    VoucherResponse? voucherResponse,
  }) {
    return VoucherState(
      onApplyVoucher: onApplyVoucher ?? this.onApplyVoucher,
      msgApplyVoucher: msgApplyVoucher ?? this.msgApplyVoucher,
      voucherResponse: voucherResponse ?? this.voucherResponse,
    );
  }

  @override
  List<Object?> get props => [
        onApplyVoucher,
        msgApplyVoucher,
        voucherResponse,
      ];
}
