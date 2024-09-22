import 'package:flutter/material.dart';
import 'package:yallaplay_mobile/view/ReservationTerrain/reservation_with_time.dart';

class DetailsTerrain extends StatefulWidget {
  const DetailsTerrain({super.key});

  @override
  State<DetailsTerrain> createState() => _DetailsTerrainState();
}

class _DetailsTerrainState extends State<DetailsTerrain> {
  bool colorFav = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color.fromARGB(238, 254, 250, 229),
          child: SafeArea(
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Image.asset(
                        'assets/images/padelexp.jpg',
                        width: MediaQuery.sizeOf(context).width,
                        height: 165,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Colors.white,
                      ),
                      height: 70,
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 130),
                              child: Text(
                                "Details",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Poppins-Medium',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Tennis Squash Maisons-Laffitte",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Poppins-Medium',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Padel I Tennis",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins-Medium',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
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
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.zero,
                    child: const Text(
                      "Informations sur le stade",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
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
                          "Lundi - Dimanche : Du 8h au 20h",
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
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
                          "Indoor I Individuel",
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Matchs disponibles",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 200.0, top: 10),
                      child: Container(
                        height: 160,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 5.0,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/partieIcon.png',
                                    width: 30,
                                    height: 30,
                                    alignment: Alignment.topLeft,
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          "Padel Game",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontFamily: 'Poppins-SemiBold',
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.add_circle,
                                      size: 22,
                                    ),
                                    color: Colors.grey,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                        ),
                                        child: Image.asset(
                                          'assets/icons/localisationIcon.png',
                                          width: 25,
                                          height: 20,
                                          alignment: Alignment.topLeft,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2),
                                        child: Text(
                                          "14:00 - 90min",
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                        ),
                                        child: Image.asset(
                                          'assets/icons/localisationIcon.png',
                                          width: 25,
                                          height: 20,
                                          alignment: Alignment.topLeft,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2),
                                        child: Text(
                                          "3 Joueurs",
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                        ),
                                        child: Image.asset(
                                          'assets/icons/localisationIcon.png',
                                          width: 25,
                                          height: 20,
                                          alignment: Alignment.topLeft,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2),
                                        child: Text(
                                          "Level 0,5 - 1,8",
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                        ),
                                        child: Image.asset(
                                          'assets/icons/localisationIcon.png',
                                          width: 25,
                                          height: 20,
                                          alignment: Alignment.topLeft,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2),
                                        child: Text(
                                          "20 Points",
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
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ReservationWithTime()));
                  },
                  child: Padding(
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
                                "Réserver",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins-Medium',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: const Color.fromARGB(255, 44, 27, 0),
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/timeIcon.png',
                              color: const Color.fromARGB(255, 44, 27, 0),
                              width: 25,
                              height: 20,
                              alignment: Alignment.topLeft,
                            ),
                            const Text(
                              "Itinéraire",
                              style: TextStyle(
                                color: Color.fromARGB(255, 44, 27, 0),
                                fontSize: 12,
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

}
