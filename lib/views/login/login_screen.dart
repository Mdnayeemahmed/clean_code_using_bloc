import 'package:bloc_clean_coding/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final _formKey = GlobalKey<FormState>();
  final userFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserNameInputWidget(
                  userNameFocusNode: userFocusNode,
                ),
                SizedBox(height: 16.0),
                PasswordInputWidget(
                  passwordFocusNode: passwordFocusNode,
                ),
                SizedBox(height: 16.0),
                LoginButton(
                  fromkey: _formKey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
