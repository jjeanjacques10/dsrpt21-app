import 'package:dio/dio.dart';

import 'package:dsrpt21_app/app/models/robot_model.dart';
import 'package:dsrpt21_app/app/services/service_config.dart';

class RobotService {
  static final String _endpoint =
      "https://5eccfb2c7c528e00167ccef6.mockapi.io/fiap/";

  static final String _resource = 'robots';

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<RobotModel>> findAll() async {
    //await Future.delayed(Duration(seconds: 2));

    List<RobotModel> lista = new List<RobotModel>();

    try {
      Response response = await service.create().get(_resource);
      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            lista.add(
              RobotModel.fromJson(value),
            );
          },
        );
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }

    return lista;
  }

  Future<int> create(RobotModel robotModel) async {
    try {
      Response response = await service.create().post(
            _resource,
            data: robotModel.toJson(),
          );

      if (response.statusCode == 201) {
        var retorno = (response.data["id"] is String)
            ? int.parse(response.data["id"])
            : response.data["id"];
        return retorno;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<RobotModel> getById(int id) async {
    try {
      String endpoint = _resource + "/" + id.toString();
      Response response = await service.create().get(endpoint);

      if (response.statusCode == 200) {
        var retorno = RobotModel.fromJson(response.data);
        return retorno;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<int> update(RobotModel robotModel) async {
    try {
      String endpoint = _resource + "/" + robotModel.id.toString();

      Response response = await service.create().put(
            endpoint,
            data: robotModel.toJson(),
          );

      var retorno = (response.data["id"] is String)
          ? int.parse(response.data["id"])
          : response.data["id"];
      return retorno;
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<void> delete(RobotModel robotModel) async {
    try {
      String endpoint = _resource + "/" + robotModel.id.toString();

      Response response = await service.create().delete(
            endpoint,
          );

      if (response.statusCode != 200) {
        throw Exception("Não foi possível excluir o recurso!");
      }
    } catch (error) {
      throw error;
    }
  }
}
