import 'package:flutter/material.dart';

import '../utility/cores.dart';

/*
  *PAGINA DE LOGIN
*/

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
            height: 200,
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
              child: ListView(
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email) {
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Senna'),
                    obscureText: true,
                    autocorrect: false,
                    validator: (pass) {
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
                  SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Cores.primary),
                      child: const Text('Entrar'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
