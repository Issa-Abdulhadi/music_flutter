import 'package:music_flutter/app/data/models/sound_model.dart';

class FakeData {
  static List<SoundModel> getFakeSoundList() {
    return [
      SoundModel(
          title: "Bailando",
          artist: "Billy Ray Cyrus",
          artistImage: "assets/sound_icon.jpg",
          soundUrl:
              "https://cdn.pixabay.com/audio/2022/07/30/audio_7f3a11bfee.mp3",
          durationInSeconds: 172),
      SoundModel(
          title: "Cuando Me Enamoron",
          artist: "Mabel",
          soundUrl:
              "https://cdn.pixabay.com/audio/2022/07/13/audio_75c818dbe1.mp3",
          artistImage: "assets/sound_icon2.jpg",
          durationInSeconds: 144),
      SoundModel(
          title: "Dirty Dancer",
          artist: "Alec Benjamin",
          artistImage: "assets/sound_icon3.jpg",
          soundUrl:
              "https://cdn.pixabay.com/audio/2023/11/07/audio_98baaf335f.mp3",
          durationInSeconds: 94),
      SoundModel(
          title: "Finally Found You",
          artist: "Alec Benjamin",
          soundUrl:
              "https://cdn.pixabay.com/audio/2022/07/30/audio_7f3a11bfee.mp3",
          artistImage: "assets/sound_icon4.jpg",
          durationInSeconds: 172),
      SoundModel(
          title: "Heart Attack",
          artist: "Bazzi",
          artistImage: "assets/sound_icon5.jpeg",
          soundUrl:
              "https://cdn.pixabay.com/audio/2022/07/13/audio_75c818dbe1.mp3",
          durationInSeconds: 144),
      SoundModel(
          title: "Heartbeat",
          artist: "Jonas Brothers",
          artistImage: "assets/sound_icon.jpg",
          soundUrl:
              "https://cdn.pixabay.com/audio/2023/11/07/audio_98baaf335f.mp3",
          durationInSeconds: 94),
      SoundModel(
          title: "Hero",
          artist: "BLACKPINK",
          artistImage: "assets/sound_icon2.jpg",
          soundUrl:
              "https://cdn.pixabay.com/audio/2022/07/13/audio_75c818dbe1.mp3",
          durationInSeconds: 144),
      SoundModel(
          title: "Move To Miami",
          artist: "BLACKPINK",
          soundUrl:
              "https://cdn.pixabay.com/audio/2022/07/30/audio_7f3a11bfee.mp3",
          artistImage: "assets/sound_icon3.jpg",
          durationInSeconds: 172),
      SoundModel(
          title: "Finally Found You",
          artist: "Alec Benjamin",
          artistImage: "assets/sound_icon4.jpg",
          soundUrl:
              "https://cdn.pixabay.com/audio/2023/11/07/audio_98baaf335f.mp3",
          durationInSeconds: 94),
      SoundModel(
          title: "Heart Attack",
          artist: "Bazzi",
          soundUrl:
              "https://cdn.pixabay.com/audio/2023/07/14/audio_badef25759.mp3",
          artistImage: "assets/sound_icon5.jpeg",
          durationInSeconds: 133),
      SoundModel(
          title: "Heartbeat",
          artistImage: "assets/sound_icon2.jpg",
          artist: "Jonas Brothers",
          soundUrl:
              "https://cdn.pixabay.com/audio/2022/07/30/audio_7f3a11bfee.mp3",
          durationInSeconds: 172),
      SoundModel(
        title: "Hero",
        artist: "BLACKPINK",
        soundUrl:
            "https://cdn.pixabay.com/audio/2023/07/14/audio_badef25759.mp3",
        artistImage: "assets/sound_icon3.jpg",
        durationInSeconds: 133,
      ),
      SoundModel(
        title: "Move To Miami",
        artist: "BLACKPINK",
        artistImage: "assets/sound_icon4.jpg",
        soundUrl:
            "https://cdn.pixabay.com/audio/2022/07/13/audio_75c818dbe1.mp3",
        durationInSeconds: 144,
      ),
    ];
  }
}
