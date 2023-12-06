class UserData {
  final String? id;
  final String? openid;
  final dynamic unionid;
  final String? token;
  final dynamic thirdAccessToken;

  UserData({
    this.id,
    this.openid,
    this.unionid,
    this.token,
    this.thirdAccessToken,
  });

  UserData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        openid = json['openid'] as String?,
        unionid = json['unionid'],
        token = json['token'] as String?,
        thirdAccessToken = json['thirdAccessToken'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'openid': openid,
        'unionid': unionid,
        'token': token,
        'thirdAccessToken': thirdAccessToken
      };
}
