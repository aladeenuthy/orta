class Validator {
  static String? password(String? value, {String message = "Enter password"}) {
    if (value == null || value.isEmpty) {
      return message;
    } else if (value.length < 8) {
      return "Password should be atleast 8 characters long";
    } else if (!RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%\^&\*])",
    ).hasMatch(value)) {
      return "Password should contain at least one special character,a number,a lowercase letter and a capital letter";
    } else {
      return null;
    }
  }

  static String? range(String? value, {String message = "Invalid range"}) {
    if (value == null || value.isEmpty) {
      return message;
    }

    final List<String> parts = value.split("-");
    if (parts.length != 2) {
      return message;
    }

    final int? start = int.tryParse(parts[0]);
    final int? end = int.tryParse(parts[1]);

    if (start == null || end == null) {
      return message;
    }

    if (start >= end) {
      return "Start value must be less than end value";
    }

    return null;
  }

  static String? confrimPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Enter confrim password";
    } else if (value != password) {
      return "Passwords do not  match";
    } else {
      return null;
    }
  }

  static String? emptyField(
    String? value, {
    String message = 'Field cant"t be empty',
  }) {
    if (value?.isEmpty ?? true) {
      return message;
    } else {
      return null;
    }
  }

  static String? phone(String? value, {String message = "Enter phone number"}) {
    if (value!.isEmpty) {
      return "Field cannot be empty";
    } else if (value.length > 9 &&
        RegExp(
          r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$",
        ).hasMatch(value)) {
      return null;
    } else {
      return "Enter a valid phone number";
    }
  }

  static String? pin(String? value) {
    if (value!.isEmpty) {
      return "Field can not be empty";
    } else if (value.length > 4) {
      return "Pin must be 4";
    }
    return null;
  }

  static String? nonEmptyField(
    String? value, {
    String message = "Field cannot be empty",
  }) {
    if (value!.isEmpty) {
      return message;
    } else {
      return null;
    }
  }

  static String? emailValidator(String? value) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return "Field cannot be blank";
    } else if (!regex.hasMatch(value)) {
      return "Enter valid email address";
    }
    return null;
  }

  static String? validateBankAccountNumber(String? input) {
    if (input == null || input.isEmpty) {
      return "Field is required";
    }

    if (isNumber(input) != null) {
      return "Invalid bank account number";
    }
    if (input.length < 10) {
      return "Invalid Bank Account Number ";
    } else {
      return null;
    }
  }

  static String? emailOrPhoneNumberValidator(String? value) {
    if (value!.isEmpty) {
      return "Field cannot be blank";
    } else if (emailValidator(value) == null ||
        validatePhoneNumber(value) == null) {
      return null;
    } else {
      return "Not a valid phone number or email";
    }
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Field cannot be empty";
    }

    final cleaned = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    // UK formats: +447XXXXXXXXX, 07XXXXXXXXX, 447XXXXXXXXX
    if (!RegExp(r'^(\+44|44|0)7\d{9}$').hasMatch(cleaned)) {
      return "Enter a valid phone number";
    }

    return null;
  }

  static String? validateNIN(String? value) {
    if (value!.isEmpty) {
      return "Field cannot be empty";
    } else if (value.length == 11 &&
        RegExp(
          r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$",
        ).hasMatch(value)) {
      return null;
    } else {
      return "Enter a valid NIN";
    }
  }

  static String? length(String input, {required int length, String? message}) {
    if (input.length != length) {
      return message ?? "Should be $length characters";
    }
    return null;
  }

  static String? isNumber(String? input) {
    if (input == null || input.isEmpty) {
      return "Please Enter a Valid Number";
    }
    final double? value = double.tryParse(input);
    if (value != null) {
      return null;
    } else {
      return "Please Enter a Valid Number";
    }
  }

  static String? validateUKAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter an account number";
    }

    final RegExp numericRegex = RegExp(r"^[0-9]+$");
    if (!numericRegex.hasMatch(value)) {
      return "Account number must be numeric";
    }
    if (value.length < 6 || value.length > 8) {
      return "Account number must be between 6 and 8 digits";
    }
    return null;
  }

  static String? validateUKSortCode(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter routing number";
    }

    final RegExp numericRegex = RegExp(r"^\d{6}$");
    if (!numericRegex.hasMatch(value)) {
      return "Routing number must be a 6-digit number";
    }

    return null;
  }
}
