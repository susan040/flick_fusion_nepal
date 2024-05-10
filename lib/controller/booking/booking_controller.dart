import 'package:get/get.dart';
import 'package:flick_fusion_nepal/model/booking.dart';
import 'package:flick_fusion_nepal/repo/booking/booking_repo.dart';
import 'package:flick_fusion_nepal/utils/custom_snackbar.dart';

class BookingController extends GetxController {
  RxBool isLoading = RxBool(false);
  RxList<Booking> bookings = RxList<Booking>();

  @override
  void onInit() {
    getBookings();
    super.onInit();
  }

  void getBookings() async {
    isLoading.value = true;

    await BookingRepo.getBookings(
      onSuccess: (bookings) {
        isLoading.value = false;
        this.bookings.addAll(bookings);
      },
      onError: (message) {
        isLoading.value = false;
        CustomSnackBar.error(message: message);
      },
    );
  }
}
