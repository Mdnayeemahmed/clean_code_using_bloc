import 'package:bloc_clean_coding/config/app_url.dart';
import 'package:bloc_clean_coding/models/user/user_model.dart';

import '../../data/network/network_services_api.dart';

abstract class LoginRepo{

  @override
  Future<UserModel> loginApi(dynamic data) ;
}