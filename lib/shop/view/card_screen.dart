import 'package:design_iu/shop/view/home_shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardListScreen extends StatefulWidget {
  const CardListScreen({super.key});

  @override
  State<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Shopping Card')),
      body: ListView.builder(
        itemCount: cardList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: double.infinity,
            child: Row(
              children: [
                Image(
                    fit: BoxFit.cover,
                    height: 150,
                    width: 150,
                    image: NetworkImage(cardList[index].image.toString()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
