String? enumToString(dynamic e) {
  if (e == null) {
    return null;
  }
  return e.toString().split('.').last;
}

extension StringExtension on String {
  T? toEnum<T>(List<T> list) {
    try {
      final T item = list.firstWhere(
        (T e) {
          final String t = e.toString().split('.').last;
          return t == this;
        },
      );
      return item;
    } catch (_) {}
    return null;
  }

  String pageParams([Map<String, String> params = const {}]) {
    var router = this;
    if (params.isNotEmpty) {
      params.forEach((key, value) {
        if (key == params.keys.first) {
          router = '$router?$key=$value';
        } else {
          router = '$router&$key=$value';
        }
      });
    }
    return router;
  }
}
