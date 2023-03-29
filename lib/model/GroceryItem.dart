class GroceryItem {
  String name;
  num unit_price;
  String imageUrl;
  int quantity = 0;

  GroceryItem(
      {required this.name,
      required this.unit_price,
      required this.imageUrl,
      this.quantity = 1});

  factory GroceryItem.fromJson(Map<String, dynamic> parsedJson) {
    return GroceryItem(
        name: parsedJson['name'],
        unit_price: parsedJson['price'],
        imageUrl: parsedJson['imageUrl']);
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

  @override
  int get hashCode => name.hashCode ^ unit_price.hashCode ^ imageUrl.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GroceryItem &&
        name == other.name &&
        unit_price == other.unit_price &&
        imageUrl == other.imageUrl;
  }
}
