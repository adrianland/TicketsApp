import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../app_config.dart';
import '../../tickets/cubit/ticket_cubit.dart';
import '../../tickets/repository/ticket_repository.dart';
import '../../tickets/repository/ticket_services.dart';

final getIt = GetIt.instance;
//TODO: IMPORTANTE usar lazy solo cuando sea necesario
setUp(AppConfig appConfig) {
  getIt.registerLazySingleton<AppConfig>(() => appConfig);
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerFactory(() => TicketServices(getIt.get<Dio>()));

  getIt.registerFactory<TicketCubit>(
        () => TicketCubit(
      getIt<TicketRepository>(),
    ),
  );

  getIt.registerFactory(
        () => TicketRepository(getIt<TicketServices>()),
  );


}
