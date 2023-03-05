mixin Validators {
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value) ? null : 'Please enter a valid email address';
  }

  bool isValidEmail(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value);
  }

  bool isValidPassword(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    } else if (value.length < 8) {
      return false;
    }
    return true;
  }
}
