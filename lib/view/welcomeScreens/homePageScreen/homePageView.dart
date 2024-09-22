// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yallaplay_mobile/common/colors.dart';
import 'package:yallaplay_mobile/service/repositories/activity_repository.dart';
import 'package:yallaplay_mobile/view/JoinParty/join_party-screen.dart';
import 'package:yallaplay_mobile/view/ReservationTerrain/reservation_terrain.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/homePageScreen/homePageViewModel.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/questionScreens/question_view.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/resultQuestion/result_question_view_model.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/sportSectionScreen/section_view.dart';
import 'package:yallaplay_mobile/widget/bottomNavigatorBar.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageScreenState createState() => _HomePageScreenState();
}

final activityFutureProvider = FutureProvider.family(
  (ref, WidgetRef widgetRef) async =>
      ref.watch(activityViewModelProvider).fetchActivityInfo(widgetRef),
);

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    // return Consumer(builder: (context, ref, child) {
    //   final activitiesFutureProvider = ref.watch(activityFutureProvider(ref));
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        child: GestureDetector(
          onTap: () async {},
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(238, 254, 250, 229),
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/bottomImage.png",
                  height: 60,
                  width: 60,
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
      body:
          //  activitiesFutureProvider.when(
          //   data: (data) =>
          SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 250, 227),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset('assets/images/Groupe 46@2x.png', width: 60),
                      Padding(
                        padding: const EdgeInsets.only(left: 180.0),
                        child: Container(
                            // padding: const EdgeInsets.only(left: 180.0),
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(178, 251, 230, 144),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '100',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    ' Points',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Bonjour',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins-Regular',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      // '${data!.data.firstName} ${data.data.lastName}',
                      "Ayoub Test",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Poppins-SemiBold',
                          fontWeight: FontWeight.w700),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/star.png', width: 40),
                    const Text(
                      // data.data.activity.ratingValue.toString(),
                      "3.6",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      ' est votre niveau',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const FirstPartieScreen(),
              const Padding(
                padding: EdgeInsets.only(left: 20.0,top: 20,bottom: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Jouez votre match",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins-SemiBold',
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const ReservationWidget(),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  top: 20,
                  bottom: 20
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Les clubs disponibles",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins-SemiBold',
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const ClubDispoWidget(),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "How to use YallaPlay",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins-SemiBold',
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const UseYallaPlayWidget(),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
      //     error: (Object error, StackTrace stackTrace) {
      //       return _popupParticipateActivity();
      //     },
      //     loading: () {
      //       return null;
      //     },
      //   ),
      // );
      //});
    );
  }

  // ignore: unused_element
  _popupParticipateActivity() {
    return AlertDialog(
      elevation: 0,
      insetPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      content: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: const Offset(0, 10))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Confirmation",
                  style: TextStyle(
                      fontSize: 27,
                      color: AppColors.yellow,
                      fontWeight: FontWeight.bold),
                ),
                const Center(
                  child: Text(
                    '''Vous n'avez pas encore participé à cette activité sportive\n\n Vous pouvez choisir cette activité ?''',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final _storage = const FlutterSecureStorage();
                          final selectedSport =
                              await _storage.read(key: 'selected_sport');
                          Map body = {
                            "activity": selectedSport,
                          };
                          ActivityRepos().ChooseActivity(body);
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuestionScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                        ),
                        child: const Text(
                          'OUI',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SectionView(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                        ),
                        child: const Text(
                          'NON',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FirstPartieScreen extends ConsumerStatefulWidget {
  const FirstPartieScreen({super.key});

  @override
  _FirstPartieScreenState createState() => _FirstPartieScreenState();
}

final eventViewFutureProvider = FutureProvider.family(
  (ref, WidgetRef widgetRef) async =>
      ref.watch(stadiumViewModelProvider).fetchEvent(widgetRef),
);

class _FirstPartieScreenState extends ConsumerState<FirstPartieScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final eventProvider = ref.watch(eventViewFutureProvider(ref));
      return SingleChildScrollView(
        child: eventProvider.when(
          data: (data) {
            return Container(
              padding: EdgeInsets.zero,
              //color: Colors.black,
              height: 185,
              width: MediaQuery.sizeOf(context).width * 0.90,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: data?.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.zero,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.23,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/background/background4.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                                top: 5,
                              ),
                              child: Text(
                                data!.data[index].title,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Poppins-SemiBold',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                data.data[index].content,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins-Regular',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              height: 113,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                  data.data[index].picture.toString(),
                                  width: MediaQuery.of(context).size.width,
                                  height: 113,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets//images/padel.png',
                                      width: MediaQuery.of(context).size.width,
                                      height: 113,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Container();
          },
          loading: () {
            return Container();
          },
        ),
      );
    });
  }
}

class ReservationWidget extends StatefulWidget {
  const ReservationWidget({super.key});

  @override
  State<ReservationWidget> createState() => _ReservationWidgetState();
}

class _ReservationWidgetState extends State<ReservationWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4371,
              height: MediaQuery.of(context).size.height * 0.159,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        'assets/icons/iconReservation.png',
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Réserver votre \nterrain",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Poppins-Medium',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ReservationTerrain()));
                            },
                            child: Image.asset(
                              'assets/icons/fleche.png',
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4371,
              height: MediaQuery.of(context).size.height * 0.159,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        'assets/icons/partieIcon.png',
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Rejoindre une \npartie",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Poppins-Medium',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const JoinPartyScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              'assets/icons/fleche.png',
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ClubDispoWidget extends ConsumerStatefulWidget {
  const ClubDispoWidget({super.key});

  @override
  _ClubDispoWidgetState createState() => _ClubDispoWidgetState();
}

final stadiumViewFutureProvider = FutureProvider.family(
  (ref, WidgetRef widgetRef) async =>
      ref.watch(stadiumViewModelProvider).fetchStadium(widgetRef),
);

class _ClubDispoWidgetState extends ConsumerState<ClubDispoWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final stadiumFutureProvider = ref.watch(stadiumViewFutureProvider(ref));

        return stadiumFutureProvider.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (data) {
            return SizedBox(
              width: 460,
              height: 178,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: data.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.33,
                        height: MediaQuery.of(context).size.height * 0.225,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                // ignore: unnecessary_null_comparison
                                child: (data.data[index].pictures != null &&
                                        data.data[index].pictures.isNotEmpty &&
                                        data
                                                .data[index]
                                                .pictures[index %
                                                    data.data[index].pictures
                                                        .length]
                                                .picture !=
                                            null)
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          data
                                              .data[index]
                                              .pictures[index %
                                                  data.data[index].pictures
                                                      .length]
                                              .picture,
                                          width: 45,
                                          height: 45,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                              ),
                                              child: Image.asset(
                                                'assets/images/tennisSquash.png',
                                                width: 45,
                                                height: 45,
                                                alignment: Alignment.topLeft,
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                        ),
                                        child: Image.asset(
                                          'assets/images/tennisSquash.png',
                                          width: 45,
                                          height: 45,
                                          alignment: Alignment.topLeft,
                                        ),
                                      ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  data.data[index].name,
                                  //data[index].data[index].name.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Poppins-Medium',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 10),
                                  child: Image.asset(
                                    'assets/icons/localisationIcon.png',
                                    width: 25,
                                    height: 20,
                                    alignment: Alignment.topLeft,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "6 Avenue Desaix \n78600 Maisons-Laffitte ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 7,
                                      fontFamily: 'Poppins-Medium',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 10),
                                  child: Image.asset(
                                    'assets/icons/timeIcon.png',
                                    width: 25,
                                    height: 20,
                                    alignment: Alignment.topLeft,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 13.0),
                                  child: Text(
                                    "Du 8h au 20h",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8,
                                      fontFamily: 'Poppins-Medium',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

// class ClubDispoWidget extends StatelessWidget {
//   const ClubDispoWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 15.0),
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * 0.33,
//                   height: MediaQuery.of(context).size.height * 0.23,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0, top: 10),
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: Image.asset(
//                             'assets/images/tennisSquash.png',
//                             width: 45,
//                             height: 45,
//                           ),
//                         ),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(left: 10.0, top: 10),
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             "Tennis Squash \nMaisons-Laffitte",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12,
//                               fontFamily: 'Poppins-Medium',
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8.0, top: 10),
//                             child: Image.asset(
//                               'assets/icons/localisationIcon.png',
//                               width: 25,
//                               height: 20,
//                               alignment: Alignment.topLeft,
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(top: 10.0),
//                             child: Text(
//                               "6 Avenue Desaix \n78600 Maisons-Laffitte ",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 7,
//                                 fontFamily: 'Poppins-Medium',
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8.0, top: 10),
//                             child: Image.asset(
//                               'assets/icons/timeIcon.png',
//                               width: 25,
//                               height: 20,
//                               alignment: Alignment.topLeft,
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(top: 13.0),
//                             child: Text(
//                               "Du 8h au 20h",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 8,
//                                 fontFamily: 'Poppins-Medium',
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.33,
//                 height: MediaQuery.of(context).size.height * 0.23,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 10),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Image.asset(
//                           'assets/images/mantes.png',
//                           width: 45,
//                           height: 45,
//                         ),
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 10.0, top: 10),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           "Tennis Squash \nMaisons-Laffitte",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 12,
//                             fontFamily: 'Poppins-Medium',
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8.0, top: 10),
//                           child: Image.asset(
//                             'assets/icons/localisationIcon.png',
//                             width: 25,
//                             height: 20,
//                             alignment: Alignment.topLeft,
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.only(top: 10.0),
//                           child: Text(
//                             "6 Avenue Desaix \n78600 Maisons-Laffitte ",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 7,
//                               fontFamily: 'Poppins-Medium',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8.0, top: 10),
//                           child: Image.asset(
//                             'assets/icons/timeIcon.png',
//                             width: 25,
//                             height: 20,
//                             alignment: Alignment.topLeft,
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.only(top: 13.0),
//                           child: Text(
//                             "Du 8h au 20h",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 8,
//                               fontFamily: 'Poppins-Medium',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }

class UseYallaPlayWidget extends StatefulWidget {
  const UseYallaPlayWidget({super.key});

  @override
  State<UseYallaPlayWidget> createState() => _UseYallaPlayWidgetState();
}

class _UseYallaPlayWidgetState extends State<UseYallaPlayWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/Groupe 217@2x.png',
                      width: 95,
                      height: 95,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Comment jouer \nsur YallaPlay",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/icons/Groupe de masques 17@2x.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/Groupe 218@2x.png',
                      width: 95,
                      height: 95,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Système de \nclassement",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/icons/Groupe de masques 17@2x.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/Groupe 219@2x.png',
                      width: 95,
                      height: 95,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Comment payer \nsur YallaPlay",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          'assets/icons/Groupe de masques 17@2x.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
