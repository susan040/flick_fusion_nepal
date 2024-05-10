import 'package:cached_network_image/cached_network_image.dart';
import 'package:flick_fusion_nepal/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_fusion_nepal/model/movies.dart';
import 'package:flick_fusion_nepal/utils/date_time_helper.dart';
import 'package:flick_fusion_nepal/utils/image_path.dart';
import 'package:flick_fusion_nepal/views/movie/movie_screen.dart';

import '../../utils/colors.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool showRightMargin;
  const MovieCard({
    super.key,
    required this.movie,
    this.showRightMargin = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(MovieScreen.routeName, arguments: [movie]);
      },
      child: Container(
        // width: (Get.width / 2) - 20,
        // height: (Get.width / 2) + 40,
        margin: showRightMargin ? const EdgeInsets.only(right: 16) : null,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 1),
                  blurRadius: 8,
                  spreadRadius: 1,
                  color: Colors.black.withOpacity(0.2))
            ]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: movie.image ?? "",
                width: (Get.width / 2) - 20,
                height: (Get.width / 2.5),
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => Image.asset(
                  ImagePath.placeholder,
                  width: (Get.width / 2) - 20,
                  height: (Get.width / 2.5),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${movie.title}",
                    style:
                        CustomTextStyles.f16W600(color: AppColors.primaryColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Release Date: ${DateTimeHelper.dateOnly(DateTime.parse(movie.releaseDate!))}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.f14W400(
                        color: Color.fromARGB(255, 47, 47, 47)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
