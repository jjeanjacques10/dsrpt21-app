// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_line_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductionLineStore on _ProductionLineStoreBase, Store {
  Computed<List<ProductionLineModel>> _$filteredComputed;

  @override
  List<ProductionLineModel> get filtered => (_$filteredComputed ??=
          Computed<List<ProductionLineModel>>(() => super.filtered,
              name: '_ProductionLineStoreBase.filtered'))
      .value;

  final _$isLoadingAtom = Atom(name: '_ProductionLineStoreBase.isLoading');

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

  final _$filtroAtom = Atom(name: '_ProductionLineStoreBase.filtro');

  @override
  String get filtro {
    _$filtroAtom.reportRead();
    return super.filtro;
  }

  @override
  set filtro(String value) {
    _$filtroAtom.reportWrite(value, super.filtro, () {
      super.filtro = value;
    });
  }

  final _$listaCursoAtom = Atom(name: '_ProductionLineStoreBase.listaCurso');

  @override
  ObservableList<ProductionLineModel> get listaCurso {
    _$listaCursoAtom.reportRead();
    return super.listaCurso;
  }

  @override
  set listaCurso(ObservableList<ProductionLineModel> value) {
    _$listaCursoAtom.reportWrite(value, super.listaCurso, () {
      super.listaCurso = value;
    });
  }

  final _$findAllCoursesAsyncAction =
      AsyncAction('_ProductionLineStoreBase.findAllCourses');

  @override
  Future findAllCourses() {
    return _$findAllCoursesAsyncAction.run(() => super.findAllCourses());
  }

  final _$_ProductionLineStoreBaseActionController =
      ActionController(name: '_ProductionLineStoreBase');

  @override
  dynamic setFilter(dynamic value) {
    final _$actionInfo = _$_ProductionLineStoreBaseActionController.startAction(
        name: '_ProductionLineStoreBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_ProductionLineStoreBaseActionController.endAction(_$actionInfo);
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
