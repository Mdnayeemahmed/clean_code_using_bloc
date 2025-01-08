part of 'login_bloc.dart';

abstract class LoginEvents extends Equatable {
  const LoginEvents();

  @override
  List<Object> get props => [];
}

class UserNameChanged extends LoginEvents{
  UserNameChanged({required this.username});
  final String username;
  @override
  List<Object> get props => [username];
}
class UserNameUnfocused extends LoginEvents{}
class PasswordUnfocused extends LoginEvents{}
class PasswordChanged extends LoginEvents{
  PasswordChanged({required this.password});
  final String password;
  @override
  List<Object> get props => [password];
}
class LoginApi extends LoginEvents{}
