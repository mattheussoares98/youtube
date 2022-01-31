import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube/pages/home_page.dart';
import 'package:youtube/providers/youtube_provider.dart';
import 'package:youtube/utils/app_routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => YoutubeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: APPROUTES.HOME,
        routes: {
          APPROUTES.HOME: (ctx) => const HomePage(),
        },
      ),
    ),
  );
}
//Map<String, Widget Function(BuildContext)>