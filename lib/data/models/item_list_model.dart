class ItemListModel {
  ItemListModel({
    this.orders,
  });

  ItemListModel.fromJson(dynamic json) {
    if (json['items'] != null) {
      orders = [];
      json['items'].forEach((v) {
        orders?.add(OrderItemModel.fromJson(v));
      });
    }
  }
  List<OrderItemModel>? orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orders != null) {
      map['items'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class OrderItemModel {
  OrderItemModel({
    this.name,
    this.quantity,
    this.price,
    this.currency,
  });

  OrderItemModel.fromJson(dynamic json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    currency = json['currency'];
  }
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['quantity'] = quantity;
    map['price'] = price;
    map['currency'] = currency;
    return map;
  }
}
