import 'package:espot_power/index.dart';
import 'package:espot_power/utils/index.dart';

class UserProfileResponse {
  final int? id;
  final String? name;
  final String? tel;
  final dynamic money;
  final dynamic balanceAlt;
  final dynamic points;
  final dynamic getAllMoney;
  final dynamic deposit;
  final dynamic openid;
  final dynamic unionid;
  final dynamic shopId;
  final dynamic shopName;
  final dynamic language;
  final dynamic sessionKey;
  final dynamic area;
  final dynamic province;
  final dynamic countryCode;
  final String? headImageUrl;
  final String? gender;
  final dynamic age;
  final dynamic totalRentCount;
  final dynamic totalSpendMoney;
  final dynamic erroRentCount;
  final dynamic dayTime;
  final dynamic dayNums;
  final dynamic vip;
  final dynamic vipFlag;
  final dynamic platformId;
  final dynamic price0RentCount;
  final dynamic price99RentCount;
  final String? createTime;
  final String? updateTime;
  final dynamic appleId;
  final dynamic phoneNumRefuse;
  final String? password;
  final dynamic fictitiousMoney;
  final dynamic type;
  final dynamic memberStatus;
  final dynamic memberRank;
  final dynamic selfId;
  final String? email;
  final dynamic countryCodeNew;
  final String? dob;
  final String? address;

  UserProfileResponse({
    this.id,
    this.name,
    this.tel,
    this.money,
    this.balanceAlt,
    this.points,
    this.getAllMoney,
    this.deposit,
    this.openid,
    this.unionid,
    this.shopId,
    this.shopName,
    this.language,
    this.sessionKey,
    this.area,
    this.province,
    this.countryCode,
    this.headImageUrl,
    this.gender,
    this.age,
    this.totalRentCount,
    this.totalSpendMoney,
    this.erroRentCount,
    this.dayTime,
    this.dayNums,
    this.vip,
    this.vipFlag,
    this.platformId,
    this.price0RentCount,
    this.price99RentCount,
    this.createTime,
    this.updateTime,
    this.appleId,
    this.phoneNumRefuse,
    this.password,
    this.fictitiousMoney,
    this.type,
    this.memberStatus,
    this.memberRank,
    this.selfId,
    this.email,
    this.countryCodeNew,
    this.dob,
    this.address,
  });

  UserProfileResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        tel = json['tel'] as String?,
        money = json['money'],
        balanceAlt = json['balanceAlt'],
        points = json['points'],
        getAllMoney = json['getAllMoney'],
        deposit = json['deposit'],
        openid = json['openid'],
        unionid = json['unionid'],
        shopId = json['shopId'],
        shopName = json['shopName'],
        language = json['language'],
        sessionKey = json['sessionKey'],
        area = json['area'],
        province = json['province'],
        countryCode = json['countryCode'],
        headImageUrl = json['headImageUrl'] as String?,
        gender = json['gender'] as String?,
        age = json['age'],
        totalRentCount = json['totalRentCount'],
        totalSpendMoney = json['totalSpendMoney'],
        erroRentCount = json['erroRentCount'],
        dayTime = json['dayTime'],
        dayNums = json['dayNums'],
        vip = json['vip'],
        vipFlag = json['vipFlag'],
        platformId = json['platformId'],
        price0RentCount = json['price0RentCount'],
        price99RentCount = json['price99RentCount'],
        createTime = json['createTime'] as String?,
        updateTime = json['updateTime'] as String?,
        appleId = json['appleId'],
        phoneNumRefuse = json['phoneNumRefuse'],
        password = json['password'] as String?,
        fictitiousMoney = json['fictitiousMoney'],
        type = json['type'],
        memberStatus = json['memberStatus'],
        memberRank = json['memberRank'],
        selfId = json['selfId'],
        email = json['email'] as String?,
        countryCodeNew = json['countryCodeNew'],
        dob = json['dob'] as String?,
        address = json['address'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'tel': tel,
        'money': money,
        'balanceAlt': balanceAlt,
        'points': points,
        'getAllMoney': getAllMoney,
        'deposit': deposit,
        'openid': openid,
        'unionid': unionid,
        'shopId': shopId,
        'shopName': shopName,
        'language': language,
        'sessionKey': sessionKey,
        'area': area,
        'province': province,
        'countryCode': countryCode,
        'headImageUrl': headImageUrl,
        'gender': gender,
        'age': age,
        'totalRentCount': totalRentCount,
        'totalSpendMoney': totalSpendMoney,
        'erroRentCount': erroRentCount,
        'dayTime': dayTime,
        'dayNums': dayNums,
        'vip': vip,
        'vipFlag': vipFlag,
        'platformId': platformId,
        'price0RentCount': price0RentCount,
        'price99RentCount': price99RentCount,
        'createTime': createTime,
        'updateTime': updateTime,
        'appleId': appleId,
        'phoneNumRefuse': phoneNumRefuse,
        'password': password,
        'fictitiousMoney': fictitiousMoney,
        'type': type,
        'memberStatus': memberStatus,
        'memberRank': memberRank,
        'selfId': selfId,
        'email': email,
        'countryCodeNew': countryCodeNew,
        'dob': dob,
        'address': address
      };
}

extension UserProfileExt on UserProfileResponse {
  String? get getUserName => (name?.isNotEmpty ?? false) ? name : tel;

  String? get getMoneyMainAccount => money != null
      ? '${FormatUtils().formatNumberWithCommas(money).toString()}đ'
      : '0đ';

  String? get getMoneySecondAccount => balanceAlt != null
      ? '${FormatUtils().formatNumberWithCommas(balanceAlt).toString()}đ'
      : '0đ';

  String? get getEmail =>
      (email?.isNotEmpty ?? false) ? email : LocaleKeys.not_update_email.tr();

  String? get getDob =>
      (dob?.isNotEmpty ?? false) ? dob : LocaleKeys.not_update_birthday.tr();

  String? get getGender =>
      (gender?.isNotEmpty ?? false) ? gender : LocaleKeys.f_gender.tr();

  String? get getAddress =>
      (address != null) ? gender : LocaleKeys.f_address.tr();

  bool? get isVerifyUser =>
      (email != null) && (gender != null) && (address != null);
}
