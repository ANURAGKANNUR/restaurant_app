import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/app/modules/login/controller/login_controller.dart';
import 'package:restaurant/app/modules/restaurants/controller/restaurants_page_controller.dart';

import '../../../routes/app_pages.dart';

class RestaurantsPage extends GetView<RestaurantsController> {
  RestaurantsPage({super.key});

  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "RESTAURANTS",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                loginController.logOut();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Log out",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
          backgroundColor: Colors.amber[900],
        ),
      ),
      body: Obx(() => (controller.allRestaurants.value.restaurants == null)
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: ListView.builder(
                  itemCount:
                      controller.allRestaurants.value.restaurants?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.restaurantDetailPage,
                              arguments: controller
                                  .allRestaurants.value.restaurants![index]);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(controller.allRestaurants.value
                                .restaurants![index].photograph!),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Text(
                                    controller.allRestaurants.value
                                        .restaurants![index].name!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green[900]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller
                                              .allRestaurants
                                              .value
                                              .restaurants![index]
                                              .reviews!
                                              .first
                                              .rating
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.restaurant_menu,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    controller.allRestaurants.value
                                        .restaurants![index].cuisineType!,
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                  Expanded(
                                    child: Text(
                                      controller.allRestaurants.value
                                          .restaurants![index].address!,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )),
    );
  }
}
