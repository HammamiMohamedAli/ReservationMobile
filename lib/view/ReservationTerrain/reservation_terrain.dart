import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:yallaplay_mobile/common/colors.dart';
import 'package:yallaplay_mobile/view/DetailsTerrain/details_terrain.dart';
import 'package:yallaplay_mobile/view/Payment/payment_screen.dart';
import 'package:yallaplay_mobile/view/welcomeScreens/homePageScreen/homePageView.dart';

class ReservationTerrain extends StatefulWidget {
  const ReservationTerrain({super.key});

  @override
  State<ReservationTerrain> createState() => _ReservationTerrainState();
}

class _ReservationTerrainState extends State<ReservationTerrain> {
  bool detectPage = false;
  bool colorFav = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            color: const Color.fromARGB(238, 254, 250, 229),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.search,
                                size: 22,
                              ),
                              color: Colors.grey,
                              onPressed: () {},
                            ),
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Rechercher un terrain',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: detectPage
                            ? const Color.fromARGB(255, 235, 235, 235)
                            : const Color.fromARGB(255, 225, 194, 74),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.menu,
                          color: detectPage
                              ? const Color.fromARGB(255, 195, 195, 195)
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            detectPage = false;
                          });
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: detectPage
                            ? const Color.fromARGB(255, 225, 194, 74)
                            : const Color.fromARGB(255, 235, 235, 235),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.menu,
                          color: detectPage
                              ? Colors.white
                              : const Color.fromARGB(255, 195, 195, 195),
                        ),
                        onPressed: () {
                          setState(() {
                            detectPage = true;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                if (detectPage == false)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 30, right: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                          ),
                          height: 400,
                          // width: double.infinity,
                          child: FlutterMap(
                            options: const MapOptions(
                              // ignore: deprecated_member_use
                              center: LatLng(35.8869, 10.5275),
                              // ignore: deprecated_member_use
                              zoom: 9.0,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://api.mapbox.com/styles/v1/idelib/cli2z895602iu01pnc4u8dzil/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaWRlbGliIiwiYSI6ImNsaTJ5cmIxMDBjdjMzcWxzZGJlOWd6NmwifQ.LWSIxpOSdg7KRJIzILmtgw',
                                additionalOptions: const {
                                  'accessToken':
                                      'pk.eyJ1IjoiaWRlbGliIiwiYSI6ImNsaTJ5cmIxMDBjdjMzcWxzZGJlOWd6NmwifQ.LWSIxpOSdg7KRJIzILmtgw',
                                  'id': 'mapbox.mapbox-streets-v8'
                                },
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    width: 40.0,
                                    height: 40.0,
                                    point: const LatLng(35.8869, 10.5275),
                                    child: IconButton(
                                      icon: const Icon(Icons.location_on),
                                      color: AppColors.yellow,
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                            return const ModalMaps();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Marker(
                                    width: 150.0,
                                    height: 100.0,
                                    point: const LatLng(35.8869, 10.0870),
                                    child: IconButton(
                                      icon: const Icon(Icons.location_on),
                                      color: AppColors.yellow,
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                            return const ModalMaps();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Marker(
                                    width: 90.0,
                                    height: 90.0,
                                    point: const LatLng(35.9969, 10.5275),
                                    child: IconButton(
                                      icon: const Icon(Icons.location_on),
                                      color: AppColors.yellow,
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                            return const ModalMaps();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Marker(
                                    width: 150.0,
                                    height: 100.0,
                                    point: const LatLng(35.8069, 10.0870),
                                    child: IconButton(
                                      icon: const Icon(Icons.location_on),
                                      color: AppColors.yellow,
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                            return const ModalMaps();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Marker(
                                    width: 150.0,
                                    height: 100.0,
                                    point: const LatLng(35.7069, 10.7870),
                                    child: IconButton(
                                      icon: const Icon(Icons.location_on),
                                      color: AppColors.yellow,
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                            return const ModalMaps();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 30.0,
                          top: 15,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Les terrains à proximité",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins-SemiBold',
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      const ClubDispoWidget(),
                    ],
                  )
                else
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                      ),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/tennisSquash.png',
                                width: 45,
                                height: 45,
                                alignment: Alignment.topLeft,
                              ),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "Tennis Squash Maisons-Laffitte",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontFamily: 'Poppins-SemiBold',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 150),
                                    child: Text(
                                      "Paddel",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontFamily: 'Poppins-SemiBold',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: IconButton(
                                  color: colorFav
                                      ? const Color.fromARGB(255, 225, 194, 74)
                                      : const Color.fromARGB(
                                          255, 214, 214, 214),
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.favorite,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      colorFav = !colorFav;
                                    });
                                  },
                                ),
                              ),
                            ],
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
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                "6 Avenue Desaix 78600 Maisons-Laffitte ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
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
                                  fontSize: 10,
                                  fontFamily: 'Poppins-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 30,
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/timeIcon.png',
                                          width: 25,
                                          height: 20,
                                          alignment: Alignment.topLeft,
                                        ),
                                        const Text(
                                          "Itinéraire",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontFamily: 'Poppins-Medium',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                height: 30,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      const Color.fromARGB(255, 225, 194, 74),
                                ),
                                child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/timeIcon.png',
                                          color: Colors.white,
                                          width: 25,
                                          height: 20,
                                          alignment: Alignment.topLeft,
                                        ),
                                        const Text(
                                          "Réserver",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontFamily: 'Poppins-Medium',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(242, 233, 180, 0.94),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Réserver votre terrain',
          style: TextStyle(fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePageScreen(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const ModalFilter();
                },
              );
            },
          ),
        ],
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
      ),
    );
  }
}

