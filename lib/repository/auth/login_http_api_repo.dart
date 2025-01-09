import '../../config/app_url.dart';
import '../../data/network/network_services_api.dart';
import '../../models/user/user_model.dart';
import 'login_repo.dart';

class LoginHttpApiRepo implements LoginRepo{

  final _api=NetworkServicesApi();

  @override
  Future<UserModel> loginApi(dynamic data) async {
    final response=await _api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}