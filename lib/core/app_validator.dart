class AppValidator {
 static const Pattern _emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static String? isEmpty(String? value) {
    value ??= '';
    if (value.trim().isEmpty) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  static String? isEmailValid(String? email) {
    RegExp regex = RegExp(_emailPattern.toString());
    if (email!.trim().isEmpty) {
      return "Email field is required";
    } else if (!regex.hasMatch(email)) {
      return "Enter a valid email";
    } else {
      return null;
    }
  }
}
