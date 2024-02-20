/// msg : "success"
/// data : [{"id":1,"categoryName":"Television","categoryImg":"https://photo.teamrabbil.com/images/2023/09/09/cat_img1.png","created_at":"2023-08-15T07:59:11.000000Z","updated_at":"2023-09-09T07:42:29.000000Z"},{"id":2,"categoryName":"Mobile","categoryImg":"https://photo.teamrabbil.com/images/2023/09/09/cat_img2.png","created_at":"2023-08-15T07:59:11.000000Z","updated_at":"2023-09-09T07:42:35.000000Z"},{"id":3,"categoryName":"Headphone","categoryImg":"https://photo.teamrabbil.com/images/2023/09/09/cat_img3.png","created_at":"2023-08-15T07:59:11.000000Z","updated_at":"2023-09-09T07:42:45.000000Z"},{"id":4,"categoryName":"Watch","categoryImg":"https://photo.teamrabbil.com/images/2023/09/09/cat_img4.png","created_at":"2023-08-15T07:59:11.000000Z","updated_at":"2023-09-09T07:42:59.000000Z"},{"id":5,"categoryName":"Game","categoryImg":"https://photo.teamrabbil.com/images/2023/09/09/cat_img5.png","created_at":"2023-08-15T07:59:11.000000Z","updated_at":"2023-09-09T07:43:10.000000Z"},{"id":6,"categoryName":"Camera","categoryImg":"https://photo.teamrabbil.com/images/2023/09/09/cat_img6.png","created_at":"2023-08-15T07:59:11.000000Z","updated_at":"2023-09-09T07:43:17.000000Z"},{"id":7,"categoryName":"Audio","categoryImg":"https://photo.teamrabbil.com/images/2023/09/09/cat_img7.png","created_at":"2023-08-15T07:59:11.000000Z","updated_at":"2023-09-09T07:43:26.000000Z"},{"id":11,"categoryName":"Television","categoryImg":"https://photo.teamrabbil.com/images/2023/09/09/cat_img1.png","created_at":"2023-08-15T07:59:11.000000Z","updated_at":"2023-09-09T07:42:29.000000Z"},{"id":12,"categoryName":"Mobile","categoryImg":"https://photo.teamrabbil.com/images/2023/09/09/cat_img2.png","created_at":"2023-08-15T07:59:11.000000Z","updated_at":"2023-09-09T07:42:35.000000Z"},{"id":18,"categoryName":"Watch","categoryImg":"https://photo.teamrabbil.com/images/2023/09/09/cat_img4.png","created_at":"2023-08-15T07:59:11.000000Z","updated_at":"2023-09-09T07:42:59.000000Z"},{"id":19,"categoryName":"Game","categoryImg":"https://photo.teamrabbil.com/images/2023/09/09/cat_img5.png","created_at":"2023-08-15T07:59:11.000000Z","updated_at":"2023-09-09T07:43:10.000000Z"},{"id":20,"categoryName":"Camera","categoryImg":"https://photo.teamrabbil.com/images/2023/09/09/cat_img6.png","created_at":"2023-08-15T07:59:11.000000Z","updated_at":"2023-09-09T07:43:17.000000Z"}]

class CateGoryListModel {
  CateGoryListModel({
      String? msg, 
      List<CategoryList>? categoryList,}){
    _msg = msg;
    _data = categoryList;
}

  CateGoryListModel.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CategoryList.fromJson(v));
      });
    }
  }
  String? _msg;
  List<CategoryList>? _data;
CateGoryListModel copyWith({  String? msg,
  List<CategoryList>? data,
}) => CateGoryListModel(  msg: msg ?? _msg,
  categoryList: data ?? _data,
);
  String? get msg => _msg;
  List<CategoryList>? get categoryList => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// categoryName : "Television"
/// categoryImg : "https://photo.teamrabbil.com/images/2023/09/09/cat_img1.png"
/// created_at : "2023-08-15T07:59:11.000000Z"
/// updated_at : "2023-09-09T07:42:29.000000Z"

class CategoryList {
  CategoryList({
      int? id,
      String? categoryName, 
      String? categoryImg, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _categoryName = categoryName;
    _categoryImg = categoryImg;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CategoryList.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['categoryName'];
    _categoryImg = json['categoryImg'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _categoryName;
  String? _categoryImg;
  String? _createdAt;
  String? _updatedAt;
CategoryList copyWith({  int? id,
  String? categoryName,
  String? categoryImg,
  String? createdAt,
  String? updatedAt,
}) => CategoryList(  id: id ?? _id,
  categoryName: categoryName ?? _categoryName,
  categoryImg: categoryImg ?? _categoryImg,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get categoryName => _categoryName;
  String? get categoryImg => _categoryImg;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['categoryName'] = _categoryName;
    map['categoryImg'] = _categoryImg;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}