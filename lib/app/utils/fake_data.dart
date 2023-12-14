import 'package:music_flutter/app/data/models/sound_model.dart';

class FakeData {
  static List<SoundModel> getFakeSoundList() {
    return [
      SoundModel(
          title: "Bailando",
          artist: "Billy Ray Cyrus",
          artistImage: "assets/sound_icon.jpg",
          durationInSeconds: 330),
      SoundModel(
          title: "Cuando Me Enamoron",
          artist: "Mabel",
          artistImage: "assets/sound_icon2.jpg",
          durationInSeconds: 370),
      SoundModel(
          title: "Dirty Dancer",
          artist: "Alec Benjamin",
          artistImage: "assets/sound_icon3.jpg",
          durationInSeconds: 250),
      SoundModel(
          title: "Finally Found You",
          artist: "Alec Benjamin",
          artistImage: "assets/sound_icon4.jpg",
          durationInSeconds: 370),
      SoundModel(
          title: "Heart Attack",
          artist: "Bazzi",
          artistImage: "assets/sound_icon5.jpeg",
          durationInSeconds: 440),
      SoundModel(
          title: "Heartbeat",
          artist: "Jonas Brothers",
          artistImage: "assets/sound_icon.jpg",
          durationInSeconds: 360),
      SoundModel(
          title: "Hero",
          artist: "BLACKPINK",
          artistImage: "assets/sound_icon2.jpg",
          durationInSeconds: 144),
      SoundModel(
          title: "Move To Miami",
          artist: "BLACKPINK",
          artistImage: "assets/sound_icon3.jpg",
          durationInSeconds: 987),
      SoundModel(
          title: "Finally Found You",
          artist: "Alec Benjamin",
          artistImage: "assets/sound_icon4.jpg",
          durationInSeconds: 456),
      SoundModel(
          title: "Heart Attack",
          artist: "Bazzi",
          artistImage: "assets/sound_icon5.jpeg",
          durationInSeconds: 789),
      SoundModel(
          title: "Heartbeat",
          artistImage: "assets/sound_icon2.jpg",
          artist: "Jonas Brothers",
          durationInSeconds: 55),
      SoundModel(
        title: "Hero",
        artist: "BLACKPINK",
        artistImage: "assets/sound_icon3.jpg",
        durationInSeconds: 180,
      ),
      SoundModel(
        title: "Move To Miami",
        artist: "BLACKPINK",
        artistImage: "assets/sound_icon4.jpg",
        durationInSeconds: 333,
      ),
    ];
  }
}
