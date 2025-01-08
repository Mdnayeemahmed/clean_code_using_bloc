import 'package:bloc_clean_coding/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNameInputWidget extends StatelessWidget {
  final FocusNode userNameFocusNode;

  const UserNameInputWidget({super.key, required this.userNameFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (current,previous)=> current.userName!=previous.userName,
      builder: (context, state) {


        return TextFormField(
          focusNode: userNameFocusNode,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Username",
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            print(value);
            context.read<LoginBloc>().add(UserNameChanged(username: value));
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your username';
            }
            if (value.length < 4) {
              return 'Username must be at least 4 characters long';
            }
            if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
              return 'Username can only contain letters, numbers, and underscores';
            }
            return null;
          },
        );
      },
    );
  }
}
