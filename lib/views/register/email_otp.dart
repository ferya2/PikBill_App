import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pikbil_app/constants/colors/colors.dart';

class EmailVerifPage extends StatelessWidget {
  const EmailVerifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
              ))),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text('Check your email 📭',
                style: GoogleFonts.novaFlat(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColorDark,
                )),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'We Already sent you 4 digit OTP number to your email ',
                    style: GoogleFonts.novaFlat(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: 'adefery225@gmail.com',
                    style: GoogleFonts.novaFlat(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor
                          .primaryColorDark, // Ganti dengan warna yang diinginkan
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColor.primaryColorDark.withOpacity(0.3),
                    )),
                child: Center(
                    child: Text('7',
                        style: GoogleFonts.novaFlat(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColorDark,
                        ))),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColor.primaryColorDark.withOpacity(0.3),
                    )),
                child: Center(
                    child: Text('1',
                        style: GoogleFonts.novaFlat(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColorDark,
                        ))),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColor.primaryColorDark.withOpacity(0.3),
                    )),
                child: Center(
                    child: Text('9',
                        style: GoogleFonts.novaFlat(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColorDark,
                        ))),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColor.primaryColorDark.withOpacity(0.3),
                    )),
                child: Center(
                    child: Text('5',
                        style: GoogleFonts.novaFlat(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColorDark,
                        ))),
              )
            ]),
            const SizedBox(height: 30),
            Center(
                child: Text('00:52',
                    style: GoogleFonts.novaFlat(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.primaryColorDark,
                    ))),
            const SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 56),
                    backgroundColor: const Color.fromARGB(255, 30, 13, 92),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
                onPressed: () {},
                child: Text('Continue',
                    style: GoogleFonts.novaFlat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ))),
            const SizedBox(height: 30),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn’t receive OTP number? ',
                      style: GoogleFonts.novaFlat(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: 'Resend',
                      style: GoogleFonts.novaFlat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryColorDark,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Tindakan yang diambil saat teks diklik (misalnya, mengirim ulang OTP)
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
