import 'package:app_motus/ui/screens/login/sign_in_and_sign_up_viewmodel.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SignInAnSignUpViewModel>(
          builder: (context, viewModel, child) {
            viewModel.addListener(() {
              if(viewModel.user != null){
                context.beamToNamed('/home');
              }
            });
            if(viewModel.user == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        )
                    ),
                    TextField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        )
                    ),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.SignIn(email: emailController.value.text, password: passwordController.value.text);
                        },
                        child: const Text('Valider'))
                  ],
                ),
              );
            }
            return const Text('Bienvenue');
          }
      ),
    );
  }



}