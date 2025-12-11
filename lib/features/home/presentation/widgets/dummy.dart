class CategoryModel {
  final String name;

  CategoryModel({
    required this.name,
  });
}

List<CategoryModel> categories = [
  CategoryModel(
    name: "all",
  ),
  CategoryModel(
    name: "Pizza",
  ),
  CategoryModel(
    name: "Burgers",
  ),
  CategoryModel(
    name: "Drinks",
  ),
  CategoryModel(
    name: "Desserts",
  ),
  CategoryModel(
    name: "Sandwiches",
  ),
];
