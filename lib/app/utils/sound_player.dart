
import 'package:audioplayers/audioplayers.dart';


class SoundPlayer {
  late AudioPlayer audioPlayer;

  SoundPlayer._privateConstructor() {
    audioPlayer = AudioPlayer();
  }

  static final SoundPlayer _instance = SoundPlayer._privateConstructor();

  static SoundPlayer get instance => _instance;

  Future<void> play(String url) async {
    await audioPlayer.play(UrlSource(url));
  }
  Future<void> stop() async {
    await audioPlayer.stop();
  }
  Future<void> pause() async {
    await audioPlayer.pause();
  }
  Future<void> resume() async {
    await audioPlayer.resume();
  }
}
