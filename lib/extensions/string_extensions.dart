extension ValidatorUtils on String {
  bool validatePassword() {
    // Define the regular expression pattern to validate the password
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$',
    );

    // Check if the value matches the pattern
    if (!passwordRegExp.hasMatch(this)) {
      return false;
    }

    return true;
  }

  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool get isEmptyOrNull {
    return isEmpty;
  }

  String? get validCode {
    if (isEmptyOrNull) {
      return "This field is required";
    }
    return null;
  }

  String? get validName {
    if (isEmptyOrNull) {
      return "This field is required";
    }
    return null;
  }

  String? get validEmail {
    if (isEmptyOrNull) {
      return "This field is required";
    } else if (!isValidEmail()) {
      return 'LocaleKeys.invalid_email.tr()';
    }
    return null;
  }

  String get capitalizeByWord {
    if (trim().isEmpty) {
      return '';
    }
    return split(' ')
        .map((element) =>
            "${element[0].toUpperCase()}${element.substring(1).toLowerCase()}")
        .join(" ");
  }
}
