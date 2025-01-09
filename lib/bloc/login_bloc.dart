import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/repository/auth/login_repo.dart';
import 'package:bloc_clean_coding/services/session_manager/session_controller.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginRepo loginRepo;


  LoginBloc({required this.loginRepo}) : super(LoginState()) {
    on<UserNameChanged>(_onUserNameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_onLoginApi);
  }

  void _onUserNameChanged(UserNameChanged event,Emitter<LoginState> emit){
    print(event.username);
    emit(state.copyWith(userName: event.username));
  }
  void _onPasswordChanged(PasswordChanged event,Emitter<LoginState> emit){
    print(event.password);

    emit(state.copyWith(password: event.password));
  }

  Future<void> _onLoginApi(LoginApi event,Emitter<LoginState> emit) async {
    Map data={
      "username": state.userName,
      "password": state.password,
      "expiresInMins": 30
    };
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));


    await loginRepo.loginApi(data).then((value) async{
      if(value.message.isNotEmpty){
        emit(state.copyWith(error: value.message.toString(),postApiStatus: PostApiStatus.error));


      }else{
        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreference();
        emit(state.copyWith(error:"Success",postApiStatus: PostApiStatus.success));
      }

    }).onError((error,StackTrace){
      emit(state.copyWith(error: error.toString(),postApiStatus: PostApiStatus.error));

    });
  }
}
