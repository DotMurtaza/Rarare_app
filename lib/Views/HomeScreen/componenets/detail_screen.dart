import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [CustomAppBar()],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: SizedBox(
                  height: SizeConfig.heightMultiplier * 45,
                  child: CarouselSlider.builder(
                      //  key: _sliderKey,
                      unlimitedMode: true,
                      slideBuilder: (index) {
                        return Container(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imgList[index],
                              height: SizeConfig.heightMultiplier * 42,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        );
                      },
                      slideTransform: const DefaultTransform(),
                      slideIndicator: CircularSlideIndicator(
                        indicatorRadius: 4,
                        currentIndicatorColor: Colors.white,
                        itemSpacing: 9,
                        indicatorBackgroundColor: Colors.grey,
                        padding: const EdgeInsets.only(bottom: 32),
                      ),
                      itemCount: imgList.length),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: SizeConfig.heightMultiplier * 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Title of the Rant/Rave",
                          style: getSemiBoldTextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.textMultiplier * 2.5)),
                      Text(
                        "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                        style: getRegularTextStyle(
                        fontSize: SizeConfig.textMultiplier * 1.4,
                        color: ColorManager.darkGrey),
                      ),
                      Text(
                        "See more",
                        style: getSemiBoldTextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.textMultiplier * 1.6),
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.location_solid,
                              size: 20, color: ColorManager.primaryDark),
                          Text(
                              "Lorem ipsum dolar sit amet, consectetur adipiscing elitr",
                              softWrap: false,
                              maxLines: 2,
                              style: getRegularTextStyle(
                                  fontSize: SizeConfig.textMultiplier * 1.4,
                                  color: ColorManager.darkGrey),
                              overflow: TextOverflow.clip)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: SizeConfig.heightMultiplier * 14,
                decoration:
                    BoxDecoration(color: ColorManager.grey.withOpacity(0.5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        LikeButton(
                          icon: CupertinoIcons.heart_fill,
                          label: "Like",
                        ),
                        LikeButton(
                          icon: Icons.mode_comment,
                          label: "Comments",
                        ),
                        LikeButton(
                          icon: Icons.share,
                          label: "Share",
                        )
                      ],
                    ),
                    Container(
                      color: ColorManager.white,
                      height: SizeConfig.heightMultiplier * 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(CupertinoIcons.heart_fill,
                              color: ColorManager.grey),
                          const Text("1.5K"),
                          SizedBox(width: SizeConfig.widthMultiplier * 6),
                          Icon(Icons.mode_comment, color: ColorManager.grey),
                          const Text("Comments"),
                          SizedBox(width: SizeConfig.widthMultiplier * 6),
                          Icon(Icons.share, color: ColorManager.grey),
                       const   Text("Share"),
                          //  SizedBox(width: SizeConfig.widthMultiplier * 10),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  const LikeButton({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);
  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: SizeConfig.widthMultiplier * 25,
      child: TextButton.icon(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: BorderSide(color: ColorManager.primaryDark, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0))),
              elevation: MaterialStateProperty.all(10),
              backgroundColor: MaterialStateProperty.all(ColorManager.white)),
          onPressed: () {},
          icon: Icon(
            icon,
            color: ColorManager.darkGrey,
          ),
          label: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              label,
              style: getSemiBoldTextStyle(color: Colors.black),
            ),
          )),
    );
  }
}
