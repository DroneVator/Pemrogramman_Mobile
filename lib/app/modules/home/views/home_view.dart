import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mylab/app/modules/home/util/medical_tile.dart';
import 'package:mylab/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  // Creating static data in list
  List catNames = [
    "Emergency",
    'Hospital',
    'Appointment',
    'Drugs',
  ];

  List<Color> catColors = [
    Color(0xff0D98BA),
    Color(0xff0D98BA),
    Color(0xff0D98BA),
    Color(0xff0D98BA),
  ];

  List<Icon> catIcons = [
    Icon(Icons.emergency, color: Color.fromARGB(255, 0, 102, 203), size: 30),
    Icon(Icons.local_hospital,
        color: Color.fromARGB(255, 0, 102, 203), size: 30),
    Icon(Icons.calendar_month,
        color: Color.fromARGB(255, 0, 102, 203), size: 30),
    Icon(Icons.medical_services_outlined,
        color: Color.fromARGB(255, 0, 102, 203), size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  // greetings row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Hai, Daffa Akmal
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Daffa Akmal',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '18 Oct, 2023',
                            style: TextStyle(color: Colors.blue[200]),
                          )
                        ],
                      ),

                      // Notification
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  // search bar
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Cari',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  // konten
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kategori',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 15),
                    child: Column(
                      children: [
                        GridView.builder(
                          itemCount: catNames.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1.1,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: catColors[index],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: catIcons[index],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  catNames[index],
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                color: Colors.grey[200],
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Medical info',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Listview of Medical Info
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: ListView(
                          children: [
                            MedicalTile(),
                            MedicalTile(),
                            MedicalTile(),
                            MedicalTile(),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      
                      Container(
                        child: Text(
                          "Take a Photo for Consulation",
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold
                            ),
                        ),
                      ),

                    SizedBox(
                      height: 10,
                    ),
                      Container(
                        width: 400,
                        height: 80,
                        color: Colors.grey,
                        child: IconButton(
                          icon: Icon(Icons.add_photo_alternate_outlined),
                          color: Colors.black,
                          onPressed: () {
                            Get.offAllNamed(Routes.PROFILE);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: Container(
        color: Color(0xff4264D0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
          child: GNav(
            backgroundColor: Color(0xff4264D0),
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            // selectedIndex: _index,
            // onTabChange: (int index) {
            //   setState(() {
            //     _index = index;
            //   });
            // },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.chat,
                text: 'Chat',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
