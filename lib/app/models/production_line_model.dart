class ProductionLineModel {
  int id;
  String name;
  DateTime startDate;
  DateTime endDate;
  String model;
  int count;
  String fileModel;
  String status;

  ProductionLineModel(
      {this.id,
      this.name,
      this.startDate,
      this.endDate,
      this.model,
      this.count,
      this.fileModel,
      this.status});

  ProductionLineModel.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id']);
    name = json['name'];
    startDate =
        json['start_date'] != null ? DateTime.parse(json['start_date']) : null;
    endDate =
        json['end_date'] != null ? DateTime.parse(json['end_date']) : null;
    model = json['model'];
    count = json['count'];
    fileModel = json['file_model'];
    status = json['status'];
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
    data['status'] = this.status == null ? 'produzindo' : this.status;
    return data;
  }
}
