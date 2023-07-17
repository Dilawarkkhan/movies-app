class UserModel {
  final String? email;
  final String? profileImage;
  final String? firstName;
  final String? lastName;
  // final String? token;

  UserModel({
    required this.email,
    required this.profileImage,
    required this.firstName,
    required this.lastName,
    // required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['data']?['email'] as String?,
      profileImage: json['data']?['profileImage']?['path'] as String?,
      firstName: json['data']?['firstName'] as String?,
      lastName: json['data']?['lastName'] as String?,
      // token: json['token'] as String?,
    );
  }
}
