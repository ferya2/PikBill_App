import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pikbil_app/constants/colors/colors.dart';
import 'package:pikbil_app/constants/routes/routes.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _retypepasswordController = TextEditingController();

  bool _isObscured = true;
  double _passwordProgress = 0.0;
  double _retypePasswordProgress = 0.0;
  bool isLengthValid = false;
  bool hasNumber = false;
  bool hasCapitalLetter = false;
  bool _isTextFieldClicked = false;
  bool isMatch = false;
  int fulfilledRules = 0;
  int fulfilledRulesPassword1 = 0;
  int fulfilledRulesPassword2 = 0;
  int totalRules = 4;

  double getAverageProgress() {
    return (fulfilledRulesPassword1 + fulfilledRulesPassword2) / totalRules;
  }

  void updateProgressPassword(String password) {
    fulfilledRulesPassword1 = 0;

    // Aturan validasi pertama: password harus memiliki setidaknya 8 karakter
    if (password.length >= 8) {
      fulfilledRulesPassword1++;
    }

    // Aturan validasi kedua: password harus mengandung setidaknya satu angka
    if (RegExp(r'\d').hasMatch(password)) {
      fulfilledRulesPassword1++;
    }

    // Aturan validasi ketiga: password harus mengandung setidaknya satu huruf kapital
    if (RegExp(r'[A-Z]').hasMatch(password)) {
      fulfilledRulesPassword1++;
    }

    // Hitung persentase kemajuan
    double newProgress = getAverageProgress();

    // Perbarui nilai _passwordProgress dan perbarui tampilan
    setState(() {
      isLengthValid = password.length >= 8;
      hasNumber = RegExp(r'\d').hasMatch(password);
      hasCapitalLetter = RegExp(r'[A-Z]').hasMatch(password);
      _passwordProgress = newProgress;
    });
  }

  void updateProgressretypePassword(String retypepassword) {
    fulfilledRulesPassword2 = 0;

    // Jika password yang diketik ulang cocok dengan password pertama
    isMatch = (retypepassword == _passwordController.text);

    // Aturan validasi keempat: password yang diketik ulang harus cocok dengan password pertama
    if (isMatch) {
      fulfilledRulesPassword2++;
    }

    // Set persentase kemajuan berdasarkan kesesuaian
    double newProgress = getAverageProgress();

    // Perbarui nilai _retypePasswordProgress dan perbarui tampilan hanya jika semua kriteria terpenuhi
    if (isMatch) {
      setState(() {
        _retypePasswordProgress = newProgress;
      });
    }
  }

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
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20),
          Text(
            'Create new password 🔑',
            style: GoogleFonts.novaFlat(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColorDark,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Please create new password of your Pikbil account to access again your account',
            style: GoogleFonts.novaCut(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          Text('Password',
              style: GoogleFonts.novaFlat(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryColorDark,
              )),
          const SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              updateProgressPassword(value);
            },
            controller: _passwordController,
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
              hintText: 'Your password',
              labelStyle: GoogleFonts.novaFlat(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text('Retype password',
              style: GoogleFonts.novaFlat(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryColorDark,
              )),
          const SizedBox(height: 10),
          TextField(
            onTap: () {
              _isTextFieldClicked = true;
            },
            onChanged: (value) {
              updateProgressretypePassword(value);
            },
            controller: _retypepasswordController,
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
              hintText: 'Retype your password',
              labelStyle: GoogleFonts.novaFlat(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 24),
          // percent indicator
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(15),
            value: getAverageProgress(),
            minHeight: 8,
            backgroundColor: Colors.grey,
            color: AppColor.primaryColorDark,
            valueColor:
                const AlwaysStoppedAnimation<Color>(AppColor.primaryColorDark),
          ),

          const SizedBox(height: 20),
          //validator here
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                isLengthValid ? Icons.check_circle_outline_sharp : Icons.close,
                size: 22,
                color: isLengthValid ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 6),
              Text(
                'Password must be at least 8 characters',
                style: GoogleFonts.novaFlat(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: isLengthValid ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                hasNumber ? Icons.check_circle_outline_sharp : Icons.close,
                size: 22,
                color: hasNumber ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 6),
              Text(
                'Password must have a number',
                style: GoogleFonts.novaFlat(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: hasNumber ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                hasCapitalLetter
                    ? Icons.check_circle_outline_sharp
                    : Icons.close_rounded,
                size: 22,
                color: hasCapitalLetter ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 6),
              Text(
                'Password must have a capital letter',
                style: GoogleFonts.novaFlat(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: hasCapitalLetter ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Icon(
                  isMatch
                      ? Icons.check_circle_outline_sharp
                      : Icons.close_rounded,
                  size: 22,
                  color: isMatch ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 6),
                Text(
                  'Password must same',
                  style: GoogleFonts.novaFlat(
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                    color: isMatch ? Colors.green : Colors.red,
                  ),
                ),
              ]),
            ],
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
              'Confirm password',
              style: GoogleFonts.novaFlat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
