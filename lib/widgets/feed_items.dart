import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryapp/services/utils.dart';
import 'package:groceryapp/widgets/heart_btn.dart';
import 'package:groceryapp/widgets/price_widget.dart';
import 'package:groceryapp/widgets/text_widget.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({super.key});

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  final quantityEditingController = TextEditingController();

  @override
  void initState() {
    quantityEditingController.text = "";
    super.initState();
  }

  @override
  void dispose() {
    quantityEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;

    Size size = Utils(context).getscreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
         border: Border.all(
          color: Theme.of(context).canvasColor,
         )
        ),
        child: Material(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                FancyShimmerImage(
                  imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                  height: size.height * 0.12,
                  width: size.width * 0.22,
                  boxFit: BoxFit.fill,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "Title",
                        color: color,
                        textSize: 20,
                        istitle: true,
                      ),
                      const HeartButton()
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 5,),
                      const Flexible(child: PriceWidget()),
                      Flexible(
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextWidget(
                              text: " KG",
                              color: color,
                              textSize: 16,
                              istitle: true,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 30,
                              child: TextFormField(
                                enabled: true,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9.]'))
                                ],
                                controller: quantityEditingController,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).cardColor),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0))))),
                    onPressed: () {},
                    child: TextWidget(
                      text: "Add to cart",
                      color: color,
                      textSize: 16,
                      istitle: true,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
