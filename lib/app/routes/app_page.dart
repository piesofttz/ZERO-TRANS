import 'package:get/get.dart';

import '../../feature/auth/login/binding/login_binding.dart';
import '../../feature/auth/login/screen/login_screen.dart';
import '../../feature/bus/binding/bus_binding.dart';
import '../../feature/bus/screen/bus_screen.dart';
import '../../feature/main_screen/binding/main_binding.dart';
import '../../feature/main_screen/screen/main_screen.dart';
import '../../feature/onboarding/binding/onboarding_binding.dart';
import '../../feature/onboarding/screen/onboarding_screen.dart';
import '../../feature/splash/binding/splash_binding.dart';
import '../../feature/splash/screen/splash_screen.dart';
import '../../feature/ticket/binding/ticket_binding.dart';
import '../../feature/ticket/screen/ticket_screen.dart';
import 'app_route.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.bus,
      page: () => const BusScreen(),
      binding: BusBinding(),
    ),
    GetPage(
      name: Routes.ticket,
      page: () => const TicketScreen(),
      binding: TicketBinding(),
    ),
  ];
}
