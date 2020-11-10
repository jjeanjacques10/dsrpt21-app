import 'package:dsrpt21_app/app/models/production_line_model.dart';
import 'package:dsrpt21_app/app/services/production_line_service.dart';
import 'package:mobx/mobx.dart';
part 'production_line_store.g.dart';

class ProductionLineStore = _ProductionLineStoreBase with _$ProductionLineStore;

abstract class _ProductionLineStoreBase with Store {
  final ProductionLineService _prodService = ProductionLineService();
  List<ProductionLineModel> _listaCursoLocal = <ProductionLineModel>[];

  _ProductionLineStoreBase() {
    init();
  }

  init() async {
    isLoading = true;

    //Production List
    _listaCursoLocal = await _prodService.findAll();
    listaCurso = _listaCursoLocal.asObservable();

    isLoading = false;
  }

  @observable
  bool isLoading = false;

  @observable
  String filtro = "";

  @observable
  ObservableList<ProductionLineModel> listaCurso =
      <ProductionLineModel>[].asObservable();

  @action
  findAllCourses() async {
    init();
  }

  @action
  setFilter(value) {
    filtro = value;
  }

  @computed
  List<ProductionLineModel> get filtered {
    if (filtro.isEmpty) {
      return listaCurso;
    } else {
      var lista = listaCurso
          .where((curso) => curso.name.toLowerCase().contains(
                filtro.toLowerCase(),
              ))
          .toList();
      return lista;
    }
  }
}
