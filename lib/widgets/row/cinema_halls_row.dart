import 'package:cached_network_image/cached_network_image.dart';
import 'package:flick_fusion_nepal/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_fusion_nepal/model/halls.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';
import 'package:flick_fusion_nepal/utils/image_path.dart';
import 'package:flick_fusion_nepal/views/cinema_hall_screen.dart';

class CinemaHallRow extends StatelessWidget {
  final CinemaHalls cinemaHall;
  const CinemaHallRow({
    super.key,
    required this.cinemaHall,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(CinemaHallScreen.routeName, arguments: [cinemaHall]);
      },
      child: Container(
        width: Get.width,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 1),
                  blurRadius: 8,
                  spreadRadius: 1,
                  color: Colors.black.withOpacity(0.2))
            ]),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white.withOpacity(0.8),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                            imageUrl: cinemaHall.imageUrl ?? "",
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Image.asset(ImagePath.placeholder),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${cinemaHall.name}",
                        style: CustomTextStyles.f16W600(
                            color: AppColors.primaryColor),
                        maxLines: 2,
                      ),
                      Text(
                        cinemaHall.address ?? "No Location",
                        maxLines: 1,
                        style: CustomTextStyles.f14W400(),
                      ),
                      Text(
                        cinemaHall.phone ?? "No Contact",
                        maxLines: 1,
                        style: CustomTextStyles.f14W400(),
                      ),
                      Text(
                        cinemaHall.email ?? "No Email",
                        maxLines: 1,
                        style: CustomTextStyles.f14W400(),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    cinemaHall.status ?? "No Contact",
                    maxLines: 1,
                    style: CustomTextStyles.f14W400(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
