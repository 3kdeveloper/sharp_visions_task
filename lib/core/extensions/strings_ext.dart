extension StringsExt on String {
  String toCapitalizeEveryWord() {
    if (isEmpty) return this;
    return split(" ")
        .map((word) {
          if (word.isNotEmpty) {
            return word[0].toUpperCase() + word.substring(1);
          }
          return word;
        })
        .join(" ");
  }

  /// All RegExp
  bool get isValidEmail => RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(this);
}
