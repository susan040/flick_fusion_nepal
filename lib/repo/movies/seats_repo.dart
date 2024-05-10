import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flick_fusion_nepal/model/seats.dart';
import 'package:flick_fusion_nepal/model/theaters.dart';
import 'package:flick_fusion_nepal/utils/api.dart';
import 'package:flick_fusion_nepal/utils/http_request.dart';
import 'package:flick_fusion_nepal/utils/storage_helper.dart';

class SeatsRepo {
  static Future<void> getSeats(
      {required int showId,
      required String showDate,
      required String showTime,
      required int showPrice,
      required int theaterId,
      required Function(Theaters theater, List<Seat> seats) onSuccess,
      required Function(String message) onError}) async {
    try {
      var token = StorageHelper.getToken();

      var headers = {
        "Accept": "application/json",
        "Authorization": token.toString()
      };

      var body = {
        "show_id": showId.toString(),
        "show_date": showDate,
        "show_time": showTime,
        "show_price": showPrice.toString(),
        "theater_id": theaterId.toString()
      };

      http.Response response = await HttpRequest.post(
          Uri.parse(Api.getShowDetails),
          headers: headers,
          body: body);

      log("${Api.getShowDetails} ===========>");
      log(response.body);

      dynamic data = json.decode(response.body);

      if (data['success']) {
        var theater = Theaters.fromJson(data['data']['theater']);
        var seats = seatsFromJson(data['data']['seats']);
        onSuccess(theater, seats);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry! something went wrong");
    }
  }
}
