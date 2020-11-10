class ProductionLineModel {
  String id;
  String name;
  DateTime startDate;
  DateTime endDate;
  String model;
  int count;
  String fileModel;

  ProductionLineModel(
      {this.id,
      this.name,
      this.startDate,
      this.endDate,
      this.model,
      this.count,
      this.fileModel});

  ProductionLineModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startDate =
        json['start_date'] != null ? DateTime.parse(json['start_date']) : null;
    endDate =
        json['end_date'] != null ? DateTime.parse(json['end_date']) : null;
    model = json['model'];
    count = json['count'];
    fileModel = json['file_model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['start_date'] =
        "${this.startDate.year.toString()}-${this.startDate.month.toString().padLeft(2, '0')}-${this.startDate.day.toString().padLeft(2, '0')}";
    data['end_date'] =
        "${this.endDate.year.toString()}-${this.endDate.month.toString().padLeft(2, '0')}-${this.endDate.day.toString().padLeft(2, '0')}";
    data['model'] = this.model;
    data['count'] = this.count;
    data['file_model'] = this.fileModel;
    return data;
  }
}
