import 'package:flick_fusion_nepal/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_fusion_nepal/controller/movies/theater_controller.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';
import 'package:flick_fusion_nepal/utils/price_helper.dart';
import 'package:flick_fusion_nepal/widgets/custom/custom_elevated_button.dart';
import 'package:flick_fusion_nepal/widgets/row/seat_widget.dart';
import 'package:zoom_widget/zoom_widget.dart';

class TheaterScreen extends StatelessWidget {
  static const String routeName = "/theater-screen";
  final c = Get.find<TheaterController>();
  TheaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Column(
            children: [
              Obx(
                () => Text(
                  c.title.value,
                  style: CustomTextStyles.f14W400(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(
                () => Text(
                  c.subTitle.value,
                  style: CustomTextStyles.f12W400(),
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: Get.height + 36,
            child: Obx(() {
              if (c.isLoading.value) {
                return const LinearProgressIndicator();
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Theater: ${c.theater.value!.name}",
                      style: textTheme.titleLarge,
                    ),
                    SizedBox(
                      width: (c.theater.value!.columns! * 45) >= Get.width
                          ? Get.width
                          : (c.theater.value!.columns! * 45),
                      height: Get.height / 2,
                      child: Zoom(
                        // backgroundColor: Colors.yellow,
                        // canvasColor: Colors.pink,
                        initTotalZoomOut: true,
                        child: SizedBox(
                          height: Get.height / 2,
                          width: (c.theater.value!.columns! * 45) >= Get.width
                              ? Get.width
                              : (c.theater.value!.columns! * 45),
                          child: GridView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: c.theater.value!.columns!,
                            ),
                            itemCount: c.seats.length,
                            itemBuilder: (context, index) {
                              var seat = c.seats[index];
                              return Obx(() => SeatWidget(
                                    seat: seat,
                                    onTap: () {
                                      c.selectSeat(seat.seatId!);
                                    },
                                    isSelected:
                                        c.selectedSeats.contains(seat.seatId),
                                  ));
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                      child: Stack(
                        children: [
                          Center(
                              child: SizedBox(
                                  width: Get.width,
                                  child: const Divider(
                                    color: AppColors.primaryColor,
                                  ))),
                        ],
                      ),
                    ),
                    // const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Screen",
                            style: CustomTextStyles.f12W600(),
                          ),
                          const Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SeatDetailWidget(
                                  label: 'Available', color: Colors.green),
                              SizedBox(width: 16),
                              SeatDetailWidget(
                                  label: 'Selected', color: Colors.blue),
                            ],
                          ),
                          const Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SeatDetailWidget(
                                  label: 'Reserved', color: Colors.orange),
                              SizedBox(width: 16),
                              SeatDetailWidget(
                                  label: 'Booked', color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(
                        color: AppColors.hintTextColor,
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Number of Seats",
                              style: CustomTextStyles.f12W600(),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            flex: 2,
                            child: Obx(
                              () => Text(
                                "${c.selectedSeats.length}",
                                style: textTheme.bodyMedium,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(
                        color: AppColors.hintTextColor,
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Total",
                              style: CustomTextStyles.f12W600(),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            flex: 2,
                            child: Obx(
                              () => Text(
                                (c.selectedSeats.length *
                                        c.show.value!.ticketPrice!)
                                    .toPrice(),
                                style: textTheme.bodyMedium,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(
                        color: AppColors.hintTextColor,
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              title: "Buy",
                              onTap: c.buyTicket,
                              backGroundColor: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: CustomElevatedButton(
                              title: "Reserve",
                              onTap: c.reserveSeats,
                              backGroundColor: Colors.amber,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: CustomElevatedButton(
                              title: "Cancel",
                              backGroundColor: Colors.red,
                              onTap: () {
                                Get.back();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                );
              }
            }),
          ),
        ));
  }
}

class SeatDetailWidget extends StatelessWidget {
  final Color color;
  final String label;
  const SeatDetailWidget({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(color: AppColors.textColor),
        ),
      ],
    );
  }
}
