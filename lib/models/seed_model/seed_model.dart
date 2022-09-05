class SeedsModel {
  String? type;
  String? message;
  List<SeedsDataModel> data = [];
  SeedsModel.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      data.add(SeedsDataModel.fromJson(element));
    });
  }
}

class SeedsDataModel {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;
  SeedsDataModel.fromJson(Map<String, dynamic> json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }
}
