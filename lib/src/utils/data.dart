class FunitureData {
  final String name;
  final String imagePath;
  final String description;
  final String detailedDescription;

  final String price;
  final String id;

  FunitureData({
    required this.name,
    required this.id,
    required this.imagePath,
    required this.description,
    required this.detailedDescription,
    required this.price,
  });
}

class ProductSize {
  final String productSize;

  ProductSize({
    required this.productSize,
  });
}

List<ProductSize> productSize = [
  ProductSize(productSize: 'S'),
  ProductSize(productSize: 'M'),
  ProductSize(productSize: 'L'),
  ProductSize(productSize: 'XL'),
];

class AdImageUrl {
  final String urlPath;

  AdImageUrl({
    required this.urlPath,
  });
}

List<AdImageUrl> adImageUrl = [
  AdImageUrl(
    urlPath:
        "https://img.freepik.com/free-vector/new-season-banner-template-with-splash_1361-1527.jpg?w=1060&t=st=1705571146~exp=1705571746~hmac=1e25a89caa962f74d44a1a076279242934cb1a26778b41263aedf89012335034",
  ),
  AdImageUrl(
    urlPath:
        "https://img.freepik.com/free-psd/modern-promotional-fashion-banner_1393-188.jpg?size=626&ext=jpg&ga=GA1.1.443084210.1705571061&semt=ais",
  ),
  AdImageUrl(
    urlPath:
        "https://img.freepik.com/free-vector/modern-black-friday-banner-with-abstract-yellow-splash_1361-2821.jpg?size=626&ext=jpg&ga=GA1.1.443084210.1705571061&semt=ais",
  ),
  AdImageUrl(
    urlPath:
        "https://img.freepik.com/free-vector/promotion-fashion-banner_1188-197.jpg?size=626&ext=jpg&ga=GA1.1.443084210.1705571061&semt=ais",
  ),
  AdImageUrl(
    urlPath:
        "https://img.freepik.com/free-photo/sale-products-with-discount_23-2150296295.jpg?size=626&ext=jpg&ga=GA1.1.443084210.1705571061&semt=ais",
  ),
];

class CategoryData {
  final String title;

  CategoryData({
    required this.title,
  });
}

List<CategoryData> categoryList = [
  CategoryData(title: "All"),
  CategoryData(title: "Jackets"),
  CategoryData(title: "Longshirts"),
  CategoryData(title: "Tshirts"),
  CategoryData(title: "Trousers"),
  CategoryData(title: "Suits"),
];

List<FunitureData> funitureList = [
  FunitureData(
      name: "Ancient wooden Chair ",
      imagePath: "assets/images/c1.png",
      description: 'This is a chair. This is a chair. This is a chair.',
      price: '19999',
      id: "1",
      detailedDescription:
          'This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.'),
  FunitureData(
      name: "Hard Style Chair ",
      imagePath: "assets/images/c2.png",
      description: 'This is a chair. This is a chair. This is a chair.',
      price: '21999',
      id: "2",
      detailedDescription:
          'This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.'),
  FunitureData(
      name: "One Person Cosy Sofa",
      imagePath: "assets/images/c3.png",
      description: 'This is a chair. This is a chair. This is a chair.',
      price: '22999',
      id: "3",
      detailedDescription:
          'This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.'),
  FunitureData(
      name: "Blue Leather Office Chair ",
      imagePath: "assets/images/c4.png",
      description: 'This is a chair. This is a chair. This is a chair.',
      price: '38999',
      id: "4",
      detailedDescription:
          'This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.'),
  FunitureData(
      name: "Pink Leather Office Chair ",
      imagePath: "assets/images/c5.png",
      description: 'This is a chair. This is a chair. This is a chair.',
      price: '57999',
      id: "5",
      detailedDescription:
          'This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.'),
  FunitureData(
      name: "Black Leather Styled Office Chair ",
      imagePath: "assets/images/c6.png",
      description: 'This is a chair. This is a chair. This is a chair.',
      price: '78999',
      id: "6",
      detailedDescription:
          'This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.This is a chair. This is a chair. This is a chair.'),
];
