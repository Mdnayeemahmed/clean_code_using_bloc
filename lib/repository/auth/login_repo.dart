import 'package:bloc_clean_coding/config/app_url.dart';
import 'package:bloc_clean_coding/models/user/user_model.dart';

import '../../data/network/network_services_api.dart';

class LoginRepo{

  final _api=NetworkServicesApi();

  Future<UserModel> loginApi(dynamic data) async {
    final response=await _api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}