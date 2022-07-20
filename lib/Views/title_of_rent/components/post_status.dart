import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class PostStatus extends StatelessWidget {
  const PostStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6 * SizeConfig.heightMultiplier,
      width: 100 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kElevationToShadow[4],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Icon(Icons.favorite,
              color: likeGreyColor, size: 6 * SizeConfig.imageSizeMultiplier),
          const SizedBox(width: 10),
          Text(
            '1.5 K',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.black),
          ),
          const Spacer(),
          Image.asset('assets/images/comment.png',
              height: 5 * SizeConfig.imageSizeMultiplier, color: likeGreyColor),
          const SizedBox(width: 10),
          Text(
            '800 Comments',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.black),
          ),
          const Spacer(),
          Image.asset('assets/images/share.png',
              height: 5 * SizeConfig.imageSizeMultiplier, color: likeGreyColor),
          const SizedBox(width: 10),
          Text(
            '80 Shares',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.black),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
