import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class BuyNow extends StatelessWidget {
  const BuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 5 * SizeConfig.heightMultiplier,
            width: 5 * SizeConfig.widthMultiplier,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: const Center(
              child: Text('!', style: TextStyle(color: Colors.white)),
            )),
        SizedBox(width: 1 * SizeConfig.widthMultiplier),
        const Text("You don't have enough points.",
            style: TextStyle(color: Colors.red, fontSize: 12)),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 5 * SizeConfig.heightMultiplier,
            // width: 35 * SizeConfig.widthMultiplier,
            decoration: BoxDecoration(
              color: ColorManager.primary,
              border: Border.all(color: ColorManager.primary),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                  Text('Buy Now!',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
