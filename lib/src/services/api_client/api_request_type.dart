enum ApiRequestType {
  post,
  patch,
  put,
  get,
  delete,
}

class ApiRequestTypeString {
  ApiRequestTypeString._();

  static const String post = 'post';
  static const String patch = 'patch';
  static const String put = 'put';
  static const String get = 'get';
  static const String delete = 'delete';

  static String getApiRequestString({required ApiRequestType apiRequestType}) {
    switch (apiRequestType) {
      case ApiRequestType.post:
        return post;
      case ApiRequestType.patch:
        return patch;
      case ApiRequestType.put:
        return put;
      case ApiRequestType.get:
        return get;
      case ApiRequestType.delete:
        return delete;
    }
  }
}
