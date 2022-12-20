import 'package:flutter/material.dart';
import 'package:groceryapp/services/utils.dart';
import 'package:groceryapp/widgets/categories_widget.dart';
import 'package:groceryapp/widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  
  CategoriesScreen({super.key});

 List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

  List<Map<String , dynamic>> catInfo = [
    {
      'imgPath' : 'assets/category/fruits.png',
      'catText': 'Fruits'
    },
    {
      'imgPath' : 'assets/category/veg.png',
      'catText': 'Vegtables'
    },
    {
      'imgPath' : 'assets/category/Spinach.png',
      'catText': 'Herbs'
    },
    {
      'imgPath' : 'assets/category/nuts.png',
      'catText': 'Nuts'
    },
    {
      'imgPath' : 'assets/category/spices.png',
      'catText': 'Spices'
    },
    {
      'imgPath' : 'assets/category/grains.png',
      'catText': 'Grains'
    },

    
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color colors = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextWidget(text: "Categories", color: colors, textSize: 28,istitle: true,),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Center(
        child: GridView.count(crossAxisCount: 2, childAspectRatio: 240/250,
        crossAxisSpacing: 10, //vertical spacing
        mainAxisSpacing: 10, //horizontal spacing
        children: List.generate(6, (index) => CategoriesWidget(
          catText: catInfo[index]['catText'],
          imgPath: catInfo[index]['imgPath'],
          passedcolor: gridColors[index],
          )),)
      ),
    );
  }
}
