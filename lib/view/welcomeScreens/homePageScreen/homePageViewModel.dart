import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yallaplay_mobile/model/Event.dart';
import 'package:yallaplay_mobile/model/stadium.dart';
import 'package:yallaplay_mobile/service/repositories/event_repository.dart';
import 'package:yallaplay_mobile/service/repositories/stadium_repository.dart';

final stadiumViewModelProvider = Provider((ref) => HomePageViewModel());

class HomePageViewModel {
  Future<StadiumResponse> fetchStadium(WidgetRef ref) async {
    return await ref.read(stadiumsReposProvider).getStadiumList();
  }
    Future<EventResponse?> fetchEvent(WidgetRef ref) async {
    return await ref.read(eventReposProvider).getEvents();
  }
}

