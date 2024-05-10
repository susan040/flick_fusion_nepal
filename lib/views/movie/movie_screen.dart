import 'package:flick_fusion_nepal/utils/colors.dart';
import 'package:flick_fusion_nepal/utils/custom_text_styles.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_fusion_nepal/controller/movies/movie_controller.dart';
import 'package:flick_fusion_nepal/views/movie/movie_detail_screen.dart';
import 'package:flick_fusion_nepal/views/movie/show_detail_screen.dart';
import 'package:flick_fusion_nepal/widgets/chip_button.dart';

class MovieScreen extends StatelessWidget {
  static const String routeName = "/movie-screen";
  final c = Get.find<MovieController>();
  MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.hintTextColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text("${c.movie.value?.title}"),
          centerTitle: true,
        ),
        body: Obx(() {
          if (c.isLoading.value) {
            return const LinearProgressIndicator();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () {
                    if (c.videoInitialized.value) {
                      return AspectRatio(
                        aspectRatio: 16 / 9,
                        child: FlickVideoPlayer(
                          flickManager: c.flickManager,
                        ),
                      );
                    } else {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        width: Get.width,
                        height: 170,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator()),
                          ],
                        ),
                      );
                    }
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: Text(
                    c.movie.value!.title ?? "",
                    style:
                        CustomTextStyles.f18W600(color: AppColors.primaryColor),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: Row(
                    children: [
                      Obx(
                        () => ChipButton(
                          title: "Details",
                          isActive: c.currentTab.value == "details",
                          onTap: () {
                            c.changeTab("details");
                          },
                        ),
                      ),
                      if (c.movie.value!.showTimes!.isNotEmpty)
                        Obx(
                          () => ChipButton(
                            title: "Show Details",
                            isActive: c.currentTab.value == "show_details",
                            onTap: () {
                              c.changeTab("show_details");
                            },
                          ),
                        ),
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: PageView(
                    controller: c.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [MovieDetailScreen(), ShowDetailScreen()],
                  ),
                ),
              ],
            );
          }
        }));
  }
}
