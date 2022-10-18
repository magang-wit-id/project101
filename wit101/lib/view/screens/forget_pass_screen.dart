import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';
import 'login_screen.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          logo(),
          txtforget(),
          formforget(context),
        ],
      )),
    );
  }

  Form formforget(BuildContext context) {
    return Form(
          child: Column(
            children: [
              SizedBox(
                  width: 280,
                  child: TextFormField(
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: MyColors.black()),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 11, left: 11),
                      hintText: "Email",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:  BorderSide(
                          color: MyColors.black(),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: MyColors.black(),
                        ),
                      ),
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 6),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 36, bottom: 38),
                  child: SizedBox(
                    width: 280,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyColors.red()),
                      ),
                      onPressed: () {},
                      child: PoppinsText.custom(
                          text: 'Send To Email',
                          fontSize: 14,
                          warna: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  )),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PoppinsText.custom(
                        text: 'Already have an account?',
                        fontSize: 12,
                        warna: MyColors.black(),
                        fontWeight: FontWeight.normal),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            MyColors.red()),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: PoppinsText.custom(
                          text: 'Login here',
                          fontSize: 12,
                          warna: MyColors.red(),
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
  }

  Container txtforget() {
    return Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(
              left: 60, right: 166, top: 79, bottom: 28),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: PoppinsText.custom(
                      text: 'Forgot\nYour Password?',
                      fontSize: 16,
                      warna: MyColors.black(),
                      fontWeight: FontWeight.bold)),
            ],
          ),
        );
  }

  Container logo() {
    return Container(
          width: 120,
          height: 120,
          margin: const EdgeInsets.only(top: 149, left: 120, right: 120),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow:  [
                BoxShadow(
                  color: MyColors.black(),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/png/logo.png"))),
        );
  }
}
