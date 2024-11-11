class Product {
  final String name;
  final String image;
  final int price;
  final String description;
  final List<String> colors; // Add this line

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.colors, // Add this line
  });
}
