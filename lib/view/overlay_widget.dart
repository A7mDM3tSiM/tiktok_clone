import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../model/video/video_model.dart';

class VideoPage extends StatelessWidget {
  final VideoPlayerController currentVideo;
  final Video details;
  const VideoPage({
    super.key,
    required this.currentVideo,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Center(
              child: SizedBox(height: 300, child: VideoPlayer(currentVideo))),
          Padding(
            padding: EdgeInsets.all(h * 0.015),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: h * 0.07,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Following",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          height: h * 0.03,
                          width: 1,
                          margin: EdgeInsets.symmetric(horizontal: w * 0.05),
                          color: Colors.grey[300],
                        ),
                        const Text(
                          "For You",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        radius: h * 0.027,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: w * 0.017),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: h * 0.04,
                                ),
                                Text(
                                  details.likes.toString(),
                                  style: TextStyle(
                                    fontSize: h * 0.01,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.message_rounded,
                                  color: Colors.white,
                                  size: h * 0.04,
                                ),
                                Text(
                                  details.likes.toString(),
                                  style: TextStyle(
                                    fontSize: h * 0.01,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: h * 0.04,
                                ),
                                Text(
                                  details.likes.toString(),
                                  style: TextStyle(
                                    fontSize: h * 0.01,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              details.publisher,
                              style: TextStyle(
                                fontSize: h * 0.02,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: h * 0.005,
                            ),
                            Text(
                              details.description,
                              style: TextStyle(
                                fontSize: h * 0.015,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: h * 0.002,
                            ),
                            Text(
                              "Music details of the soundtrack",
                              style: TextStyle(
                                fontSize: h * 0.015,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: h * 0.025,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
