import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yallaplay_mobile/model/User.dart';
import 'package:yallaplay_mobile/service/api_base_helper.dart';
import '../endpoints.dart' as end_points;

final userReposProvider = Provider((ref) => UserInfoRepos());

class UserInfoRepos {
  Future<User?> me() async {
    ApiBaseHelper helper = ApiBaseHelper();

    final response = await helper.get(end_points.GetPLAYER, showLoader: true);

    if (response.statusCode == 200) {
      User playerInfo = User.fromJson(json.decode(response.body)['data']);

      return playerInfo;
    } else {
      return null;
    }
  }
}
