typedef LMap = Map<String, dynamic>;

List<T> list2List<S, T>(List<S> s, T Function(S) f) {
  List<T> t = [];
  for (final e in s) {
    t.add(f(e));
  }
  return t;
}

List<T> dynamicList2List<T>(List<dynamic> s, T Function(dynamic) f) =>
    list2List<dynamic, T>(s, f);
