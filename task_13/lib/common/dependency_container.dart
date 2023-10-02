class DependencyContainer {
  static final _dependencies = <Type, dynamic>{};

  static void register<T>(T instance) {
    _dependencies[T] = instance;
  }

  static T get<T>() {
    if (_dependencies.containsKey(T)) {
      return _dependencies[T];
    } else {
      throw Exception("Dependency of type $T not registered");
    }
  }
}
