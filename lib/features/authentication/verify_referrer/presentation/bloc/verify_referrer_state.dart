part of 'verify_referrer_cubit.dart';

class VerifyReferrerState extends Equatable {
  final bool? isCheckFormatPhone;

  const VerifyReferrerState({
    this.isCheckFormatPhone,
  });

  VerifyReferrerState copyWith({
    bool? isCheckFormatPhone,
  }) {
    return VerifyReferrerState(
      isCheckFormatPhone: isCheckFormatPhone ?? this.isCheckFormatPhone,
    );
  }

  @override
  List<Object?> get props => [
        isCheckFormatPhone,
      ];
}
