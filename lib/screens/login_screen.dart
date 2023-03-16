import 'package:confianca/helpers/validators.dart';
import 'package:confianca/models/user.dart';
import 'package:confianca/models/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utility/cores.dart';

/*
  *PAGINA DE LOGIN
*/

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

   //variavel global de controle
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passController = TextEditingController();

   //variavel global para valid os campos do form
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Cores.primary,
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            decoration:const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/logo-pequena.png"),
                    fit: BoxFit.contain
                )
            ),
          ),
          const SizedBox(height: 16,),
          Center(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formkey,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(hintText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email) {
                        //verificando se email e valido
                        if(!emailValid(email!)) {
                          return 'E-mail inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: passController,
                      decoration: const InputDecoration(hintText: 'Senha'),
                      obscureText: true,
                      autocorrect: false,
                      validator: (pass) {
                        //verificando se a  senha e  valida
                        if (pass!.isEmpty || pass.length < 6) {
                          return 'Senha Inválida!';
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Cores.primary),
                        ),
                        onPressed: () {},
                        child: const Text('Esqueci Minha Senha'),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          //condição para validar os campos
                          if(formkey.currentState!.validate()){
                            /*debugando variavel p/ conferir se esta pegando o valor correto
                              *print('${emailController.text}  \n ${passController.text} ');
                             */

                            //autenticando e salvando emai e senha no banco
                            context.read<UserManager>().signIn(
                                userApp: UsersApp(
                                email: emailController.text,
                                password: passController.text
                              ),
                                failFunction: (e){
                                  //print('erro ao entra na função de onfail ${e} ');

                                  final snackBar = SnackBar(
                                    content:  Text('Falha ao entrar: $e'),
                                    backgroundColor: Colors.red,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                },
                                sucessFunction: (){
                                  //print('sucesso ao entra na função onSuccess !');
                                  // TODO: FECHAR TELA DE LOGIN
                                  const snackBar = SnackBar(
                                    content:   Text('sucesso ao Logar '),
                                    backgroundColor: Colors.green,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                }
                            );
                          }

                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Cores.primary),
                        child: const Text('Entrar',
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
