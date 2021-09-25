List<T> dynamicToTypeList<T>(List<dynamic> o, T Function(dynamic) f) {
  List<T> l = [];
  o.forEach((d) => l.add(f(d)));
  return l;
}
