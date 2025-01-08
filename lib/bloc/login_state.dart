part of 'login_bloc.dart';

class LoginState extends Equatable{
  const LoginState({
    this.userName="",
    this.password="",
    this.postApiStatus=PostApiStatus.initial,
    this.error="",

  });

  final String userName;
  final String password;
  final String error;
  final PostApiStatus postApiStatus;

  LoginState copyWith({
     String? userName,
     String? password,
    PostApiStatus? postApiStatus,
    String? error,

  }){
    return LoginState(
    userName: userName??this.userName,
      password: password??this.password,
      postApiStatus: postApiStatus??this.postApiStatus,
      error: error??this.error
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [userName,password,postApiStatus,error];

}
