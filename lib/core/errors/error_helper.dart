class ErrorHelper {
  static String? getMessage(dynamic data) {
    if (data == null) return null;

    if (data is String) {
      return data;
    }

    if (data is! Map<String, dynamic>) {
      return data.toString();
    }

    if (data['errors'] != null && data['errors'] is Map<String, dynamic>) {
      return (data['errors'] as Map<String, dynamic>).values
          .expand((e) => e as List)
          .first
          .toString();
    }

    return data['message']?.toString();
  }
}
