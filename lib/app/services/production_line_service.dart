import 'package:dio/dio.dart';
import 'package:dsrpt21_app/app/models/production_line_model.dart';
import 'package:dsrpt21_app/app/services/service_config.dart';

class ProductionLineService {
  static final String _endpoint =
      "https://5eccfb2c7c528e00167ccef6.mockapi.io/fiap/";

  static final String _resource = 'production_lines';

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<ProductionLineModel>> findAll() async {
    //await Future.delayed(Duration(seconds: 2));

    List<ProductionLineModel> lista = new List<ProductionLineModel>();

    try {
      Response response = await service.create().get(_resource);
      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            lista.add(
              ProductionLineModel.fromJson(value),
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

  Future<ProductionLineModel> create(
      ProductionLineModel productionLineModel) async {
    try {
      Response response = await service.create().post(
            _resource,
            data: productionLineModel.toJson(),
          );

      if (response.statusCode == 201) {
        var retorno = response.data != null
            ? ProductionLineModel.fromJson(response.data)
            : null;
        return retorno;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<ProductionLineModel> getById(int id) async {
    try {
      String endpoint = _resource + "/" + id.toString();
      Response response = await service.create().get(endpoint);

      if (response.statusCode == 200) {
        var retorno = ProductionLineModel.fromJson(response.data);
        return retorno;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<int> update(ProductionLineModel productionLineModel) async {
    try {
      String endpoint = _resource + "/" + productionLineModel.id.toString();

      Response response = await service.create().put(
            endpoint,
            data: productionLineModel.toJson(),
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

  Future<void> delete(ProductionLineModel productionLineModel) async {
    try {
      String endpoint = _resource + "/" + productionLineModel.id.toString();

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
