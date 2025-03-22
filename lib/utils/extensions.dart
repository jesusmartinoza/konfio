extension TExtensions<T> on T {
  /// Kotlin equivalent of let function <3
  /// If optional value is not null then return it.
  R let<R>(R Function(T that) op) => op(this);
}
