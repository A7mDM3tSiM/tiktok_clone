import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tok_clone/controller/video_controller.dart';
import 'package:tik_tok_clone/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<VideoController>(
          create: (_) => VideoController(),
        ),
      ],
      child: const MaterialApp(
        title: 'TIKTOK CLONE',
        home: SplashScreen(),
      ),
    );
  }
}
