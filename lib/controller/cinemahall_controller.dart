import 'package:get/get.dart';
import 'package:flick_fusion_nepal/model/halls.dart';
import 'package:flick_fusion_nepal/model/movies.dart';
import 'package:flick_fusion_nepal/repo/movies/movies_repo.dart';

class CinemaHallController extends GetxController {
  Rxn<CinemaHalls> cinemaHall = Rxn<CinemaHalls>();

  RxBool isLoading = RxBool(false);

  RxList<Movie> nowShowing = RxList();
  RxList<Movie> commingSoon = RxList();

  @override
  void onInit() {
    var data = Get.arguments[0];
    cinemaHall.value = data;
    getMovies();
    super.onInit();
  }

  void getMovies() async {
    isLoading.value = true;

    await MoviesRepo.getCurrentMovies(
      vendorId: cinemaHall.value!.id!,
      onSuccess: (nowShowing, commingSoon) {
        this.nowShowing.addAll(nowShowing);
        this.commingSoon.addAll(commingSoon);
        isLoading.value =false;
      },
      onError: (message) {
        isLoading.value = false;
      },
    );
  }
}
