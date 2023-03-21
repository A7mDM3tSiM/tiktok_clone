import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tik_tok_clone/model/video/video_reop.dart';
import 'package:video_player/video_player.dart';

import '../model/video/video_model.dart';

class VideoController extends ChangeNotifier {
  final videoControllers = <int, VideoPlayerController?>{};
  final vidRepo = VideoRepo();

  var currentIndex = 0;
  var isPlaying = false;

  late List<Video> videos;

  Future<void> fetchVideos() async {
    videos = await vidRepo.fecthVideo();
  }

  void playNextVid(int index) async {
    // dispose the controller before the previous video
    await _disposeAtIndex(index - 2);

    // stop the previious video
    await _pauseAtIndex(index - 1);

    // play the current video
    await _playAtIndex(index);

    // initilize the next video
    await _initlizeAtIndex(index + 1);

    notifyListeners();
  }

  void playPreviousVid(int index) async {
    // dispose the controller after the next video
    await _disposeAtIndex(index + 2);

    // pause the next video
    await _pauseAtIndex(index + 1);

    // play the current video
    await _playAtIndex(index);

    // initlize the previous video
    await _initlizeAtIndex(index - 1);

    notifyListeners();
  }

  Future<void> _initlizeAtIndex(int index) async {
    // safety check
    if (videos.length > index && index >= 0) {
      // create a controller
      final controller = VideoPlayerController.network(videos[index].url);
      videoControllers[index] = controller;
      // init and notify UI
      await videoControllers[index]?.initialize();

      log("Vid at $index initlized");
    }
  }

  Future<void> _playAtIndex(int index) async {
    // get the controller at and play the video
    if (videos.length > index && index > 0) {
      // play if isInilized and initilize if false
      if (videoControllers[index] != null ||
          videoControllers[index]!.value.isInitialized) {
        await videoControllers[index]?.play();
        await videoControllers[index]?.setLooping(true);
      } else {
        _initlizeAtIndex(index).then(
          (value) async {
            await videoControllers[index]?.play();
            await videoControllers[index]?.setLooping(true);
          },
        );
      }
    } else if (index == 0) {
      await _platAt0(index);
    }

    isPlaying = true;
    log("Vid at $index played");
  }

  Future<void> _platAt0(int index) async {
    if (videoControllers[0] != null &&
        videoControllers[0]!.value.isInitialized) {
      await videoControllers[0]?.play();
      await videoControllers[0]?.setLooping(true);
    } else {
      _initlizeAtIndex(0).then(
        (value) async {
          await videoControllers[0]?.play();
          await videoControllers[0]?.setLooping(true);
        },
      );
    }
  }

  Future<void> _pauseAtIndex(int index) async {
    if (videos.length > index && index >= 0) {
      await videoControllers[index]?.pause();

      log("Vid at $index pasued");
    }
  }

  Future<void> _disposeAtIndex(int index) async {
    if (videos.length > index && index >= 0) {
      await videoControllers[index]?.dispose();
      videoControllers[index] = null;

      log("Vid at $index disposed");
    }
  }
}
