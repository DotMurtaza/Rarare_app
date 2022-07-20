import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/add_rent/add_rent_images_page.dart';
import 'package:flow1/Widgets/my_button.dart';
import 'package:flow1/Widgets/my_field.dart';
import 'package:flow1/Widgets/sized_box_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Rant extends StatefulWidget {
  const Rant({Key? key}) : super(key: key);

  @override
  State<Rant> createState() => _RantState();
}

class _RantState extends State<Rant> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController whatHappendController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 2 * SizeConfig.heightMultiplier,
          ),
          MyField(
            controller: titleController,
            hintText: "Let's give an interesting title",
          ),
          SizedBox(
            height: 2 * SizeConfig.heightMultiplier,
          ),
          MyField(
            controller: whatHappendController,
            isLarge: true,
            hintText: "Tell us what happend!",
          ),
          SizedBox(
            height: 2 * SizeConfig.heightMultiplier,
          ),
          Container(
              height: 5 * SizeConfig.heightMultiplier,
              width: 90 * SizeConfig.widthMultiplier,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Location',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.grey)),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.my_location_sharp,
                            color: ColorManager.primary)),
                    Text('Current Location',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.grey)),
                  ],
                ),
              )),
          SizedBox(
            height: 30 * SizeConfig.heightMultiplier,
            width: 85 * SizeConfig.widthMultiplier,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 0.0,
              ),
            ),
          ),
          SizedBox(height: 2 * SizeConfig.heightMultiplier),
          const SizedBoxContainer(
            height: 1,
          ),
          SizedBox(height: 2 * SizeConfig.heightMultiplier),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 16 * SizeConfig.widthMultiplier),
              child: MyButton(
                onTap: () {
                  Get.to(() => const AddRenImagesPage());
                },
                text: 'Next',
                isBack: false,
              ),
            ),
          ),
          SizedBox(height: 2 * SizeConfig.heightMultiplier),
        ],
      ),
    );
  }
}
