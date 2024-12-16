import 'package:customer/view/auth/login/view/login_view.dart';
import 'package:flutter/material.dart';

import '../../view/intro/splash_view.dart';
import 'routes.dart';

class AppRoutes {
  static AppRoutes get init => AppRoutes._internal();
  String initial = NamedRoutes.splash;

  AppRoutes._internal();

  Map<String, Widget Function(BuildContext)> appRoutes = {
    NamedRoutes.splash: (c) => const SplashScreen(),
    NamedRoutes.login: (c) => const LoginView(),

    // NamedRoutes.answerQuestions: (c) => AnswerQuestionsView(type: c.arg['type'], id: c.arg['id']),
  };
}
