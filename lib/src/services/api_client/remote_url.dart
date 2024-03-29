class RemoteUrl {
  RemoteUrl();

  static String baseUrl = 'https://api-todo-list.jotno.dev/';
  static String loginUrl = '${baseUrl}user/login/';
  static String createUserUrl = '${baseUrl}user/register/';
  static String createTask = '${baseUrl}task/';
  static String profileInfo = '${baseUrl}user/me';
  static String profileImage = '${baseUrl}user/me/avatar';
}
