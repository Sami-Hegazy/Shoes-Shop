import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/provider/data.dart';
import 'package:shoes_shop/widgets/custom_buy_button.dart';
import 'package:shoes_shop/widgets/custom_like_button.dart';

class ShoeCard extends StatelessWidget {
  const ShoeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ShoesDataModel>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: productsData.backgroundColor,
      ),
      height: 180,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customLikeButton(),
                Center(
                  child: SizedBox(
                    height: 120,
                    width: 140,
                    child: Hero(
                      tag: productsData.id,
                      child: Image.asset(productsData.image),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: productsData.name,
                    style: Theme.of(context).textTheme.headline4,
                    children: [
                      TextSpan(
                        text: '\nby Nike',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                Text(
                  productsData.tagLine,
                  style: Theme.of(context).textTheme.caption,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${productsData.price}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    customBuyButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
