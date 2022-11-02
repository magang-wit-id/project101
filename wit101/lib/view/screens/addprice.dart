import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wit101/model/model%20Class/price_model.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wit101/view/screens/dashboard.dart';

class AddPrice extends StatefulWidget {
  const AddPrice({Key? key}) : super(key: key);

  @override
  State<AddPrice> createState() => _AddPriceState();
}

class _AddPriceState extends State<AddPrice> {
  var controllerMinPrices = TextEditingController();

  var controllerMaxPrices = TextEditingController();

  var controllerPercentage = TextEditingController();

  

  String id = const Uuid().v4();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          banner(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              margin: const EdgeInsets.only(top: 14),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: TextFormField(
                                controller: controllerMinPrices,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  hintText: 'Min Prices',
                                ),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              margin: const EdgeInsets.only(top: 14),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: TextFormField(
                                controller: controllerMaxPrices,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  hintText: 'Max Prices',
                                ),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              margin: const EdgeInsets.only(top: 14),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: TextFormField(
                                controller: controllerPercentage,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  hintText: 'Percentage',
                                ),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 296,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                   Price()
                                      .addPricer(
                                          id: id,
                                          hargaMin: controllerMinPrices.text,
                                          persentase: controllerPercentage.text,
                                          hargaMax: controllerMaxPrices.text).then((value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Dashboard())));
                                },
                                child: PoppinsText.custom(
                                    text: 'Add Price',
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
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                 
                                     
                                },
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
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget banner() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
        color: Color.fromRGBO(232, 23, 31, 1),
      ),
      width: MediaQuery.of(context).size.width,
      height: 154,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 74, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsText.custom(
                    text: 'Add',
                    fontSize: 16,
                    warna: Colors.white,
                    fontWeight: FontWeight.w700),
                PoppinsText.custom(
                    text: 'New Price',
                    fontSize: 14,
                    warna: Colors.white,
                    fontWeight: FontWeight.w600),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/png/circle_5.png',
              alignment: Alignment.topRight,
            ),
          ),
        ],
      ),
    );
  }
}
