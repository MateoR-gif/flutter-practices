import 'dart:math';

class PasswordGenerator {
  static String generatePassword({
    required int length,
    required bool useUpperCase,
    required bool useLowerCase,
    required bool useNumbers,
    required bool useSymbols,
  }) {
    String possibleChars = '';
    if (useUpperCase) possibleChars += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (useLowerCase) possibleChars += 'abcdefghijklmnopqrstuvwxyz';
    if (useNumbers) possibleChars += '0123456789';
    if (useSymbols) possibleChars += '!@#\$%^&*()-_+=';
    
    if (possibleChars.isEmpty) {
      throw ArgumentError("At least one option should be selected.");
    }

    String password = '';
    final Random random = Random();
    for (int i = 0; i < length; i++) {
      password += possibleChars[random.nextInt(possibleChars.length)];
    }
    return password;
  }
}