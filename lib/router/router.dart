import 'package:e_commerces/page/dashboard.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../page/login.dart';
import '../page/register.dart';

routes() => [
      GetPage(name: "/dashboard", page: () => const DashBoardPage()),
      GetPage(name: "/login", page: () => const LoginPage()),
      GetPage(name: "/register", page: () => const RegisterPage()),
    ];
