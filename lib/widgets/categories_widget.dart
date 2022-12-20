import 'package:flutter/material.dart';
import 'package:groceryapp/Provider/dark_theme_provider.dart';
import 'package:groceryapp/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {super.key,
      required this.catText,
      required this.imgPath,
      required this.passedcolor});

  final String catText, imgPath;
  final Color passedcolor;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvide>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        print("Categories pressed");
      },
      child: Container(
        decoration: BoxDecoration(
            color: passedcolor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: passedcolor.withOpacity(0.8), width: 2)),
        child: Column(
          children: [
            Container(
              height: screenheight * 0.2,
              width: screenwidth * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.fill)),
            ),
            TextWidget(
                text: catText,
                color: color,
                textSize: 20,
                istitle: true,
                maxlines: 10),
          ],
        ),
      ),
    );
  }
}
