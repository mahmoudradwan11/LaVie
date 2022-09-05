class ProductModel {
  String? type;
  String? message;
  List<ProductDataModel> data = [];
  ProductModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    json['data'].forEach((element) {
      data.add(ProductDataModel.fromJson(element));
    });
  }
}

class ProductDataModel {
  String? productId;
  String? name;
  String? description;
  String? imageUrl;
  String? type;
  int? price;
  bool? available;
  PlantProductModel? plant;
  SeedProductModel? seed;
  ToolProductModel? tool;
  ProductDataModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    plant = json['plant'] != null
        ? PlantProductModel.fromJson(json['plant'])
        : null;
    seed =
        json['seed'] != null ? SeedProductModel.fromJson(json['seed']) : null;
    tool =
        json['tool'] != null ? ToolProductModel.fromJson(json['tool']) : null;
  }
}

class PlantProductModel {
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;
  PlantProductModel.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }
}

class SeedProductModel {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;
  SeedProductModel.fromJson(Map<String, dynamic> json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }
}

class ToolProductModel {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;
  ToolProductModel.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }
}
