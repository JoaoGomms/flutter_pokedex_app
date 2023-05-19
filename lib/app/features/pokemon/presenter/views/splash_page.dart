import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controllers/home_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final HomeController _homeController = GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    _homeController.fetchPokemons();

    Future.delayed(const Duration(seconds: 4), () => Navigator.pushReplacementNamed(context, '/home'));

    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
