import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pikbil_app/constants/colors/colors.dart';
import 'package:pikbil_app/constants/routes/routes.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 30),
          Text(
            'Forgot Password? 🔒',
            style: GoogleFonts.novaFlat(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColor.primaryColorDark,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'please input your email to recover your Pikbil account',
            style: GoogleFonts.novaCut(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Email Addres',
            style: GoogleFonts.novaFlat(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryColorDark),
          ),
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
                hintText: 'Your email address',
                labelStyle: GoogleFonts.novaFlat(
                  fontSize: 16,
                )),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(RoutingPage.onGenerateRoute(
                  const RouteSettings(name: '/createpassword'),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 30, 13, 92),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: Size(MediaQuery.of(context).size.width, 56),
              ),
              child: Text(
                'Recover account',
                style: GoogleFonts.novaFlat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ))
        ]),
      ),
    );
  }
}
