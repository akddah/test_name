import 'dart:async';

import 'package:customer/core/routes/app_routes_fun.dart';
import 'package:customer/core/routes/routes.dart';
import 'package:customer/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(3.seconds, () {
      pushAndRemoveUntil(NamedRoutes.login, arg: {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
