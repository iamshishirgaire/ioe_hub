String separateLettersDigits(String input) {
  // Use a regular expression to extract the numeric part
  final regExp = RegExp(r'(\d+)sem');
  final match = regExp.firstMatch(input);

  // If a match is found, format the output
  if (match != null) {
    final semesterNumber = match.group(1);
    return 'Semester $semesterNumber';
  }

  // Return the original input if it doesn't match the pattern
  return input;
}
