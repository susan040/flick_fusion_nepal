import 'package:flick_fusion_nepal/utils/colors.dart';
import 'package:flick_fusion_nepal/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_fusion_nepal/controller/booking/booking_controller.dart';
import 'package:flick_fusion_nepal/widgets/error_screen.dart';
import 'package:flick_fusion_nepal/widgets/row/booking_row.dart';

class BookingsScreen extends StatelessWidget {
  static const String routeName = "/bookings-screen";
  final c = Get.find<BookingController>();
  BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "My Tickets",
          style: CustomTextStyles.f16W400(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(
            () {
              if (c.isLoading.value) {
                return const LinearProgressIndicator();
              } else if (!c.isLoading.value && c.bookings.isEmpty) {
                return SizedBox(
                  height: Get.height / 1.2,
                  child: const ErrorScreen(),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    itemCount: c.bookings.length,
                    itemBuilder: (context, index) {
                      var booking = c.bookings[index];
                      return BookingRow(booking: booking);
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
