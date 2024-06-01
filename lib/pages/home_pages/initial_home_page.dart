import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/app_routes.dart';
import 'package:magicview/bloc/login_user_bloc/login_user_bloc.dart';
import 'package:magicview/pages/home_pages/components/my_text_form_field.dart';
import 'package:magicview/pages/home_pages/homepage.dart';

class InitialHomePage extends StatefulWidget {
  const InitialHomePage({super.key});

  @override
  State<InitialHomePage> createState() => _InitialHomePageState();
}

class _InitialHomePageState extends State<InitialHomePage> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff21005D),
      body: SafeArea(
          child: BlocListener<LoginUserBloc, LoginUserStateBloc>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state is LoginUserErrorState
                  ? 'Erro autenticação'
                  : " Logando ...")));
        },
        child: BlocBuilder<LoginUserBloc, LoginUserStateBloc>(
          builder: (context, state) {
            if (state is LoginUserSuccessState) {
              return const HomePage();
            }

            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 90),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/image/magicview.gif',
                        width: 336,
                        height: 171,
                      ),
                      Image.asset(
                        'assets/image/logo.png',
                        width: 369,
                        height: 85,
                      ),
                      MyTextFormField(
                        textEditingController: emailEditingController,
                        labelText: "E-mail",
                        icon: Icons.email,
                      ),
                      MyTextFormField(
                          textEditingController: passwordEditingController,
                          labelText: "Senha",
                          obscureText: true,
                          icon: Icons.key),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.read<LoginUserBloc>().add(
                                LoginUserEventSubmit(
                                    email: emailEditingController.text,
                                    password: passwordEditingController.text));
                          },
                          child: const Text(
                            "ACESSAR",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.addNewUser);
                          },
                          child: const Text(
                            "CRIAR CONTA",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      )),

      //<- place where the image appears
    );
  }
}
