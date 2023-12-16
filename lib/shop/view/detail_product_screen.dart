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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pro!.name!),
      ),
    );
  }
}
