import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pikbil_app/constants/routes/routes.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late CarouselController _carouselController;
  int _currentIndex = 0;

  List<Map<String, String>> carouselItems = [
    {
      'image': 'assets/images/png/jeep1.jpg',
    },
    {
      'image': 'assets/images/png/jeep2.jpg',
    },
    {
      'image': 'assets/images/png/jeep3.jpg',
    },
  ];

  List<Map<String, String>> carouselText = [
    {
      'tittle': 'Endles Option',
      'subtitle':
          'Choose of hundred of models you wont find anywhere else. Pick it up or get it delivered where you want it'
    },
    {
      'tittle': 'Drive Confidently',
      'subtitle':
          'Drive confidently with your choice of protection plans. All plans includer varying level of insurance from Fakeh Insurance'
    },
    {
      'tittle': '24/7 Support',
      'subtitle':
          'Rest easy knowing that everyone in Pikbil comunity is screened and support roadside assistance'
    },
  ];

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            CarouselSlider(
              carouselController: _carouselController,
              items: carouselItems.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 1,
                aspectRatio: 1.3,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                // Tambahkan scrollPhysics untuk efek transisi
                scrollPhysics: const PageScrollPhysics(),

                pageSnapping: true,
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                key: Key(carouselText[_currentIndex]['tittle']!),
                children: [
                  const SizedBox(height: 30),
                  const SizedBox(height: 50),
                  Text(
                    carouselText[_currentIndex]['tittle']!,
                    style: GoogleFonts.novaFlat(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    carouselText[_currentIndex]['subtitle']!,
                    style: GoogleFonts.novaCut(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...carouselItems.map((item) {
              int index = carouselItems.indexOf(item);
              return Container(
                  width: 30.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: _currentIndex == index
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: _currentIndex == index
                              ? const Color.fromARGB(255, 43, 6, 177)
                              : Colors.grey,
                        )
                      : BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? const Color.fromARGB(255, 43, 6, 177)
                              : Colors.grey,
                        ));
            }).toList(),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Tindakan saat TextButton ditekan
                      Navigator.of(context).push(RoutingPage.onGenerateRoute(
                        const RouteSettings(name: '/login'),
                      ));
                    },
                    child: Text(
                      'Skip',
                      style: GoogleFonts.familjenGrotesk(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: const Color.fromARGB(255, 43, 6, 177)
                              .withOpacity(0.5)),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: const Color.fromARGB(255, 43, 6, 177),
                    ),
                    onPressed: () {
                      if (_currentIndex < carouselItems.length - 1) {
                        _carouselController.nextPage();
                      } else {
                        Navigator.of(context).push(RoutingPage.onGenerateRoute(
                            const RouteSettings(name: '/login')));
                      }
                    },
                    child: Text(
                      'Next',
                      style: GoogleFonts.novaFlat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
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
