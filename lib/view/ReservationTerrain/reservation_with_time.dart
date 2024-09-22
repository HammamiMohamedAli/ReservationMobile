import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/date_symbol_data_local.dart';
import 'package:yallaplay_mobile/view/Payment/payment_screen.dart';

class ReservationWithTime extends StatefulWidget {
  const ReservationWithTime({super.key});

  @override
  State<ReservationWithTime> createState() => _ReservationWithTimeState();
}

class _ReservationWithTimeState extends State<ReservationWithTime> {
  bool light = false;
  List<String> radioOptions = ['60 min', '90 min', '120 min'];
  String selectedOptionDuree = '';
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr', null);
  }

  void setFrenchLocale() {
    initializeDateFormatting('fr', null);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          color: const Color.fromARGB(238, 254, 250, 229),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
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
                                  padding: EdgeInsets.only(left: 45),
                                  child: Text(
                                    "Tennis Squash Maisons-Laffitte",
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Date",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Poppins-SemiBold',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 60.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 30,
                              itemBuilder: (context, index) {
                                DateTime currentDate =
                                    DateTime.now().add(Duration(days: index));
                                bool isSelected = selectedDate == currentDate;

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDate = currentDate;
                                    });
                                  },
                                  child: Container(
                                    width: 50.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.blue
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          DateFormat('EEE', 'fr')
                                              .format(currentDate)
                                              .capitalize(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'Poppins-Medium',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          "${currentDate.day}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Poppins-Medium',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          DateFormat('MMM', 'fr')
                                              .format(currentDate)
                                              .capitalize(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'Poppins-Medium',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Horaires",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Poppins-SemiBold',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                "Afficher uniquement les horaires disponibles",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Poppins-Regular',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: CupertinoSwitch(
                                value: light,
                                activeColor:
                                    const Color.fromARGB(255, 237, 217, 145),
                                onChanged: (bool? value) {
                                  setState(() {
                                    light = value ?? false;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 15,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: Wrap(
                              spacing: 20.0,
                              runSpacing: 10.0,
                              children: List.generate(
                                20,
                                (index) => Container(
                                  height: 35,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: const Column(
                                    children: [
                                      Text(
                                        "06:00",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontFamily: 'Poppins-Medium',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "am",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontFamily: 'Poppins-Medium',
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 140.0, left: 20),
                          child: Text(
                            "Durée",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Poppins-SemiBold',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: 40,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: radioOptions.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 219, 219, 219),
                                    ),
                                    color: const Color.fromARGB(
                                        255, 244, 244, 244),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Radio(
                                        activeColor: const Color.fromARGB(
                                            255, 225, 194, 74),
                                        value: radioOptions[index],
                                        groupValue: selectedOptionDuree,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedOptionDuree =
                                                value.toString();
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text(
                                          radioOptions[index],
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
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 30,
                        right: 40,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Quote-part",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppins-SemiBold',
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            height: 40,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFF3C2),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                              ),
                            ),
                            child: const Center(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.badge,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '20 Points',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Poppins-Regular',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return const ModalPayment();
                          },
                        );
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
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

class ModalPayment extends StatefulWidget {
  const ModalPayment({super.key});

  @override
  State<ModalPayment> createState() => _ModalPaymentState();
}

class _ModalPaymentState extends State<ModalPayment> {
  String? selectedValue;

  List<String> radioOptionsTypeMAtch = ['Match compétitif', 'Terrain Précisé'];
  List<String> radioOptionsGender = [
    'Indifférent',
    'Mixte',
    'Femmes uniquement'
  ];

  String selectedOptionTypeMatch = '';
  String selectedOptionGender = '';
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
        height: MediaQuery.sizeOf(context).height * 0.65,
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
                "Lancer un match",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                "Type de match",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins-Regular',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: radioOptionsTypeMAtch.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 252, 249, 249),
                      border: Border.all(
                          color: const Color.fromARGB(255, 210, 209, 209)),
                    ),
                    child: Row(
                      children: [
                        Radio(
                          activeColor: const Color.fromARGB(255, 225, 194, 74),
                          value: radioOptionsTypeMAtch[index],
                          groupValue: selectedOptionTypeMatch,
                          onChanged: (value) {
                            setState(() {
                              selectedOptionTypeMatch = value.toString();
                            });
                          },
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioOptionsTypeMAtch[index],
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
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                "Sexe des autres joueurs",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins-Regular',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: radioOptionsGender.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 252, 249, 249),
                      border: Border.all(
                          color: const Color.fromARGB(255, 210, 209, 209)),
                    ),
                    child: Row(
                      children: [
                        Radio(
                          activeColor: const Color.fromARGB(255, 225, 194, 74),
                          value: radioOptionsGender[index],
                          groupValue: selectedOptionGender,
                          onChanged: (value) {
                            setState(() {
                              selectedOptionGender = value.toString();
                            });
                          },
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioOptionsGender[index],
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ValidPayement()));
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 225, 194, 74),
                    ),
                    child: const Center(
                      child: Text(
                        "Payer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins-Regular',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
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
