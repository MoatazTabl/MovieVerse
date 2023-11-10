extension FormValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isValidPass() {
    return RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$")
        .hasMatch(this);
  }
}

class FormValidate
{

  static String? userNameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Field Cannot Be Empty";
    }
    if (value.length < 3) {
      return "Username Cannot be less than 3 letters";
    }
    return null;
  }

  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Field cannot be empty";
    } else if (!value.isValidEmail()) {
      return "Email is incorrect";
    }
    return null;
  }

  static String? passValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Field cannot be empty";
    }
    if (value.length < 8) {
      return "Password must be more than 8 letters";
    } else if (!value.isValidPass()) {
      return "Must have at least 1 Upper Case,1 Lower Case,1 Digit.";
    }
    return null;
  }


}