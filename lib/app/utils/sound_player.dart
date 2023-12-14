
import 'package:audioplayers/audioplayers.dart';

class SoundPlayer {
  late AudioPlayer audioPlayer;
  final String url;

  SoundPlayer({required this.url}){
    audioPlayer = AudioPlayer();

  }

  Future<void> play() async {
    audioPlayer.play(UrlSource(url));
  }

  Future<void> stop() async {
    audioPlayer.stop();
  }
}
