class DataModel {
  int? id;
  String? address;
  String? price;
  String? createdAt;
  List<Details>? details;

  DataModel({this.id, this.address, this.price, this.createdAt, this.details});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    price = json['price'];
    createdAt = json['created_at'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String? name;
  int? quantity;

  Details({this.name, this.quantity});

  Details.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    return data;
  }
}
