// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'robot_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RobotStore on _RobotStoreBase, Store {
  Computed<List<RobotModel>> _$filteredComputed;

  @override
  List<RobotModel> get filtered =>
      (_$filteredComputed ??= Computed<List<RobotModel>>(() => super.filtered,
              name: '_RobotStoreBase.filtered'))
          .value;

  final _$isLoadingAtom = Atom(name: '_RobotStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$filtroAtom = Atom(name: '_RobotStoreBase.filtro');

  @override
  int get filtro {
    _$filtroAtom.reportRead();
    return super.filtro;
  }

  @override
  set filtro(int value) {
    _$filtroAtom.reportWrite(value, super.filtro, () {
      super.filtro = value;
    });
  }

  final _$listaCursoAtom = Atom(name: '_RobotStoreBase.listaCurso');

  @override
  ObservableList<RobotModel> get listaCurso {
    _$listaCursoAtom.reportRead();
    return super.listaCurso;
  }

  @override
  set listaCurso(ObservableList<RobotModel> value) {
    _$listaCursoAtom.reportWrite(value, super.listaCurso, () {
      super.listaCurso = value;
    });
  }

  final _$findAllCoursesAsyncAction =
      AsyncAction('_RobotStoreBase.findAllCourses');

  @override
  Future findAllCourses() {
    return _$findAllCoursesAsyncAction.run(() => super.findAllCourses());
  }

  final _$_RobotStoreBaseActionController =
      ActionController(name: '_RobotStoreBase');

  @override
  dynamic setFilter(dynamic value) {
    final _$actionInfo = _$_RobotStoreBaseActionController.startAction(
        name: '_RobotStoreBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_RobotStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
filtro: ${filtro},
listaCurso: ${listaCurso},
filtered: ${filtered}
    ''';
  }
}
