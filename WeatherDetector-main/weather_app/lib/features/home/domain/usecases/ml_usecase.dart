import '../repos/ml_repo.dart';

class GetPredictionUseCase {
  final MLRepository repository;

  GetPredictionUseCase(this.repository);

  Future<int> call(List<int> features) {
    return repository.getPrediction(features);
  }
}
