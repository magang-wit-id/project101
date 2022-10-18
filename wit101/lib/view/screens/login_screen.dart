import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';
import 'package:wit101/view/screens/forget_pass_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passHide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          logo(),
          txtwelcome(),
          forminput(context),
        ],
      )),
    );
  }

  Form forminput(BuildContext context) {
    return Form(
          child: Column(
            children: [
              SizedBox(
                  width: 280,
                  child: TextFormField(
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: MyColors.black()),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 11, left: 11),
                      hintText: "Email",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
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
              SizedBox(
                  width: 280,
                  child: TextFormField(
                    obscureText: passHide,
                    style: GoogleFonts.poppins(fontSize: 14),
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 11, left: 11),
                        hintText: "Password",
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: MyColors.black(),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: MyColors.black(),
                          ),
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(
                              passHide
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                passHide = !passHide;
                              });
                            })),
                  )),
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
                            text: 'Login',
                            fontSize: 14,
                            warna: Colors.white,
                            fontWeight: FontWeight.normal)),
                  )),
              TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(MyColors.red()),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgetPassScreen()));
                  },
                  child: PoppinsText.custom(
                      text: 'Forget Password?',
                      fontSize: 12,
                      warna: MyColors.red(),
                      fontWeight: FontWeight.normal))
            ],
          ),
        );
  }

  Container txtwelcome() {
    return Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(
              left: 60, right: 166, top: 79, bottom: 28),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: PoppinsText.custom(
                      text: 'Welcome,',
                      fontSize: 16,
                      warna: MyColors.black(),
                      fontWeight: FontWeight.bold)),
              Container(
                  alignment: Alignment.centerLeft,
                  child: PoppinsText.custom(
                      text: 'Login now to continue,',
                      fontSize: 14,
                      warna: MyColors.black(),
                      fontWeight: FontWeight.normal)),
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
              boxShadow: [
                BoxShadow(
                  color: MyColors.black(),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/png/logo.png"),
              )),
        );
  }
}
