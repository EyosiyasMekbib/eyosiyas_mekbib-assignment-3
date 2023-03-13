class GroceryItem {
  String name;
  num price;
  String imageUrl;

  GroceryItem(
      {required this.name, required this.price, required this.imageUrl});

  factory GroceryItem.fromJson(Map<String, dynamic> parsedJson) {
    return GroceryItem(
        name: parsedJson['name'],
        price: parsedJson['price'],
        imageUrl: parsedJson['imageUrl']);
  }

  static List<GroceryItem> toList(List groceries_list) {
    List<GroceryItem> groceries = [];
    for (var i = 0; i < groceries_list.length; i++) {
      groceries.add(GroceryItem.fromJson(groceries_list[i]));
    }
    return groceries;
  }
}
