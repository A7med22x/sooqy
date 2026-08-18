class APIConstants {
  static const String baseUrl = 'https://accessories-eshop.runasp.net/api/';
  static const String tokenHeaderKey = 'token';
  static const String registerEndpoint = 'auth/register';
  static const String loginEndpoint = 'auth/login';
  static const String refreshTokenEndpoint = 'auth/refresh-token';
  static const String verifyEmailEndpoint = 'auth/verify-email';
  static const String resendOtpEndpoint = 'auth/resend-otp';
  static const String forgotPasswordEndpoint = 'auth/forgot-password';
  static const String validateOtpEndpoint = 'auth/validate-otp';
  static const String resetPasswordEndpoint = 'auth/reset-password';
  static const String getUserEndpoint = 'auth/me';
  static const String categoriesEndpoint = 'categories';
  static const String productsEndpoint = 'products';
  static const String reviewsEndpoint = 'reviews';
  static const String getCartEndpoint = 'cart';
  static const String offersEndpoint = 'offers';
  static const String notificationsEndpoint = 'notifications';
  static const String addItemToCartEndpoint = 'cart/items/';
  static const String increme1ToItemInCartEndpoint = 'cart/items';
  static const String decreme1FromItemInCartEndpoint = 'cart/items/decrement';
  static const String removeItemFromCartEndpoint = 'cart/items/';
}

class CacheKeys {
  static const String refreshToken = 'refreshToken';
  static const String accessToken = 'accessToken';
}
