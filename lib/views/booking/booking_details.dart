import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_fusion_nepal/controller/booking/booking_detail_controller.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';
import 'package:flick_fusion_nepal/utils/custom_text_styles.dart';
import 'package:flick_fusion_nepal/utils/date_time_helper.dart';
import 'package:flick_fusion_nepal/utils/image_path.dart';
import 'package:flick_fusion_nepal/views/dashboard/dashscreen.dart';
import 'package:flick_fusion_nepal/views/payment_screen.dart';
import 'package:flick_fusion_nepal/widgets/custom/custom_elevated_button.dart';
import 'package:flick_fusion_nepal/widgets/row/date_row_value.dart';
import 'package:flick_fusion_nepal/widgets/row/details_row.dart';

class BookingDetailScreen extends StatelessWidget {
  static const String routeName = "/booking-detail";
  final c = Get.find<BookingDetailController>();
  BookingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "${c.booking.value?.movie?.title}",
          style: CustomTextStyles.f16W400(),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (c.isLoading.value) {
          return const LinearProgressIndicator();
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 60),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(1, 1),
                            blurRadius: 8,
                            spreadRadius: 1,
                            color: Colors.black.withOpacity(0.2))
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "${c.booking.value?.movie?.title}",
                          style: CustomTextStyles.f16W400(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Duration",
                              style: CustomTextStyles.f12W400(
                                  color: AppColors.textColor),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              DateTimeHelper.toDuration(
                                  c.booking.value!.movie!.duration!),
                              style: CustomTextStyles.f12W600(
                                  color: AppColors.primaryColor),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Date",
                                    style: CustomTextStyles.f14W400(
                                        color: AppColors.hintTextColor),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    DateTimeHelper.prettyDateWithDayTime(
                                        DateTime.parse(
                                            c.booking.value!.showTime!)),
                                    style: CustomTextStyles.f14W400(
                                        color: AppColors.primaryColor),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Type",
                                    style: CustomTextStyles.f14W400(
                                        color: AppColors.hintTextColor),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    c.getStatus(),
                                    style: CustomTextStyles.f14W400(
                                        color: AppColors.primaryColor),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      DataRowValue(
                        title1: "Seats",
                        title2: "Ticket Number",
                        data1: c.getSetsName(),
                        data2: c.getTicketNumber(),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${c.booking.value?.vendor?.name}",
                                  style: textTheme.titleMedium,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  c.booking.value?.vendor?.address ??
                                      "No details",
                                  style: textTheme.titleSmall!
                                      .copyWith(color: AppColors.hintTextColor),
                                ),
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl:
                                    c.booking.value?.vendor?.imageUrl ?? "",
                                height: 50,
                                fit: BoxFit.contain,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  ImagePath.placeholder,
                                  height: 50,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DetailRow(
                            title: "Total",
                            value: c.booking.value!.total!.toString()),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (c.booking.value?.status == "Unpaid")
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomElevatedButton(
                        title: "Book Ticket",
                        onTap: () {
                          Get.offNamedUntil(
                              PaymentScreen.routeName,
                              (route) =>
                                  route.settings.name == DashScreen.routeName,
                              arguments: [c.booking.value]);
                        },
                        backGroundColor: AppColors.primaryColor),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomElevatedButton(
                    title: "Cancel",
                    backGroundColor: Colors.red,
                    onTap: c.cancelBooking,
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
