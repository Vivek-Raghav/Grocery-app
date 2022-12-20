import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceryapp/services/utils.dart';
import 'package:groceryapp/widgets/price_widget.dart';
import 'package:groceryapp/widgets/text_widget.dart';

class OnSale extends StatefulWidget {
  const OnSale({super.key});

  @override
  State<OnSale> createState() => _OnSaleState();
}

class _OnSaleState extends State<OnSale> {
  
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getscreenSize;
    Color color = utils.color;
    return Material(
      color: Theme.of(context).cardColor.withOpacity(0.8),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FancyShimmerImage(imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png' ,
                    height: size.height * 0.20,
                    width: size.width * 0.4,
                    boxFit: BoxFit.fill,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround, //vertical
                    crossAxisAlignment: CrossAxisAlignment.start, //horizontal
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        text: "1KG",
                        color: color,
                        textSize: 22,
                        istitle: true,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("Bag button has been pressed");
                            },
                            child: const Icon(IconlyLight.bag2),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Heart button has been pressed");
                            },
                            child: const Icon(IconlyLight.heart),
                          )
                        ],
                      ), //Here the row of bag and add card button is ended
                    ],
                  ), //Here the column of weight and cart add buttons ending
                ],
              ), //Here the photo of product and iconbutton ending
              const PriceWidget(
              ),
              const SizedBox(
                height: 2,
              ),
              TextWidget(
                text: "Vegetables",
                color: color,
                textSize: 18,
                istitle: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