class ClubDispoWidget extends StatelessWidget {
  const ClubDispoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            'assets/images/tennisSquash.png',
                            width: 45,
                            height: 45,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Tennis Squash \nMaisons-Laffitte",
                            style: TextStyle(
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
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
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
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
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
            ),
            Align(
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
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          'assets/images/mantes.png',
                          width: 45,
                          height: 45,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Tennis Squash \nMaisons-Laffitte",
                          style: TextStyle(
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
                          padding: const EdgeInsets.only(left: 8.0, top: 10),
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
                          padding: const EdgeInsets.only(left: 8.0, top: 10),
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
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
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
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            'assets/images/tennisSquash.png',
                            width: 45,
                            height: 45,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Tennis Squash \nMaisons-Laffitte",
                            style: TextStyle(
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
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
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
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
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
            ),
          ],
        ),
      ),
    );
  }
}

class ModalFilter extends StatefulWidget {
  const ModalFilter({super.key});

  @override
  State<ModalFilter> createState() => _ModalFilterState();
}

class _ModalFilterState extends State<ModalFilter> {
  String? selectedValue;
  double _sliderValue = 10.0;
  List<String> radioOptions = ['Indoor', 'Extérieur', 'Indifférent'];
  List<String> radioOptionsDuree = ['60 min', '90 min', '120 min'];
  String selectedOption = '';
  String selectedOptionDuree = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 251, 237),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        height: MediaQuery.sizeOf(context).height * 0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 120.0, right: 120, top: 5),
              child: Divider(
                color: Color.fromARGB(255, 225, 194, 74),
                height: 15,
                thickness: 7,
                indent: 0,
                endIndent: 0,
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                "Filtrer vos résultats",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.add_location_alt,
                    size: 25,
                    color: Color.fromARGB(255, 225, 194, 74),
                  ),
                  Text(
                    "Ville",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 215, 214, 214),
                      width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButton<String>(
                  value: selectedValue,
                  items: ['Tunis', 'Sfax', 'Sousse', 'Bizerte']
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: SizedBox(
                              width: 250,
                              child: Text(e),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  hint: const Text('Sousse'),
                  underline: Container(color: Colors.transparent),
                  icon: const RotationTransition(
                    turns: AlwaysStoppedAnimation(90 / 360),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Color.fromARGB(255, 225, 194, 74),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.add_location_alt,
                    size: 25,
                    color: Color.fromARGB(255, 225, 194, 74),
                  ),
                  Text(
                    "Distance",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: const Color.fromARGB(255, 225, 194, 74),
                inactiveTrackColor: const Color.fromARGB(255, 201, 201, 201),
                thumbColor: const Color.fromARGB(255, 225, 194, 74),
                overlayColor:
                    const Color.fromARGB(255, 201, 201, 201).withOpacity(0.3),
                valueIndicatorColor: const Color.fromARGB(255, 201, 201, 201),
                trackHeight: 8.0,
              ),
              child: Slider(
                value: _sliderValue,
                min: 1,
                max: 35,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    "1 Km",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 245.0),
                  child: Text(
                    "35 Km",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.add_location_alt,
                    size: 25,
                    color: Color.fromARGB(255, 225, 194, 74),
                  ),
                  Text(
                    "Durée",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: radioOptions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Container(
                      width: 100,
                      //margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 219, 219, 219),
                        ),
                        color: const Color.fromARGB(255, 239, 239, 239),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            activeColor:
                                const Color.fromARGB(255, 225, 194, 74),
                            value: radioOptionsDuree[index],
                            groupValue: selectedOptionDuree,
                            onChanged: (value) {
                              setState(() {
                                selectedOptionDuree = value.toString();
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              radioOptionsDuree[index],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Icon(
                    Icons.add_location_alt,
                    size: 25,
                    color: Color.fromARGB(255, 225, 194, 74),
                  ),
                  Text(
                    "Clôture",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: radioOptions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 210, 209, 209)),
                    ),
                    child: Row(
                      children: [
                        Radio(
                          activeColor: const Color.fromARGB(255, 225, 194, 74),
                          value: radioOptions[index],
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value.toString();
                            });
                          },
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioOptions[index],
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 40,
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 225, 194, 74),
                      ),
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/timeIcon.png',
                                color: Colors.white,
                                width: 25,
                                height: 20,
                                alignment: Alignment.topLeft,
                              ),
                              const Text(
                                "Valider",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Poppins-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 40,
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/timeIcon.png',
                                color: const Color.fromARGB(255, 0, 0, 0),
                                width: 25,
                                height: 20,
                                alignment: Alignment.topLeft,
                              ),
                              const Text(
                                "Réinitialiser",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 14,
                                  fontFamily: 'Poppins-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]),
                      ),
                    ),
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

