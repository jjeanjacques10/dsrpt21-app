class RobotModel {
  String id;
  String name;
  String sku;
  String profession;
  String color;
  List<String> robotParts;
  int productionLine;
  String model;

  RobotModel(
      {this.id,
      this.name,
      this.sku,
      this.profession,
      this.color,
      this.robotParts,
      this.productionLine,
      this.model});

  RobotModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sku = json['sku'];
    profession = json['profession'];
    color = json['color'];
    robotParts = json['robot_parts'].cast<String>();
    productionLine = json['production_line'];
    model = json['model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sku'] = this.sku;
    data['profession'] = this.profession;
    data['color'] = this.color;
    data['robot_parts'] = this.robotParts;
    data['production_line'] = this.productionLine;
    data['model'] = this.model;
    return data;
  }
}
