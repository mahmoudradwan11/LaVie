class ToolsModel {
  String? type;
  String? message;
  List<ToolsDataModel> data = [];
  ToolsModel.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      data.add(ToolsDataModel.fromJson(element));
    });
  }
}

class ToolsDataModel {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;
  ToolsDataModel.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }
}
