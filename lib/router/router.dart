import 'package:e_commerces/page/cart/cart_page.dart';
import 'package:e_commerces/page/dashboard.dart';
import 'package:e_commerces/page/home/home_page.dart';
import 'package:e_commerces/page/splash/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../page/login.dart';
import '../page/register.dart';

routes() => [
      GetPage(name: "/dashboard", page: () => const DashBoardPage()),
      GetPage(name: "/login", page: () => const LoginPage()),
      GetPage(name: "/register", page: () => const RegisterPage()),
      GetPage(name: "/home", page: () => const HomePage()),
      GetPage(name: "/splash", page: () => const SplashScreen()),
      GetPage(name: "/cart", page: () => const CartPage()),
    ];
