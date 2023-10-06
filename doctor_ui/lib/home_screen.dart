import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    "assets/images/heart_rate.png",
    "assets/images/pil.png",
    "assets/images/pregnant.png",
    "assets/images/teeth.png"
  ];

  List<Map<String, dynamic>> doctorInfo = [
    {
      "doctorName": "Dr. Jenny Wilson",
      "specialist": "Dental Surgeon",
      "doctorProfile": "assets/images/doctor_one.png",
      "rating": 4.8,
      "color": const Color(0xFFFFF2E4)
    },
    {
      "color": const Color(0xFFD0F8EC),
      "doctorName": "Dr. Kristin Watson",
      "specialist": "General Dentist",
      "rating": "4.8",
      "doctorProfile": "assets/images/doctor_two.png"
    }
  ];

  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    //Meadia Query allows you to get the width and heigth of the user screen, you all can go check it out later

    // final width = MediaQuery.of(context).size.width;

    // print(width);

    return Scaffold(
      backgroundColor: const Color(0XFFf7f8fd),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 65, 16, 0),
            height: 325,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0XFF51A8FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(48.0),
                  bottomRight: Radius.circular(48.0)),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    "Hi, Steven",
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(102, 178, 255, 0.69),
                            borderRadius: BorderRadius.circular(14)),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 8,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Text("Let's find",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 32)),
              Text("your top doctor!",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 32)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 35, 0, 20),
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      labelText: "Search here...",
                    ),
                  ),
                ),
              )
            ]),
          ),
          const SizedBox(
            height: 30,
          ),
           Padding(
             padding: const EdgeInsets.only(left: 16, bottom: 16),
             child: Text("Categories", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 24),),
           ),
          Row(

            children: [
              SizedBox(
                height: 80,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left:24.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Material(
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? Colors.blue
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: Image.asset(categories[index]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: doctorInfo.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Material(
                    elevation: 5,
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Container(
                              color: doctorInfo[index]["color"],
                              child: Image.asset(
                                doctorInfo[index]["doctorProfile"],
                                height: 120,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doctorInfo[index]["doctorName"],
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                Text(doctorInfo[index]["specialist"]),
                                const SizedBox(
                                  height: 25,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Text(doctorInfo[index]["rating"]
                                          .toString())
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
