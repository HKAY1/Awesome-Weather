class AppException implements Exception{
  final String ?message;
  final String ?prefix;
  final String ?url;

  AppException([this.message,this.prefix,this.url]);
}

class BadException extends AppException{
  BadException([ String ?message,String ?url]) : super(message, 'Bad Request', url);
}

class FtechException extends AppException{
  FtechException([String ?message,String ?url]) : super(message, 'Unable to process', url);
}

class ApiException extends AppException{
  ApiException([String ?message,String ?url]) : super(message, 'API not Responding', url);
}

class UnAuthException extends AppException{
  UnAuthException([String ?message,String ?url]) : super(message, 'Unauthorized Request', url);
}