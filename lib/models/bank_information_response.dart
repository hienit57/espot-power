class BankInformationResponse {
  final int? id;
  final int? bankId;
  final String? bankCode;
  final String? ownerName;
  final String? account;
  final String? bankName;
  final String? bankImageUrl;
  final int? fastTransferSupported;
  final bool? supportFastTransfer;

  BankInformationResponse({
    this.id,
    this.bankId,
    this.bankCode,
    this.ownerName,
    this.account,
    this.bankName,
    this.bankImageUrl,
    this.fastTransferSupported,
    this.supportFastTransfer,
  });

  BankInformationResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        bankId = json['bankId'] as int?,
        bankCode = json['bankCode'] as String?,
        ownerName = json['ownerName'] as String?,
        account = json['account'] as String?,
        bankName = json['bankName'] as String?,
        bankImageUrl = json['bankImageUrl'] as String?,
        fastTransferSupported = json['fastTransferSupported'] as int?,
        supportFastTransfer = json['supportFastTransfer'] as bool?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'bankId': bankId,
        'bankCode': bankCode,
        'ownerName': ownerName,
        'account': account,
        'bankName': bankName,
        'bankImageUrl': bankImageUrl,
        'fastTransferSupported': fastTransferSupported,
        'supportFastTransfer': supportFastTransfer,
      };
}
