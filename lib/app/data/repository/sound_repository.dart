import '../../domain/entites/sound_entity.dart';
import '../../utils/result.dart';

abstract class SoundRepository{
  Future<Result<List<SoundEntity>>> getSounds();
}