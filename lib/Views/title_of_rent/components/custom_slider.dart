import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.widthMultiplier * 3.5,
          right: SizeConfig.widthMultiplier * 3.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: SizedBox(
          width: SizeConfig.widthMultiplier * 99,
          height: SizeConfig.heightMultiplier * 29.5,
          child: Carousel(
            boxFit: BoxFit.fitWidth,
            autoplay: true,
            dotHorizontalPadding: 1,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: const Duration(milliseconds: 1000),
            dotSize: 5.0,
            dotIncreaseSize: 3,
            dotSpacing: 10,
            dotColor: Colors.grey,
            dotIncreasedColor: Colors.white,
            dotBgColor: Colors.transparent,
            dotPosition: DotPosition.bottomCenter,
            dotVerticalPadding: 10.0,
            showIndicator: true,
            indicatorBgPadding: 1.0,
            images: [
              Image.asset('assets/images/road.jpg'),
              Image.asset('assets/images/road.jpg'),
              Image.asset('assets/images/road.jpg'),
              Image.asset('assets/images/road.jpg'),
              Image.asset('assets/images/road.jpg'),
              Image.asset('assets/images/road.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
