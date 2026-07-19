class Validator {
  static String? validateEmail(String? val) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null || val.trim().isEmpty) {
      return 'this field is required';
    } else if (emailRegex.hasMatch(val.trim()) == false) {
      return 'enter valid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'this field is required';
    } else if (val.length < 8) {
      return 'password must be at least 8 characters';
    } else if (!RegExp(r'[A-Z]').hasMatch(val)) {
      return 'password must contain at least 1 uppercase letter';
    } else if (!RegExp(r'[a-z]').hasMatch(val)) {
      return 'password must contain at least 1 lowercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(val)) {
      return 'password must contain at least 1 digit';
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>_\-+=/\\[\]~`]').hasMatch(val)) {
      return 'password must contain at least 1 special character';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.trim().isEmpty) {
      return 'this field is required';
    } else if (val != password) {
      return 'passwords do not match';
    } else {
      return null;
    }
  }

  static String? validateUsername(String? val) {
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null || val.trim().isEmpty) {
      return 'this field is required';
    } else if (val.length < 3) {
      return 'username must be at least 3 characters';
    } else if (!usernameRegex.hasMatch(val.trim())) {
      return 'enter valid username';
    } else {
      return null;
    }
  }

  static String? validateFullName(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'this field is required';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'this field is required';
    } else if (int.tryParse(val.trim()) == null) {
      return 'enter numbers only';
    } else if (val.trim().length != 11) {
      return 'enter value must equal 11 digit';
    } else {
      return null;
    }
  }
}
