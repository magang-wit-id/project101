import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wit101/model/view_model/price_model.dart';
import 'package:wit101/utility/warna.dart';

import '../../utility/poppins_text.dart';

class EditPriceScreen extends StatefulWidget {
  final DocumentSnapshot post;
  const EditPriceScreen({super.key, required this.post});

  @override
  State<EditPriceScreen> createState() => _EditPriceScreenState();
}

class _EditPriceScreenState extends State<EditPriceScreen> {
  final _formKey = GlobalKey<FormState>();
  var controllerMinPrice = TextEditingController();
  var controllerMaxPrice = TextEditingController();
  var controllerPercentage = TextEditingController();

  @override
  void initState() {
    super.initState();

    controllerMinPrice.text = widget.post.get("harga_min");
    controllerMaxPrice.text = widget.post.get("harga_max");
    controllerPercentage.text = widget.post.get("persentase");
  }

  @override
  Widget build(BuildContext context) {
    var id = widget.post.get('id');
    var hargaMin = controllerMinPrice.text;
    var hargaMax = controllerMaxPrice.text;
    var persentase = controllerPercentage.text;
    
    return Scaffold(
      backgroundColor: MyColors.black(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/svg/profile_back_icon.svg'),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: 0,
              child: Image.asset('assets/png/circle_1.png'),
            ),
            Positioned(
              top: 100,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  PoppinsText.custom(
                      text: 'Price',
                      fontSize: 18,
                      warna: Colors.white,
                      fontWeight: FontWeight.w700),
                  PoppinsText.custom(
                      text:
                          'Rp. ${(controllerMinPrice.text)} - Rp. ${(controllerMaxPrice.text)}',
                      fontSize: 18,
                      warna: Colors.white,
                      fontWeight: FontWeight.w700),
                ],
              ),
            ),
            Positioned(
              top: 190,
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 190,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 42,
                      left: 40,
                      bottom: 42,
                      right: 40,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          profileDisabledTextField(widget.post.get('id')),
                          const SizedBox(height: 14),
                          profileTextField(
                              controller: controllerMinPrice,
                              textInputType: TextInputType.number,
                              maxLines: 1,
                              minLines: 1,
                              hintText: 'Min Price'),
                          const SizedBox(height: 14),
                          profileTextField(
                              controller: controllerMaxPrice,
                              textInputType: TextInputType.number,
                              maxLines: 1,
                              minLines: 1,
                              hintText: 'Max Price'),
                          const SizedBox(height: 14),
                          profileTextField(
                              controller: controllerPercentage,
                              textInputType: TextInputType.number,
                              maxLines: 1,
                              minLines: 1,
                              hintText: 'Percentage'),
                          const Spacer(),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                Price().updatePrice(id: id, hargaMin: hargaMin, persentase: persentase, hargaMax: hargaMax).whenComplete(() =>  Navigator.pop(context));
                              },
                              child: PoppinsText.custom(
                                  text: 'Save Price',
                                  fontSize: 12,
                                  warna: Colors.white,
                                  fontWeight: FontWeight.w600),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: MyColors.red(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: PoppinsText.custom(
                                  text: 'Cancel',
                                  fontSize: 12,
                                  warna: MyColors.black(),
                                  fontWeight: FontWeight.w600),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                side: BorderSide(color: MyColors.black()),
                              ),
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
      ),
    );
  }
}

Widget profileTextField({
  required TextEditingController controller,
  required TextInputType textInputType,
  required int maxLines,
  required int minLines,
  required String hintText,
}) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return '*required field';
      }
      return null;
    },
    controller: controller,
    keyboardType: textInputType,
    maxLines: maxLines,
    minLines: minLines,
    style: GoogleFonts.poppins(
      fontSize: 12,
      color: MyColors.black(),
      fontWeight: FontWeight.w500,
    ),
    decoration: InputDecoration(
      hintStyle: GoogleFonts.poppins(
        fontSize: 12,
        color: MyColors.lightGrey(),
        fontWeight: FontWeight.w500,
      ),
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.lightGrey(),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.black(),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

Widget profileDisabledTextField(String textInput) {
  var myController = TextEditingController();
  myController.text = textInput;

  return TextField(
    minLines: 1,
    maxLines: 3,
    controller: myController,
    style: GoogleFonts.poppins(
      color: MyColors.lightGrey(),
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    decoration: InputDecoration(
      enabled: false,
      filled: true,
      fillColor: MyColors.disabledGrey(),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.lightGrey(),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
    ),
  );
}
