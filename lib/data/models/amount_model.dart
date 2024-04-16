class AmountModel {
  AmountModel({
    required this.total,
    required this.currency,
    required this.details,
  });

  AmountModel.fromJson(dynamic json) {
    total = json['total'];
    currency = json['currency'];
    details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
  }
  String? total;
  String? currency;
  Details? details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['currency'] = currency;
    if (details != null) {
      map['details'] = details?.toJson();
    }
    return map;
  }
}

class Details {
  Details({
    this.subtotal,
    this.shipping,
    this.shippingDiscount,
  });

  Details.fromJson(dynamic json) {
    subtotal = json['subtotal'];
    shipping = json['shipping'];
    shippingDiscount = json['shipping_discount'];
  }
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subtotal'] = subtotal;
    map['shipping'] = shipping;
    map['shipping_discount'] = shippingDiscount;
    return map;
  }
}
