import 'package:boilerplate/di/components/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String environment) =>
    $initGetIt(getIt, environment: environment);


abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}