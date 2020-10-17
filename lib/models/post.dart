class Post {
  String id, title, content, dateWritten, image;
  int votesUp, votesDown;
  List<int> votersUp, votersDown;
  int userId, categoryId;
  Post({
    this.id,
    this.title,
    this.content,
    this.dateWritten,
    this.image,
    this.votesUp,
    this.votesDown,
    this.votersUp,
    this.votersDown,
    this.userId,
    this.categoryId,
  });

  // String get getDateWritten {
  //   return dateWritten;
  // }
}
