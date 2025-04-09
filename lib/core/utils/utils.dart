class Validators {
  static bool isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }
}

class Formatters {
  static String formatCurrency(double amount) {
    return "₹ ${amount.toStringAsFixed(2)}";
  }
}
