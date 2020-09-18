class AdModel {
  String images;

  AdModel({this.images});

  AdModel.fromJson(Map<String, dynamic> parsedJSON)
      : images = parsedJSON['images'];
}
