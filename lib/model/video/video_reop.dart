import 'package:tik_tok_clone/model/video/video_model.dart';

class VideoRepo {
  final _videoUrls = <String>[
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ];

  Future<List<Video>> fecthVideo() async {
    List<Video> videos = [];

    for (var vid in _videoUrls) {
      videos.add(
        Video(
          url: vid,
          publisher: "User",
          description: "Video description",
          likes: 1000,
          comments: ["a very good comment", "a very bad comment"],
        ),
      );
    }

    return videos;
  }
}
