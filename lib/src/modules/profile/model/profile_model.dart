class ProfileModel {
  int? age;
  String? sId;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProfileModel(
      {this.age,
      this.sId,
      this.name,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
