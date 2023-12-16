class ProductModel {
  int? id;
  String? name;
  String? description;
  String? image;
  double? price;
  bool? isFavorite;
  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.isFavorite,
      this.description});
}

List<ProductModel> listProducts = [
  ProductModel(
    id: 123,
    name: 'Ice Late ',
    price: 1.2,
    image:
        'https://img.freepik.com/free-photo/delicious-coffee-beans-cup_23-2150691429.jpg',
    isFavorite: false,
    description: 'dfghjk;lkjhgrtyui',
  ),
  ProductModel(
    id: 12123,
    name: 'Hot Late',
    price: 1.2,
    image:
        'https://c1.wallpaperflare.com/preview/661/512/921/coffee-beverage-cup-coffee-cup.jpg',
    isFavorite: false,
    description: 'lkjhgcfvbnm',
  ),
  ProductModel(
    id: 1123,
    name: 'Ice Cuputino',
    price: 1.2,
    image:
        'https://img.freepik.com/free-photo/delicious-coffee-beans-cup_23-2150691429.jpg',
    isFavorite: true,
    description: ';lkjhgfdsdfgyhuji',
  ),
  ProductModel(
    id: 45544,
    name: 'Moca Frip',
    price: 1.5,
    image:
        'https://img.freepik.com/free-photo/delicious-coffee-beans-cup_23-2150691429.jpg',
    isFavorite: false,
    description: 'dfghjk;lkjhgrtyui',
  ),
];
