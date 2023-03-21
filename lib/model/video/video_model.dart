class Video {
  String url;
  String publisher;
  String description;
  int likes;
  List<String> comments;

  late String duration;

  Video({
    required this.url,
    required this.publisher,
    required this.description,
    required this.likes,
    required this.comments,
  });
}
