import 'package:music_flutter/app/data/models/sound_model.dart';
import 'package:music_flutter/app/data/repository/sound_repository.dart';
import 'package:music_flutter/app/domain/entites/sound_entity.dart';
import 'package:music_flutter/app/utils/fake_data.dart';
import 'package:music_flutter/app/utils/result.dart';

class FakeSoundRepositoryImpl extends SoundRepository {
  @override
  Future<Result<List<SoundEntity>>> getSounds() async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.guardFuture(() async {
      List<SoundModel> sounds = FakeData.getFakeSoundList();
      List<SoundEntity> entitiesSound =
          sounds.map((sound) => SoundEntity.from(sound)).toList();
      return entitiesSound;
    });
  }
}
