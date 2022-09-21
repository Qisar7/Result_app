class Validator {
  String isempty = 'field can\t be Empty!';

  // validatname(String val) {
  //   if (val.isEmpty) {
  //     return isempty;
  //   } else {
  //     return '';
  //   }
  // }

  vlaidatemail(String val) {
    if (val.isEmpty) {
      return isempty;
    } else if (!val.contains(RegExp(r'\@'))) {
      return 'add true Eamil ex@ex.com !';
    } else {
      return;
    }
  }

  validatepassword(String val) {
    if (val.isEmpty) {
      return isempty;
    }
    if (val.length < 6) {
      return 'your password is less than 8';
    }
  }
}
