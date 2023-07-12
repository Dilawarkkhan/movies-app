class UserModel {
  final String email;
  final Map<String, dynamic>? profileImage;
  final String firstName;
  final String lastName;

  UserModel({
    required this.email,
    required this.profileImage,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['data']['email'] as String,
      profileImage: json['data']['profileImage'] != null
          ? {
              'name': json['data']['profileImage']['name'] as String?,
              'path': json['data']['profileImage']['path'] as String?,
            }
          : null,
      firstName: json['data']['firstName'] as String,
      lastName: json['data']['lastName'] as String,
    );
  }
}
