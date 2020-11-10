import 'package:dsrpt21_app/app/models/robot_model.dart';
import 'package:dsrpt21_app/app/services/robot_service.dart';
import 'package:mobx/mobx.dart';
part 'robot_store.g.dart';

class RobotStore = _RobotStoreBase with _$RobotStore;

abstract class _RobotStoreBase with Store {
  final RobotService _robotService = RobotService();
  List<RobotModel> _listaCursoLocal = <RobotModel>[];

  _RobotStoreBase() {
    init();
  }

  init() async {
    isLoading = true;

    //Production List
    _listaCursoLocal = await _robotService.findAll();
    listaCurso = _listaCursoLocal.asObservable();

    isLoading = false;
  }

  @observable
  bool isLoading = false;

  @observable
  int filtro;

  @observable
  ObservableList<RobotModel> listaCurso = <RobotModel>[].asObservable();

  @action
  findAllCourses() async {
    init();
  }

  @action
  setFilter(value) {
    filtro = value;
  }

  @computed
  List<RobotModel> get filtered {
    if (filtro == null) {
      return listaCurso;
    } else {
      var lista =
          listaCurso.where((curso) => curso.productionLine == filtro).toList();
      return lista;
    }
  }
}
