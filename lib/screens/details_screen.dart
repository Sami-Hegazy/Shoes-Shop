import 'package:flutter/material.dart';
import 'package:shoes_shop/constants/constants.dart';
import 'package:shoes_shop/data/data.dart';
import 'package:shoes_shop/widgets/custom_icon_button.dart';
import 'package:shoes_shop/widgets/custom_like_button.dart';
import '../data/data.dart';

class DetailsScreen extends StatefulWidget {
  final ShoeData shoeData;
  const DetailsScreen({Key? key, required this.shoeData}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final List<String> _sizeTags = [
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
  ];
  int _selectedSize = 0;

  Widget _buildSizeTags(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = index;
        });
      },
      child: Container(
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: _selectedSize == index ? AppColor.primaryColor : Colors.white,
        ),
        child: Center(
          child: Text(
            _sizeTags[index],
            style: TextStyle(
                color: _selectedSize != index ? Colors.grey[400] : Colors.white,
                fontFamily: 'Poppins'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: widget.shoeData.backgroundColor,
                    ),
                    child: Hero(
                      tag: widget.shoeData.id,
                      child: Image.asset(widget.shoeData.image),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: customLikeButton(),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                widget.shoeData.name,
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                widget.shoeData.tagLine,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 10),
              Text(
                'Select Size',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _sizeTags.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        _buildSizeTags(index),
                        const SizedBox(width: 10),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Description',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 10),
              Text(
                widget.shoeData.description,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 20),
              Text(
                'Reviews',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                          ),
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images.people.jpg'),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                            ),
                            child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images.people.jpg'),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 60,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                            ),
                            child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images.people.jpg'),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 90,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                            ),
                            child: const CircleAvatar(
                              backgroundColor: Colors.black87,
                              child: Text(
                                '12+',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  customIconButton(
                    backgroundColor: AppColor.primaryColor,
                    child: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                      size: 20,
                    ),
                    onTap: () {},
                    radius: BorderRadius.circular(25),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
