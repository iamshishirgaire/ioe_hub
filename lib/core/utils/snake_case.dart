String toTitleCase(String input) {
  //handle empty string
  if (input.isEmpty) {
    return '';
  }
  // Split the input string by underscores
  List<String> parts = input.split('_');

  // Check if the last part is a Roman numeral
  String lastPart = parts.last;
  bool isRomanNumeral = RegExp(r'^(i|ii|iii|iv|v)$').hasMatch(lastPart);

  // Capitalize the first letter of each part
  List<String> capitalizedParts = parts.map((part) {
    // Capitalize the first letter and make the rest lowercase, except for Roman numerals
    if (part == lastPart && isRomanNumeral) {
      return part.toUpperCase();
    } else {
      return '${part[0].toUpperCase()}${part.substring(1).toLowerCase()}';
    }
  }).toList();

  // Join the parts with spaces
  return capitalizedParts.join(' ');
}
