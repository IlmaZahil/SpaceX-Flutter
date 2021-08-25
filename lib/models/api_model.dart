class Links {
  String mission_path;
  String mission_path_small;
  String article_link;

  Links({required this.mission_path, required this.mission_path_small, required this.article_link});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      mission_path: json['mission_path'],
      mission_path_small: json['mission_path_small'],
      article_link: json['article_link'],
    );
  }
}
