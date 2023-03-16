import 'package:confianca/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../helpers/firebase_error.dart';

/*
  *PAGINA QUE GERENCIA OS USUARIOS
*/

class UserManager {
  //instanciando o Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //funcao de login
  Future<void> signIn({required UsersApp userApp, required Function failFunction, required Function sucessFunction}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword
        (email: userApp.email, password: userApp.password);
      //debugando  estrutura
      print('Sucesso ao logar: ${credential.user?.uid}');
      sucessFunction();
    } on FirebaseAuthException catch (e){
      //print('Erro ao tentar realizar o login ${getErrorString(e.code)}');
      failFunction(getErrorString(e.code));
    }

   }
}