import 'package:music_flutter/app/data/repository/sound_repository.dart';
import 'package:music_flutter/app/domain/entites/sound_entity.dart';
import 'package:music_flutter/app/utils/result.dart';

class GetSoundsUseCase {
  GetSoundsUseCase({required this.soundRepository});

  final SoundRepository soundRepository;

  Future<Result<List<SoundEntity?>>> call() async {
    return await soundRepository.getSounds();
  }
}