class ModalMaps extends StatefulWidget {
  const ModalMaps({super.key});

  @override
  State<ModalMaps> createState() => _ModalMapsState();
}

class _ModalMapsState extends State<ModalMaps> {
  bool colorFav = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 248, 241, 219),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        height: MediaQuery.sizeOf(context).height * 0.33,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 120.0, right: 120, top: 5),
              child: Divider(
                color: Color.fromARGB(255, 225, 194, 74),
                height: 15,
                thickness: 7,
                indent: 0,
                endIndent: 0,
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                "Voir vos résultats",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 20),
              child: Column(children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/tennisSquash.png',
                      width: 45,
                      height: 45,
                      alignment: Alignment.topLeft,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DetailsTerrain()));
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Tennis Squash Maisons-Laffitte",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Poppins-SemiBold',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 150),
                          child: Text(
                            "Paddel",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'Poppins-SemiBold',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: IconButton(
                        color: colorFav
                            ? const Color.fromARGB(255, 225, 194, 74)
                            : const Color.fromARGB(255, 214, 214, 214),
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.favorite,
                        ),
                        onPressed: () {
                          setState(() {
                            colorFav = !colorFav;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 10),
                      child: Image.asset(
                        'assets/icons/localisationIcon.png',
                        width: 25,
                        height: 20,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Text(
                        "6 Avenue Desaix 78600 Maisons-Laffitte ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
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
                      padding: const EdgeInsets.only(left: 8.0, top: 10),
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
                          fontSize: 10,
                          fontFamily: 'Poppins-Medium',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/timeIcon.png',
                                  width: 25,
                                  height: 20,
                                  alignment: Alignment.topLeft,
                                ),
                                const Text(
                                  "Itinéraire",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontFamily: 'Poppins-Medium',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ValidPayement()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 225, 194, 74),
                          ),
                          child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/timeIcon.png',
                                    color: Colors.white,
                                    width: 25,
                                    height: 20,
                                    alignment: Alignment.topLeft,
                                  ),
                                  const Text(
                                    "Réserver",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: 'Poppins-Medium',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
