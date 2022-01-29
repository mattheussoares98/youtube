import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube/pages/home_page.dart';
import 'package:youtube/providers/youtube_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => YoutubeProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    ),
  );
}
