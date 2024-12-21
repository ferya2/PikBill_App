import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pikbil_app/constants/colors/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isFABOpen = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleFAB() {
    setState(() {
      _isFABOpen = !_isFABOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_outlined,
              ))
        ],
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text('Your Location',
                  style: GoogleFonts.novaFlat(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.primaryColorDark,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.location_on_outlined,
                    size: 16,
                  )),
            ],
          ),
          Text('Jakarta, ID',
              style: GoogleFonts.novaFlat(
                  fontSize: 16, fontWeight: FontWeight.w500)),
        ]),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              const SizedBox(height: 16),
              Text(
                'New year 2024 25% off promo',
                style: GoogleFonts.novaFlat(
                    fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(height: 12),
              Row(children: [
                Container(
                    height: 15,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColorDark,
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ]),
              const SizedBox(height: 16),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top vehicle',
                      style: GoogleFonts.novaFlat(
                          fontWeight: FontWeight.w600, fontSize: 26),
                    ),
                    Text(
                      'See all',
                      style: GoogleFonts.novaFlat(
                          fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ])
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: _isFABOpen,
            child: FloatingActionButton(
              onPressed: () {
                // Action when sub FAB 1 is pressed
              },
              child: const Icon(Icons.add),
              tooltip: 'Sub FAB 1',
            ),
          ),
          const SizedBox(height: 16),
          Visibility(
            visible: _isFABOpen,
            child: FloatingActionButton(
              onPressed: () {
                // Action when sub FAB 2 is pressed
              },
              child: const Icon(Icons.remove),
              tooltip: 'Sub FAB 2',
            ),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _toggleFAB,
            child: Icon(_isFABOpen ? Icons.close : Icons.menu),
            tooltip: _isFABOpen ? 'Close menu' : 'Open menu',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey, // Set background color to grey
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
