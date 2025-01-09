import 'package:another_flushbar/flushbar_helper.dart';
import 'package:bloc_clean_coding/bloc/login_bloc.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes/routes_name.dart';
import '../../../utils/flush_bar_helper.dart';

class LoginButton extends StatelessWidget {
  final fromkey;

  const LoginButton({super.key, this.fromkey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (current,previous) => current.postApiStatus!=previous.postApiStatus,
      listener: (context, state) {
        if(state.postApiStatus==PostApiStatus.error){
          FlushBarHelper.flushBarErrorMessage(state.error.toString(),context);
        }
        if(state.postApiStatus==PostApiStatus.success){
          Navigator.pushNamed(context, RoutesName.homeScreen);
          // FlushBarHelper.flushBarSuccessMessage(state.error.toString(),context);

     
        }
        // TODO: implement listener
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (current,previous) => current.postApiStatus!=previous.postApiStatus,


        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (fromkey.currentState!.validate()) {
                // Perform login action
                context.read<LoginBloc>().add(LoginApi());
              }
            },
            child: state.postApiStatus==PostApiStatus.loading?CircularProgressIndicator(): Text("Login"),
          );
        },
      ),
    );
  }
}
