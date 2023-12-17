import 'package:design_iu/shop/model/product_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailProductScreen extends StatefulWidget {
  DetailProductScreen({super.key, this.pro});
  ProductModel? pro;
  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pro!.name!),
      ),
      body: ListView(
        children: [
          Hero(
            tag: widget.pro!.name.toString(),
            child: Image(
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
              image: NetworkImage(
                widget.pro!.image.toString(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$ ${widget.pro!.price}',
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.small(
                heroTag: 'decrement',
                backgroundColor: Colors.white,
                onPressed: () {
                  setState(() {
                    if (qty > 1) {
                      qty--;
                    } else {
                      qty = 1;
                    }
                  });
                },
                child: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
              ),
              Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Center(
                  child: Text(qty.toString(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              FloatingActionButton.small(
                heroTag: 'increment',
                backgroundColor: Colors.white,
                onPressed: () {
                  setState(() {
                    qty++;
                  });
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
