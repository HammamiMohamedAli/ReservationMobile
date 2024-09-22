import 'package:flutter/material.dart';

class AddPalyersScreen extends StatefulWidget {
  const AddPalyersScreen({super.key});

  @override
  State<AddPalyersScreen> createState() => _AddPalyersScreenState();
}

class _AddPalyersScreenState extends State<AddPalyersScreen> {
  final _formKey = GlobalKey<FormState>();

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
              'Ajouter joueurs',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0, bottom: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Joueurs",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins-SemiBold',
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const Padding(
             padding:  EdgeInsets.only(top:10.0,left:30),
             child:   Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                   PlayerWidget(),
                   SizedBox(width:20 ,),
                   PlayerWidgetEmpty(),
              ],),
           ),
                       const Padding(
             padding:  EdgeInsets.only(top:10.0,left:30),
             child:   Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                   PlayerWidgetEmpty(),
                   SizedBox(width:20 ,),
                   PlayerWidgetEmpty(),
              ],),
           ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, bottom: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Suggestions",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins-SemiBold',
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Row(
                  children: [
                    SuggestionContainer(),
                    SuggestionContainer(),
                    SuggestionContainer(),
                  ]),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Lien du match",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins-SemiBold',
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                height: 40,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 233, 233, 233),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:8.0),
                      child: Text(
                        "www.YallaPlay.com/?Joueur",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins-Regular',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(width: 80),
                    Icon(Icons.copy),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 150),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:const  Color(0xFFD3B74A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    'Continuer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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

class PlayerWidgetEmpty extends StatefulWidget {
  const PlayerWidgetEmpty({super.key});

  @override
  State<PlayerWidgetEmpty> createState() => _PlayerWidgetEmptyState();
}

class _PlayerWidgetEmptyState extends State<PlayerWidgetEmpty> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
                  Padding(

                    padding: const EdgeInsets.only(top:15.0),
                    child: Center(
                              child: Container(
                                height: 80,
                                width: 150,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.only(left:80),
                                  child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Row(
                                children: [
                                   Image.asset('assets/images/star.png', width: 10),
                                 const  SizedBox(width: 5,),
                                 const  Text(
                                    "0,3",
                                    style: TextStyle(
                                      color: Color(0xFF444443),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                         const    SizedBox(height: 20,),
                           const  Text(
                    "_",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins-SemiBold',
                        fontWeight: FontWeight.w500),
                                    ),
                          ],
                        ),
                                )
                                     ,
                              ),
                            ),
                  ),
       Positioned(
            bottom: 50,
            child: Container(
              height: 45,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color:const  Color(0xFFAA9F76),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add_circle,
                  size: 22,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
     ],
    );
  }
}


class PlayerWidget extends StatefulWidget {
  const PlayerWidget({super.key});

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
                  Padding(

                    padding: const EdgeInsets.only(top:15.0),
                    child: Center(
                              child: Container(
                                height: 80,
                                width: 150,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.only(left:80),
                                  child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Row(
                                children: [
                                   Image.asset('assets/images/star.png', width: 10),
                                 const  SizedBox(width: 5,),
                                 const  Text(
                                    "0,3",
                                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Poppins-SemiBold',
                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                         const    SizedBox(height: 20,),
                           const  Text(
                    "Foulen Ben Foulen ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Poppins-SemiBold',
                        fontWeight: FontWeight.w400),
                                    ),
                          ],
                        ),
                                )
                                     ,
                              ),
                            ),
                  ),
       Positioned(
            bottom: 50,
            child:  SizedBox(
              height: 45,
              width: 45,
              child: Image.asset(
                      'assets/images/Groupe 46@2x.png',
                      fit: BoxFit.cover,
                      width: 60,
                      height: 40,
                    ),
            ),
          ),
     ],
    );
  }
}


class SuggestionContainer extends StatefulWidget {
  const SuggestionContainer({super.key});

  @override
  State<SuggestionContainer> createState() => _SuggestionContainerState();
}

class _SuggestionContainerState extends State<SuggestionContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Container(
        color: Colors.white,
        height: 99,
        width: 69,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    'assets/images/Groupe 46@2x.png',
                    fit: BoxFit.contain,
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Foulen  \n ben Foulen",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 7,
                    fontFamily: 'Poppins-Medium',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image.asset('assets/images/star.png', width: 10),
               const SizedBox(width: 5),
              const   Text(
                  "0,3",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 9,
                    fontFamily: 'Poppins-SemiBold',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
