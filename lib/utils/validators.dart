class Validators {

  static String? empty(String? value) {
    if (value == null) {
      return null;
    } else if (value.isEmpty) {
      return 'Field empty';
    }
    return null;
  }

}