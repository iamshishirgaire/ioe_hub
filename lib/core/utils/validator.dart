String? isValidEmail(String? email) {
  if (email == null || email.isEmpty) {
    return "Enter an email";
  }
  RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    caseSensitive: false,
  );

  return !emailRegex.hasMatch(email) ? "Enter a valid email" : null;
}
