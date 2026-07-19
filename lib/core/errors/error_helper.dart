class ErrorHelper {
  static String? getMessage(dynamic data) {
    if (data == null) return null;

    if (data['errors'] != null) {
      return (data['errors'] as Map<String, dynamic>)
          .values
          .expand((e) => e as List)
          .first
          .toString();
    }

    return data['message']?.toString();
  }
}