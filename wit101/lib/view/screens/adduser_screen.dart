import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';
import 'package:awesome_stepper/awesome_stepper.dart';
import 'package:wit101/widgets/stepperscreen/stepperprofile_screen.dart';
import 'package:wit101/widgets/stepperscreen/stepperskill_screen.dart';

import '../../widgets/stepperscreen/steppereducation_screen.dart';
import '../../widgets/stepperscreen/stepperexperience_screen.dart';
import '../../widgets/stepperscreen/stepperproject_screen.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final pageController = PageController();
  int pagepage = 0;

  // REQUIRED: USED TO CONTROL THE STEPPER.
  int activeStep = 0; //
  bool unActive = true;

  // Variable Experience Screen
  var controllerAgency = TextEditingController();
  var controllerPhone = TextEditingController();
  var controllerAddress = TextEditingController();
  var controllerCompany = TextEditingController();
  var controllerStartYearExperience = TextEditingController();
  var controllerEndYearExperience = TextEditingController();
  var controllerPosition = TextEditingController();

  // Variable Skill Screen
  var controllerSchool = TextEditingController();
  var controllerMajor = TextEditingController();
  var controllerStartYear = TextEditingController();
  var controllerEndYear = TextEditingController();
  var controllerIPK = TextEditingController();
  var controllerAge = TextEditingController();

  // Variable Profile Screen
  var controllerFullName = TextEditingController();
  var controllerPositionProfile = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerGithub = TextEditingController();
  var controllerJob = TextEditingController();

  // Variable Skill Screen
  var controllerSkill = TextEditingController();
  var controllerNote = TextEditingController();

  // Variable Project Screen
  var controllerProject = TextEditingController();
  var controllerPlatform = TextEditingController();
  var controllerSkillProgram = TextEditingController();
  var controllerRole = TextEditingController();
  var controllerDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          banner('Add User'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: AwesomeStepper(
                      progressColor: MyColors.red(),
                      headerStyle:
                          const TextStyle(color: Colors.black, fontSize: 16),
                      progressBarAnimationDuration: const Duration(seconds: 2),
                      headerAnimationDuration: const Duration(seconds: 1),
                      progressStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      controlBuilder: (onNext, onBack) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (pagepage != 0)
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 16.63, left: 20),
                                child: SizedBox(
                                  width: 132,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: onBack,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side:
                                            BorderSide(color: MyColors.black()),
                                      ),
                                    ),
                                    child: PoppinsText.custom(
                                      text: 'Cancel',
                                      fontSize: 14,
                                      warna: MyColors.black(),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            else
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 16.63, left: 20),
                                child: SizedBox(
                                  width: 132,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: null,
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                              color: MyColors.black()),
                                        ),
                                        disabledBackgroundColor: Colors.white),
                                    child: PoppinsText.custom(
                                      text: 'Cancel',
                                      fontSize: 14,
                                      warna: MyColors.black(),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            if (pagepage != 5)
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 16.63, right: 20),
                                child: SizedBox(
                                  width: 132,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: onNext,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: MyColors.red(),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: PoppinsText.custom(
                                      text: 'Next',
                                      fontSize: 14,
                                      warna: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            else
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 16.63, right: 20),
                                child: SizedBox(
                                  width: 132,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: MyColors.red(),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      disabledBackgroundColor: MyColors.red(),
                                    ),
                                    child: PoppinsText.custom(
                                      text: 'Next',
                                      fontSize: 14,
                                      warna: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                      onStepChanged: (page) {
                        setState(() {
                          pagepage = page;
                        });
                      },
                      steps: [
                        AwesomeStepperItem(
                          label: 'Add Photo',
                          content: addPhoto(),
                        ),
                        AwesomeStepperItem(
                          label: 'Profile',
                          content: StepperProfile(
                            controllerFullName: controllerFullName,
                            controllerAge: controllerAge,
                            controllerEmail: controllerEmail,
                            controllerGithub: controllerGithub,
                            controllerJob: controllerJob,
                            controllerPosition: controllerPositionProfile,
                          ),
                        ),
                        AwesomeStepperItem(
                          label: 'Education',
                          content: StepperEducation(
                            controllerEndYear: controllerEndYear,
                            controllerIPK: controllerIPK,
                            controllerMajor: controllerMajor,
                            controllerSchool: controllerSchool,
                            controllerStartYear: controllerStartYear,
                          ),
                        ),
                        AwesomeStepperItem(
                          label: 'Skill',
                          content: StepperSkill(
                            controllerNote: controllerNote,
                            controllerSkill: controllerSkill,
                          ),
                        ),
                        AwesomeStepperItem(
                          label: 'Project',
                          content: StepperProject(
                            controllerDescription: controllerDescription,
                            controllerPlatform: controllerPlatform,
                            controllerProject: controllerProject,
                            controllerRole: controllerRole,
                            controllerSkillProgram: controllerSkillProgram,
                          ),
                        ),
                        AwesomeStepperItem(
                          label: 'Professional Experience',
                          content: StepperExperience(
                            controllerAddress: controllerAddress,
                            controllerPosition: controllerPosition,
                            controllerAgency: controllerAgency,
                            controllerCompany: controllerCompany,
                            controllerEndYearExperience:
                                controllerEndYearExperience,
                            controllerPhone: controllerPhone,
                            controllerStartYearExperience:
                                controllerStartYearExperience,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget banner(String nameBar) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
        color: Color.fromRGBO(232, 23, 31, 1),
      ),
      width: MediaQuery.of(context).size.width,
      height: 154,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsText.custom(
                    text: 'Add',
                    fontSize: 16,
                    warna: Colors.white,
                    fontWeight: FontWeight.w600),
                PoppinsText.custom(
                    text: nameBar,
                    fontSize: 16,
                    warna: Colors.white,
                    fontWeight: FontWeight.w600),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Image.asset('assets/png/circle_5.png'),
          ),
        ],
      ),
    );
  }

  Widget addPhoto() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 115),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 100,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: PoppinsText.custom(
              text: 'Add Photo',
              fontSize: 12,
              warna: MyColors.red(),
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
