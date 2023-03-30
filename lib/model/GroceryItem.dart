import 'package:uuid/uuid.dart';

class GroceryItem {
  String id;
  String name;
  num unit_price;
  String imageUrl;
  int quantity = 0;

  GroceryItem({
    required this.id,
    required this.name,
    required this.unit_price,
    required this.imageUrl,
    this.quantity = 1,
  });

  factory GroceryItem.fromJson(Map<String, dynamic> parsedJson) {
    return GroceryItem(
        id: parsedJson['id'].toString(),
        name: parsedJson['name'],
        unit_price: parsedJson.containsKey('price')
            ? parsedJson['price']
            : parsedJson['unit_price'],
        imageUrl: parsedJson['imageUrl'],
        quantity:
            parsedJson.containsKey('quantity') ? parsedJson['quantity'] : 1);
  }

  static List<GroceryItem> toList(List groceries_list) {
    List<GroceryItem> groceries = [];
    for (var i = 0; i < groceries_list.length; i++) {
      groceries.add(GroceryItem.fromJson(groceries_list[i]));
    }
    return groceries;
  }

  double getPrice() {
    return unit_price.toDouble() * quantity;
  }

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    quantity--;
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['unit_price'] = unit_price;
    json['imageUrl'] = imageUrl;
    json['quantity'] = quantity;
    return json;
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ unit_price.hashCode ^ imageUrl.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GroceryItem &&
        id == other.id &&
        name == other.name &&
        unit_price == other.unit_price &&
        imageUrl == other.imageUrl;
  }
}
