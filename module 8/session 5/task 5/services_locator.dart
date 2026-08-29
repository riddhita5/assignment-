import 'package:get_it/get_it.dart';
import '../payment_service.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<PaymentService>(
        () => PaymentService(),
  );
}