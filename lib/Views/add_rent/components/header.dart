import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 7 * SizeConfig.heightMultiplier,
        width: 100 * SizeConfig.widthMultiplier,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 7,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2 * SizeConfig.widthMultiplier,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: onTap,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              SizedBox(width: 2 * SizeConfig.widthMultiplier),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black),
              ),
              const Spacer(),
            ],
          ),
        ));
  }
}

class RowHeader extends StatelessWidget {
  const RowHeader({
    Key? key,
    required this.text,
    required this.onTap,
    this.isAddButton = false,
    required this.child,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final bool isAddButton;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 7 * SizeConfig.heightMultiplier,
        width: 100 * SizeConfig.widthMultiplier,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 7,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2 * SizeConfig.widthMultiplier,
          ),
          child: Row(
            mainAxisAlignment: isAddButton
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: onTap,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              SizedBox(width: 2 * SizeConfig.widthMultiplier),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black),
              ),
              const Spacer(),
              isAddButton ? Container(child: child) : const SizedBox(),
            ],
          ),
        ));
  }
}
