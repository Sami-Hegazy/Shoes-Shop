import 'package:flutter/material.dart';
import 'package:shoes_shop/constants/constants.dart';
import '../widgets/custom_icon_button.dart';
import '../data/data.dart';
import '../widgets/shoe_card.dart';
import '../screens/details_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final List<String> _tags = ['All', 'Shoes', 'Bags', 'Clothing', 'Cap'];
  int _selectedTag = 0;

  Widget _buildTags(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTag = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: _selectedTag == index ? AppColor.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          _tags[index],
          style: TextStyle(
              color: _selectedTag == index ? Colors.grey[400] : Colors.grey,
              fontFamily: 'Poppins'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nike Collection',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'The best of Nike , all in one place',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              labelText: 'Search',
                              contentPadding: EdgeInsets.zero,
                              filled: true,
                              fillColor: AppColor.secondaryColor,
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    customIconButton(
                      backgroundColor: AppColor.secondaryColor,
                      child: Image.asset('assets/icons/filter.png'),
                      onTap: () {},
                      radius: BorderRadius.circular(12),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _tags
                        .asMap()
                        .entries
                        .map((MapEntry map) => _buildTags(map.key))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 20),
                _buildShoesListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShoesListView() {
    return ListView.builder(
        itemCount: shoesData.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return DetailsScreen(shoeData: shoesData[index]);
                }),
              );
            },
            child: ShoeCard(
              shoe: shoesData[index],
            ),
          );
        });
  }
}
