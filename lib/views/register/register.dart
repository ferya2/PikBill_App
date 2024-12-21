import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pikbil_app/constants/colors/colors.dart';
import 'package:pikbil_app/constants/routes/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Nice to know You! 😉',
              style: GoogleFonts.novaFlat(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColorDark,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'It’s your first time to use Pikbil.',
              style: GoogleFonts.novaFlat(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Text('Full Name',
                style: GoogleFonts.novaFlat(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryColorDark,
                )),
            const SizedBox(height: 10),
            TextField(
              style: GoogleFonts.novaFlat(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryColorDark,
              ),
              decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: GoogleFonts.novaFlat(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  hintText: 'Your Full Name',
                  labelStyle: GoogleFonts.novaFlat(
                    fontSize: 16,
                  )),
            ),
            const SizedBox(height: 20),
            Text('Email Address',
                style: GoogleFonts.novaFlat(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryColorDark,
                )),
            const SizedBox(height: 10),
            TextField(
              style: GoogleFonts.novaFlat(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryColorDark,
              ),
              decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: GoogleFonts.novaFlat(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  hintText: 'Your Email Address',
                  labelStyle: GoogleFonts.novaFlat(
                    fontSize: 16,
                  )),
            ),
            const SizedBox(height: 20),
            Text('Password',
                style: GoogleFonts.novaFlat(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryColorDark,
                )),
            const SizedBox(height: 10),
            TextField(
              style: GoogleFonts.novaFlat(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryColorDark,
              ),
              obscureText: _isObscured,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintStyle: GoogleFonts.novaFlat(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                  icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey, // Set the color for the icon
                  ),
                ),
                hintText: 'Your Password',
                labelStyle: GoogleFonts.novaFlat(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 30, 13, 92),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fixedSize: Size(MediaQuery.of(context).size.width, 56)),
              onPressed: () {
                Navigator.of(context).push(RoutingPage.onGenerateRoute(
                  const RouteSettings(name: '/verifemail'),
                ));
              },
              child: Text(
                'Register',
                style: GoogleFonts.novaFlat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
                child: Text('or Register with',
                    style: GoogleFonts.novaFlat(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 30, 13, 92),
                    ))),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    print('google');
                  },
                  child: Container(
                    width: 46, // Sesuaikan dengan ukuran yang Anda inginkan
                    height: 46, // Sesuaikan dengan ukuran yang Anda inginkan
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black, // Warna garis outline
                        width: 0.5, // Lebar garis outline
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          AssetImage('assets/images/png/google.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    print('facebook');
                  },
                  child: Container(
                    width: 46, // Sesuaikan dengan ukuran yang Anda inginkan
                    height: 46, // Sesuaikan dengan ukuran yang Anda inginkan
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black, // Warna garis outline
                        width: 1.5, // Lebar garis outline
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        'assets/images/png/facebook.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Already have a Pikbil account?',
                  style: GoogleFonts.novaFlat(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  )),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(RoutingPage.onGenerateRoute(
                    const RouteSettings(name: '/login'),
                  ));
                },
                child: Text('Login',
                    style: GoogleFonts.novaFlat(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.primaryColorDark,
                    )),
              )
            ])
          ],
        ),
      ),
    );
  }
}
