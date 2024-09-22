import 'package:flutter/material.dart';
import 'package:yallaplay_mobile/view/PlayerScreen/add_player.dart';

class ValidPayement extends StatefulWidget {
  const ValidPayement({super.key});

  @override
  State<ValidPayement> createState() => _ValidPayementState();
}

class _ValidPayementState extends State<ValidPayement> {
  final _formKey = GlobalKey<FormState>();
  String radioValueselected = "";
  List<String> radioOptions = ['60'];
  String selectedOption = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        shape: ShapeBorder.lerp(
        
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          null,
          0,
        ),
        shadowColor: Colors.black87,
        title: const SizedBox(
          width: 168.0,
          height: 20.0,
          child: Center(
            child: Text(
              'Validation de Paiement',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins-Regular',
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        titleSpacing: 25.0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(238, 254, 250, 229),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MyContainer(),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0,bottom: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Paiement",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Poppins-SemiBold',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                    color: Colors.white,
                    height: 100,
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              activeColor:
                                  const Color.fromARGB(255, 225, 194, 74),
                              value: radioOptions,
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value.toString();
                                });
                              },
                            ),
                            const Text(
                              "Seulement ma part",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Poppins-SemiBold',
                                  fontWeight: FontWeight.w500),
                            ),
                         const   SizedBox(
                              width: 80,
                            ),
                            Container(
                              color: const Color.fromARGB(255, 252, 242, 202),
                              child: const Row(children: [
                                Icon(
                                  Icons.check_circle,
                                  size: 12,
                                ),
                                Text(
                                  "20 Pts",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Poppins-SemiBold',
                                      fontWeight: FontWeight.w400),
                                ),
                              ]),
                            )
                          ],
                        ),
                    
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text(
                            "Lorem Ipsum dit data lorem Ipsum",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins-SemiBold',
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddPalyersScreen()));
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle,
                                color:    Color.fromARGB(255, 225, 194, 74),
                                  size: 10,
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  "Ajouter joueurs",
                                  style: TextStyle(
                                      color:  Color.fromARGB(255, 225, 194, 74),
                                      fontSize: 10,
                                      fontFamily: 'Poppins-SemiBold',
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                    ),
                
                const SizedBox(
                  height: 20,
                ),
                                Container(
                    color: Colors.white,
                    height: 100,
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              activeColor:
                                  const Color.fromARGB(255, 225, 194, 74),
                              value: radioOptions,
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value.toString();
                                });
                              },
                            ),
                            const Text(
                              "Seulement ma part",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Poppins-SemiBold',
                                  fontWeight: FontWeight.w500),
                            ),
                         const   SizedBox(
                              width: 80,
                            ),
                            Container(
                              color: const Color.fromARGB(255, 252, 242, 202),
                              child: const Row(children: [
                                Icon(
                                  Icons.check_circle,
                                  size: 12,
                                ),
                                Text(
                                  "80 Pts",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Poppins-SemiBold',
                                      fontWeight: FontWeight.w400),
                                ),
                              ]),
                            )
                          ],
                        ),
                    
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text(
                            "Lorem Ipsum dit data lorem Ipsum",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins-SemiBold',
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        const SizedBox(height: 5),

                      ],
                    )
                    ),
                
                const Padding(
                  padding: EdgeInsets.only(left: 20.0,top: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Politique d'annulation",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Poppins-SemiBold',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 350,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFAFAFA),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Icon(
                              Icons.warning,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            'Possible uniquement dans les 24 heures.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins-SemiBold',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed do eiusmod tempor \n incididunt ut labore.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF707070),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 80),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 5,
                    right: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Mes Points",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Poppins-SemiBold',
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF3C2),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.black,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '20 Points',
                              style: TextStyle(
                                color: Color(0xFF5F583D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD3B74A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Text(
                      'Payer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    this.value = "",
    this.groupValue = "",
    this.onchanged,
    this.titre = "",
    this.soutitre = "",
  });
  final String value;
  final String groupValue;
  final String titre;
  final String soutitre;
  final void Function(String?)? onchanged;
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      groupValue: groupValue,
      onChanged: onchanged,
      title: Text(titre),
      subtitle: Text(soutitre),
    );
  }
}

class MyContainer extends StatefulWidget {
  const MyContainer({super.key});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  String radioValueselected = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: 400,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 40,
            child: Container(
              height: 80,
              width: 45,
              decoration: const BoxDecoration(shape: BoxShape.rectangle),
              child: Image.asset(
                'assets/images/tennisSquash.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Positioned(
            left: 50,
            top: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Tennis Squash Maisons-Laffitte - 90 min",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins-SemiBold',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.calendar_month),
                      Text(
                        "Dimanche 21 janv.",
                        style: TextStyle(
                          color: Color(0xFF444443),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.av_timer_rounded),
                      Text(
                        "10:00 - 11h30 am",
                        style: TextStyle(
                          color: Color(0xFF444443),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.ac_unit_sharp),
                    Text(
                      "Padel I Indoor I Double",
                      style: TextStyle(
                        color: Color(0xFF444443),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
