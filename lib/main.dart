import 'package:confianca/screens/intro_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /*
  *INICIANDO O FIREBASE
   */
  await Firebase.initializeApp();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: IntroScreen(),
  ));
  /*
  *ESTRUTURANDO E ADD NO BANCO
  * FIREBASE SALVAR AS ESTRUTURAS EM FORMAT DE MAP
   */
  //FirebaseFirestore.instance.collection('test').add({'test': 'test'});
}
