class AppExceptions implements Exception {
  final _msg;
  final _prefix;

  AppExceptions([this._msg, this._prefix]);

  @override
  String toString() {
    return '$_msg $_prefix';
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? msg]) : super(msg, 'No Internet Connection');
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? msg]) : super(msg, 'User Not Found');
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? msg]) : super(msg, 'Request Time Out');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? msg]) : super(msg, '');
}
