class AppExceptions implements Exception{
  final _prefix;
  final _message;
  AppExceptions([this._prefix,this._message]);
  @override
  String toString(){
    return '$_prefix$_message';
  }

}
class InternetException extends AppExceptions{
  InternetException([String? message]):super(message,'No Internet');
}
class RequestException extends AppExceptions{
  RequestException([String? message]):super(message,'Request error');
}
class InternalException extends AppExceptions{
  InternalException([String? message]):super(message,'Internal exception');
}
class ServerException extends AppExceptions{
  ServerException([String? message]):super(message,'Server not found');
}
class InvalidUrlException extends AppExceptions{
  InvalidUrlException([String? message]):super(message,'Invalid url');
}
class FetchDataException extends AppExceptions{
  FetchDataException([String? message]):super(message,' ');
}
