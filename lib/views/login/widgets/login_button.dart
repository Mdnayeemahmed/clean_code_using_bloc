import 'package:bloc_clean_coding/bloc/login_bloc.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  final fromkey;

  const LoginButton({super.key, this.fromkey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state.postApiStatus==PostApiStatus.error){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error.toString())),
          );
        }
        if(state.postApiStatus==PostApiStatus.loading){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("submitting..........")),
          );
        }
        if(state.postApiStatus==PostApiStatus.success){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("success..........")),
          );
        }
        // TODO: implement listener
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (current, previous) => false,

        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (fromkey.currentState!.validate()) {
                // Perform login action
                context.read<LoginBloc>().add(LoginApi());
              }
            },
            child: Text("Login"),
          );
        },
      ),
    );
  }
}
