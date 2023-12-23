import 'package:design_iu/profile_screen.dart';
import 'package:design_iu/shop/model/product_model.dart';
import 'package:design_iu/shop/view/card_screen.dart';
import 'package:design_iu/shop/view/detail_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

List<ProductModel> cardList = [];

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int count = 0;
  TextEditingController searchController = TextEditingController();
  List<ProductModel> filterList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ProfileScreen(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Eva-Shop'),
        actions: [
          Center(
            child: badges.Badge(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardListScreen(),
                    ));
              },
              showBadge: cardList.isEmpty ? false : true,
              badgeContent: Text(cardList.length.toString()),
              child: const Icon(
                Icons.shopping_cart,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search Productx',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  filterList = listProducts
                      .where((element) => element.name!
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              childAspectRatio: 10 / 14,
              crossAxisCount: 2,
              children: List.generate(
                  searchController.text.isEmpty
                      ? listProducts.length
                      : filterList.length,
                  (index) => buildCardWidget(
                      pro: searchController.text.isEmpty
                          ? listProducts[index]
                          : filterList[index])),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCardWidget({required ProductModel pro}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailProductScreen(pro: pro),
              ));
        },
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    flex: 5,
                    child: Hero(
                      tag: pro.name.toString(),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(pro.image.toString()))),
                      ),
                    )),
                Expanded(
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pro.name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                '\$ ${pro.price}',
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.red),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (cardList.isEmpty) {
                                  cardList.add(pro);
                                } else {
                                  int index = cardList.indexWhere(
                                      (element) => element.id == pro.id);
                                  if (index == -1) {
                                    cardList.add(pro);
                                  } else {
                                    cardList[index].qty =
                                        cardList[index].qty! + 1;
                                  }
                                }
                              });
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.yellow,
                              maxRadius: 12,
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
                top: 5,
                right: 5,
                child: FloatingActionButton.small(
                  heroTag: pro.id,
                  onPressed: () {
                    setState(() {
                      pro.isFavorite = !pro.isFavorite!;
                    });
                  },
                  backgroundColor: Colors.blueAccent,
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: pro.isFavorite! ? Colors.red : Colors.white,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
