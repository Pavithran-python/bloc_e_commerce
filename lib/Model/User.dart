
class User{
  int? userId;
  String? userName;
  String? emailId;
  String? password;

  User({
    required this.userId,
    required this.userName,
    required this.emailId,
    required this.password
  });

  User.fromJson({required Map<String,dynamic> userJson}){
    userId = userJson["user_id"];
    userName = userJson["username"];
    emailId = userJson["email"];
    password = userJson["password"];
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> userJson = {};
    userJson["user_id"] = userId;
    userJson["username"] = userName;
    userJson["email"] = emailId;
    userJson["password"] = password;
    return userJson;
  }

}