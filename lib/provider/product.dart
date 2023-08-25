class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<dynamic> imageUrl; // change it idiot
  final int collection; // change it idiot
  final Map<String, dynamic> author; // change it idiot
  final String publisher;
  final int inventory;
  bool isFavorate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.collection,
    required this.author,
    required this.publisher,
    required this.inventory,
    this.isFavorate = false,
  });
}

class Collection {
  final int id;
  final String title;

  Collection({required this.id, required this.title});
}
