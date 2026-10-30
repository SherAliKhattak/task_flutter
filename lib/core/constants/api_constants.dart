abstract final class ApiConstants {
  static const baseUrl = 'https://dummyjson.com';
  static const login = '/auth/login';
  static const refresh = '/auth/refresh';
  static const products = '/products';

  static const connectTimeout = Duration(seconds: 15);
  static const receiveTimeout = Duration(seconds: 20);
}
