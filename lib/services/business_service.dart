import 'package:queer_world/models/entity/business_entity.dart';
import 'package:queer_world/repository/cud_repository.dart';

class LiveSessionDatabaseService {
  LiveSessionDatabaseService({required this.cudRepository});

  final CudRepository cudRepository;

  Future<void> save(BusinessEntity business) {
    return cudRepository.save(business.path, business);
  }
}
