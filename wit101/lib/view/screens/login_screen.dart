import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wit101/model/Model%20Api/auth_model.dart';
import 'package:wit101/view/screens/dashboard.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';
import 'package:wit101/view/screens/forget_pass_screen.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  bool passHide = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
        overlays: [SystemUiOverlay.bottom]);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(seconds: 1),
        () => cekLogin(),
      );
    });
  }

  void cekLogin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // print('User is currently signed out!');
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Dashboard()));
        // print('User is signed in!');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [logo(), txt(), form()],
      ),
    ));
  }

  Form form() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
              width: 280,
              child: TextFormField(
                controller: controllerEmail,
                keyboardType: TextInputType.emailAddress,
                style:
                    GoogleFonts.poppins(fontSize: 14, color: MyColors.black()),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 11, left: 11),
                  hintText: 'Email',
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
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    
                    return "Email can not be empty";
                  } else if (!EmailValidator.validate(val, true)) {
                    return "Invalid Email Address";
                  } else {
                    BorderRadius.circular(5);
                    return null;
                  }
                },
                onChanged: (val) {
                  formKey.currentState!.validate();
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 6)),
            SizedBox(
              width: 280,
              child: TextFormField(
                controller: controllerPassword,
                keyboardType: TextInputType.text,
                obscureText: passHide,
                style:
                    GoogleFonts.poppins(fontSize: 14, color: MyColors.black()),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 11, left: 11),
                    hintText: 'Password',
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                          passHide
                              ? Icons.visibility_off
                              : Icons.visibility_rounded,
                          color: MyColors.darkGrey(),
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            passHide = !passHide;
                          });
                        })),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'can not be empty';
                  }
                  BorderRadius.circular(5);
                  return null;
                },
                onChanged: (val) {
                  formKey.currentState!.validate();
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 36, bottom: 38),
              child: SizedBox(
                  width: 280,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(MyColors.red()),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        if (mounted) {
                          Auth()
                              .signIn(
                                  email: controllerEmail.text,
                                  password: controllerPassword.text)
                              .then((result) {
                            if (result == null) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Dashboard()));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  result,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ));
                            }
                          });
                        }
                      }
                    },
                    child: PoppinsText.custom(
                        text: 'Login',
                        fontSize: 14,
                        warna: Colors.white,
                        fontWeight: FontWeight.normal),
                  )),
            ),
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
                    text: "Forget Password?",
                    fontSize: 12,
                    warna: MyColors.red(),
                    fontWeight: FontWeight.normal))
          ],
        ));
  }

  Container txt() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 60, right: 166, top: 79, bottom: 28),
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: PoppinsText.custom(
                  text: 'Welcome.',
                  fontSize: 16,
                  warna: MyColors.black(),
                  fontWeight: FontWeight.bold)),
          Container(
              alignment: Alignment.centerLeft,
              child: PoppinsText.custom(
                  text: 'Login now to continue',
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
            image: AssetImage('assets/png/logo.png'),
          )),
    );
  }

 
  
}
