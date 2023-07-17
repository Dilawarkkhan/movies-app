import 'package:movie_application/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('email', user.email ?? '');
    await sp.setString('profileImage', user.profileImage ?? '');
    await sp.setString('firstName', user.firstName ?? '');
    await sp.setString('lastName', user.lastName ?? '');
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? email = sp.getString('email');
    final String? profileImage = sp.getString('profileImage');
    final String? firstName = sp.getString('firstName');
    final String? lastName = sp.getString('lastName');

    return UserModel(
      email: email,
      profileImage: profileImage,
      firstName: firstName,
      lastName: lastName,
    );
  }


  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }
}
