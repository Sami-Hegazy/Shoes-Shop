import 'package:flutter/material.dart';

class ShoesDataList with ChangeNotifier {
  final List<ShoesDataModel> _shoesList = [
    ShoesDataModel(
      id: '1',
      description:
          "A shoe is an item of footwear intended to protect and comfort the human foot. Shoes are also used as an item of decoration and fashion. The design of shoes has varied enormously through time and from culture to culture.",
      name: "Nike Air Pegasus",
      image: "assets/images/1.png",
      price: "180.0",
      tagLine: "Footwear to last you a lifetime.",
      backgroundColor: const Color(0xffffeae9),
    ),
    ShoesDataModel(
        id: '2',
        description:
            "A shoe is an item of footwear intended to protect and comfort the human foot. Shoes are also used as an item of decoration and fashion. The design of shoes has varied enormously through time and from culture to culture.",
        name: "Nike ZoomX",
        image: "assets/images/3.png",
        price: "280.0",
        tagLine: "Designed for the freedom to walk.",
        backgroundColor: const Color(0xffe9eff2)),
    ShoesDataModel(
        id: '3',
        description:
            "A shoe is an item of footwear intended to protect and comfort the human foot. Shoes are also used as an item of decoration and fashion. The design of shoes has varied enormously through time and from culture to culture.",
        name: "Nike Air Light",
        image: "assets/images/1.png",
        price: "380.0",
        tagLine: "Go faster, go stronger, never stop.",
        backgroundColor: const Color(0xffffeae9)),
    ShoesDataModel(
        id: '4',
        description:
            "A shoe is an item of footwear intended to protect and comfort the human foot. Shoes are also used as an item of decoration and fashion. The design of shoes has varied enormously through time and from culture to culture.",
        name: "Nike Air Light",
        image: "assets/images/3.png",
        price: "380.0",
        tagLine: "Talk the talk, walk the walk on life.",
        backgroundColor: const Color(0xffe9eff2)),
    ShoesDataModel(
        id: '5',
        description:
            "A shoe is an item of footwear intended to protect and comfort the human foot. Shoes are also used as an item of decoration and fashion. The design of shoes has varied enormously through time and from culture to culture.",
        name: "Nike ZoomX",
        image: "assets/images/3.png",
        price: "280.0",
        tagLine: "Designed for the freedom to walk.",
        backgroundColor: const Color(0xffe9eff2)),
    ShoesDataModel(
        id: '6',
        description:
            "A shoe is an item of footwear intended to protect and comfort the human foot. Shoes are also used as an item of decoration and fashion. The design of shoes has varied enormously through time and from culture to culture.",
        name: "Nike Air Light",
        image: "assets/images/1.png",
        price: "380.0",
        tagLine: "Go faster, go stronger, never stop.",
        backgroundColor: const Color(0xffffeae9)),
  ];

  List<ShoesDataModel> get items {
    return [..._shoesList];
  }

  ShoesDataModel findByID(String id) {
    return _shoesList.firstWhere((element) => element.id == id);
  }
}

class ShoesDataModel with ChangeNotifier {
  String id;
  String name;
  String description;
  String price;
  String image;
  Color backgroundColor;
  String tagLine;

  ShoesDataModel(
      {required this.description,
      required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.tagLine,
      required this.backgroundColor});
}
