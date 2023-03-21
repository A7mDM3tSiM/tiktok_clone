import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tok_clone/controller/video_controller.dart';
import 'package:tik_tok_clone/view/overlay_widget.dart';
import 'package:video_player/video_player.dart';

class ForYouPage extends StatefulWidget {
  const ForYouPage({super.key});

  @override
  State<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final vid = Provider.of<VideoController>(context, listen: false);
      vid.playNextVid(0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Consumer<VideoController>(
        builder: (context, vid, _) => Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: vid.videoControllers.length,
                onPageChanged: (index) {
                  if (vid.currentIndex < index) {
                    vid.playNextVid(index);
                  } else {
                    vid.playPreviousVid(index);
                  }

                  vid.currentIndex = index;
                },
                itemBuilder: (context, index) {
                  final currentVideo = vid.videoControllers[index];
                  return currentVideo != null &&
                          currentVideo.value.isInitialized
                      ? GestureDetector(
                          onTap: () {
                            if (vid.isPlaying) {
                              currentVideo.pause();
                              vid.isPlaying = false;
                            } else {
                              currentVideo.play();
                              currentVideo.setLooping(true);
                              vid.isPlaying = true;
                            }
                          },
                          child: VideoPage(
                            currentVideo: currentVideo,
                            details: vid.videos[index],
                          ),
                        )
                      : Container(
                          color: Colors.grey[900],
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
