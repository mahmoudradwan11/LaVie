class PlantModel {
  String? type;
  String? message;
  List<PlantDataModel> data = [];
  PlantModel.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      data.add(PlantDataModel.fromJson(element));
    });
  }
}

class PlantDataModel {
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;
  PlantDataModel.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }
}
