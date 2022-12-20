import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceryapp/services/utils.dart';
import 'package:groceryapp/widgets/feed_items.dart';
import 'package:groceryapp/widgets/on_sale_widget.dart';
import 'package:groceryapp/widgets/text_widget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<String> offerImages = [
    "assets/offers/Offer1.jpg",
    "assets/offers/Offer2.jpg",
    "assets/offers/Offer3.jpg",
    "assets/offers/Offer4.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final Color color = utils.color;
    Size size = utils.getscreenSize;

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
          SizedBox(
            height: size.height * 0.27,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  offerImages[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: offerImages.length,
              pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white, activeColor: Colors.red)),
              control: const SwiperControl(color: Colors.black),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: TextWidget(
                  text: "View All", color: Colors.green, textSize: 22)),
          Row(
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: Row(
                  children: [
                    TextWidget(
                      text: "On Sale ",
                      color: Colors.orange,
                      textSize: 32,
                      istitle: true,
                    ),
                    const Icon(
                      IconlyLight.discount,
                      color: Colors.orange,
                      size: 35,
                    )
                  ],
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: size.height * 0.3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const OnSale();
                      }),
                ),
              ),
            ],
          ), //Ending of Row Onsale screen
          const SizedBox(height: 2,),
           Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: (){},
                child: TextWidget(text: "Our Products", color: color, textSize: 22 , istitle: true,)),
              const Spacer(),
              TextButton(
                onPressed: (){},
                child: TextWidget(text: "Browse All", color: Colors.blue, textSize: 22 , istitle: true,))
            ],
          ), 
          GridView.count(crossAxisCount: 2,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: size.width/(size.height*0.55),
          children: [
            
            ...List.generate(4, (index) {
              return const FeedsWidget();
            })
          ],
          )
          
            ],
          ),
        ));
  }
}
