import 'package:cached_network_image/cached_network_image.dart';
import 'package:flick_fusion_nepal/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_fusion_nepal/model/booking.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';
import 'package:flick_fusion_nepal/utils/date_time_helper.dart';
import 'package:flick_fusion_nepal/utils/image_path.dart';
import 'package:flick_fusion_nepal/views/booking/booking_details.dart';

class BookingRow extends StatelessWidget {
  const BookingRow({
    super.key,
    required this.booking,
  });

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return InkWell(
      onTap: () {
        Get.toNamed(BookingDetailScreen.routeName, arguments: [booking]);
      },
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ),
          margin: const EdgeInsets.only(bottom: 16),
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: booking.movie?.imageUrl ?? "",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      Image.asset(ImagePath.placeholder),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${booking.movie!.title!} ${getStatus()}",
                      style: CustomTextStyles.f12W600(
                          color: AppColors.primaryColor)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(DateTimeHelper.toDuration(booking.movie!.duration!),
                      style:
                          CustomTextStyles.f14W400(color: AppColors.textColor)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${booking.vendor!.name!} (${booking.vendor!.address ?? "No address"})",
                    style: CustomTextStyles.f14W400(color: AppColors.textColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                      DateTimeHelper.prettyDateWithDayTime(
                          DateTime.parse(booking.showTime!)),
                      style: CustomTextStyles.f16W600(
                          color: AppColors.primaryColor)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String getStatus() {
    if (booking.status == "Paid") {
      return "(Booked)";
    } else if (booking.status == "Unpaid") {
      return "(Reserved)";
    } else {
      return "(---)";
    }
  }
}
