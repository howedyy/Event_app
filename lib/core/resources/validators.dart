abstract class Validator {
  static String? validateName(String? name){
    if(name == null || name.trim().isEmpty){
      return "Name is required";
    }if(name.length < 4){
      return "Name must be at least 4 char";
    }
    return null;
  }
  static String? validateEmail(String? email){
    RegExp regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(email == null || email.trim().isEmpty){
      return"E-mail is required";
    }
    if(!regExp.hasMatch(email)){
      return "Email Bad Format";
    }
    return null;
  }
  static String? validatePassword(String? password){
    RegExp regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if(password == null || password.trim().isEmpty){
      return "Password is required";
    }
    if(!regExp.hasMatch(password)){
      return "Weak password";
    }
    return null;
  }
}