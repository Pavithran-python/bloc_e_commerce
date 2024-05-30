

class Review{
  int? userId;
  int? userRating;
  String? userComment;

  Review({
    required this.userId,
    required this.userRating,
    required this.userComment
  });

  Review.fromJson({required Map<String,dynamic> reviewJson}){
    userId = reviewJson["user_id"];
    userRating = reviewJson["rating"];
    userComment = reviewJson["comment"];
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> reviewJson = {};
    reviewJson["user_id"] = userId;
    reviewJson["rating"] = userRating;
    reviewJson["comment"] = userComment;
    return reviewJson;
  }

}