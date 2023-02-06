class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fronJson(Map<String, dynamic> parse) {
    return Category(
      id: parse["id"],
      name: parse["name"],
    );
  }
}
