class RobotModel {
  String id;
  String sku;
  String profession;
  String color;
  List<String> robotParts;
  int productionLine;

  RobotModel(
      {this.id,
      this.sku,
      this.profession,
      this.color,
      this.robotParts,
      this.productionLine});

  RobotModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    profession = json['profession'];
    color = json['color'];
    robotParts = json['robot_parts'].cast<String>();
    productionLine = json['production_line'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['profession'] = this.profession;
    data['color'] = this.color;
    data['robot_parts'] = this.robotParts;
    data['production_line'] = this.productionLine;
    return data;
  }
}
