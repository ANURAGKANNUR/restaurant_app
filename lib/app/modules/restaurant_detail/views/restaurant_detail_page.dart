import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:restaurant/app/modules/restaurant_detail/controller/restaurant_detail_controller.dart';

class RestaurantDetailPage extends GetView<RestaurantDetailController> {
  RestaurantDetailPage({super.key});
  var isReadMore = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(controller.data.photograph),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    controller.data.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  const Spacer(),
                  Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green[900]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.data.reviews.first.rating.toString(),
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 15,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.restaurant_menu,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    controller.data.cuisineType,
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: (){
                  MapsLauncher.launchCoordinates(controller.data.latlng.lat, controller.data.latlng.lng);
                  },
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 25,
                    ),
                    Expanded(
                      child: Text(
                        controller.data.address,
                        style: const TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                " Rating & Reviews",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: controller.data.reviews.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green[900]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.data.reviews[index].rating
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.data.reviews[index].name,
                              style: const TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() =>
                           Text(
                            controller.data.reviews[index].comments,
                            maxLines: (isReadMore.value) ? null : 3,
                            style: TextStyle(
                                fontSize: 15,
                                overflow: (isReadMore.value)
                                    ? TextOverflow.visible
                                    : TextOverflow.ellipsis),
                          )
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                       Obx(() =>  Align(
                         alignment: Alignment.centerRight,
                         child: GestureDetector(
                           onTap: () {
                             isReadMore.value = !isReadMore.value;
                           },
                           child: Text(
                             (isReadMore.value) ? "Read less" : "Read more",
                             style: const TextStyle(
                                 fontSize: 15,
                                 color: Colors.grey,
                                 decoration: TextDecoration.underline),
                           ),
                         ),
                       )),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          controller.data.reviews[index].date,
                          style: const TextStyle(fontSize: 13),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
