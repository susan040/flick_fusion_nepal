import 'package:flick_fusion_nepal/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_fusion_nepal/controller/movies/movie_controller.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';
import 'package:flick_fusion_nepal/utils/date_time_helper.dart';
import 'package:flick_fusion_nepal/widgets/row/details_row.dart';

class MovieDetailScreen extends StatelessWidget {
  final c = Get.find<MovieController>();
  MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: CustomTextStyles.f16W600(color: AppColors.textColor),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              c.movie.value?.description ?? "",
              style: CustomTextStyles.f14W400(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Information",
              style: CustomTextStyles.f16W600(color: AppColors.textColor),
            ),
            const SizedBox(
              height: 8,
            ),
            DetailRow(
              title: "Duration",
              value: DateTimeHelper.toDuration(c.movie.value!.duration!),
            ),
            DetailRow(
              title: "Release Date",
              value: DateTimeHelper.dateWithYear(
                  DateTime.parse(c.movie.value!.releaseDate!)),
            )
          ],
        ),
      ),
    );
  }
}
