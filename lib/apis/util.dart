List<T> dynamicToTypeList<T>(List<dynamic> o, T Function(dynamic) f) {
  List<T> l = [];
  for (var d in o) {
    l.add(f(d));
  }
  return l;
}
