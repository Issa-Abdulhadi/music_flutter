import 'package:flutter/material.dart';
import '../sound_list_page/sound_list_page.dart';

class HomePageRouter {
  static Map<int, Widget> homePageRouters = {
    0:  const SoundListPage(),
    1: const Center(
        child: Text(
      "Search",
      style: TextStyle(color: Colors.white),
    )),
    2: const Center(
        child: Text(
      "",
      style: TextStyle(color: Colors.white),
    )),
    3: const Center(
        child: Text(
      "Podcast",
      style: TextStyle(color: Colors.white),
    )),
    4: const Center(
        child: Text(
      "Settings",
      style: TextStyle(color: Colors.white),
    )),
  };
}
