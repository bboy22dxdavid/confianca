import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'basescreen.dart';
/*
  *PAGINA DE ABERTURA DO APP
*/

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
  Widget _introScreen(){
    return Stack(
      children: [
        SplashScreen(
          seconds: 3,
          gradientBackground: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffED213A),
              Color(0xff93291E)
            ]
          ),
          navigateAfterSeconds: BaseScreen(),
          loaderColor: Colors.transparent,
        ),
        const Padding(
          padding:  EdgeInsets.only(top: 200, left: 90),
          child:  Text(
            "Seja Bem vindo a!",
            style: TextStyle(
              color: Color(0xfffff8e1),
              fontSize: 24,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        Container(
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo-pequena.png"),
              fit: BoxFit.contain
            )
          ),
        ),
      ],
    );
  }
}
