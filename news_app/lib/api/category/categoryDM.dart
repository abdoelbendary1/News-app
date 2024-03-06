// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryDM {
  String id;
  String name;
  String imagePath;
  CategoryDM({
    required this.id,
    required this.name,
    required this.imagePath,
  });
  
  /* business entertainment general health science sports technology */

  static List<CategoryDM> getCategories() {
    return [
      CategoryDM(
          id: "general",
          name: "General",
          imagePath: "assets/images/categories/general.png"),
      CategoryDM(
          id: "business",
          name: "Business",
          imagePath: "assets/images/categories/business.png"),
      CategoryDM(
          id: "entertainment",
          name: "Entertainment",
          imagePath: "assets/images/categories/entertainment.png"),
      CategoryDM(
          id: "health",
          name: "Health",
          imagePath: "assets/images/categories/health.png"),
      CategoryDM(
          id: "science",
          name: "Science",
          imagePath: "assets/images/categories/science.png"),
      CategoryDM(
          id: "sports",
          name: "Sports",
          imagePath: "assets/images/categories/sports.png"),
      CategoryDM(
          id: "technology",
          name: "Technology",
          imagePath: "assets/images/categories/technology.png"),
    ];
  }
}
