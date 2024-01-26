class GetAllTaskModel {
  int? count;
  List<Data>? data;

  GetAllTaskModel({this.count, this.data});

  GetAllTaskModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  bool? completed;
  String? sId;
  String? title;
  String? description;
  String? dueDate;
  String? owner;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.completed,
      this.sId,
      this.title,
      this.description,
      this.dueDate,
      this.owner,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    completed = json['completed'];
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    dueDate = json['dueDate'];
    owner = json['owner'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['completed'] = completed;
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['dueDate'] = dueDate;
    data['owner'] = owner;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
