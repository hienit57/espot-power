class LoginResponse {
  final int? status;
  final DataUserLogin? data;
  final String? token;
  final String? message;

  LoginResponse({
    this.status,
    this.data,
    this.token,
    this.message,
  });

  LoginResponse.fromJson(Map<String, dynamic> json)
      : status = json['Status'] as int?,
        data = (json['Data'] as Map<String, dynamic>?) != null
            ? DataUserLogin.fromJson(json['Data'] as Map<String, dynamic>)
            : null,
        token = json['AccessToken'] as String?,
        message = json['Message'] as String?;

  Map<String, dynamic> toJson() => {
        'Status': status,
        'Data': data?.toJson(),
        'AccessToken': token,
        'Message': message
      };
}

class DataUserLogin {
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final int? iD;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? dateOfBirth;
  final String? gender;
  final String? address;
  final int? roleID;
  final String? profileImageURL;

  String get fullName => '$firstName $lastName';

  DataUserLogin({
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.iD,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.gender,
    this.address,
    this.roleID,
    this.profileImageURL,
  });

  DataUserLogin.fromJson(Map<String, dynamic> json)
      : createdAt = json['CreatedAt'] as String?,
        updatedAt = json['UpdatedAt'] as String?,
        deletedAt = json['DeletedAt'],
        iD = json['ID'] as int?,
        firstName = json['FirstName'] as String?,
        lastName = json['LastName'] as String?,
        email = json['Email'] as String?,
        phoneNumber = json['PhoneNumber'] as String?,
        dateOfBirth = json['DateOfBirth'] as String?,
        gender = json['Gender'] as String?,
        address = json['Address'] as String?,
        roleID = json['RoleID'] as int?,
        profileImageURL = json['ProfileImageURL'] as String?;

  Map<String, dynamic> toJson() => {
        'CreatedAt': createdAt,
        'UpdatedAt': updatedAt,
        'DeletedAt': deletedAt,
        'ID': iD,
        'FirstName': firstName,
        'LastName': lastName,
        'Email': email,
        'PhoneNumber': phoneNumber,
        'DateOfBirth': dateOfBirth,
        'Gender': gender,
        'Address': address,
        'RoleID': roleID,
        'ProfileImageURL': profileImageURL
      };
}
