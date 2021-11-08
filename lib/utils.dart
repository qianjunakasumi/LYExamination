List<T> list2List<S, T>(List<S> s, T Function(S) f) {
  List<T> t = [];
  for (S e in s) {
    t.add(f(e));
  }
  return t;
}
