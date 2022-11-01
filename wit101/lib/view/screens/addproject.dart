import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wit101/model/Model%20Api/api_model.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';
import 'package:wit101/view/screens/projectlist.dart';
import 'package:wit101/widgets/drawer_screen.dart';
import 'package:provider/provider.dart';
class Addproject extends StatefulWidget {
  const Addproject({Key? key}) : super(key: key);

  @override
  State<Addproject> createState() => _AddprojectState();
}

class _AddprojectState extends State<Addproject> {
  var projectnameController = TextEditingController();

  var dealPriceController = TextEditingController();

  var durationController = TextEditingController();

  var workerController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    provider myprovider = Provider.of<provider>(context);

    return Scaffold( 
      extendBodyBehindAppBar: true,
     
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          banner(context),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 10,right: 10),
              child: Container(
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
                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     Padding(
                         padding: const EdgeInsets.only( left: 55, right: 55), 
                         child: SizedBox(
                         height: 200, 
                         width: 150,
                        child : SvgPicture.asset('assets/svg/icongay.svg', fit: BoxFit.contain,)),),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [ 
                       SizedBox(
                      width: 320,
                      height: 50,
                      child: TextFormField(
                        autofocus: true,
                        controller: projectnameController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.black()
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.black()
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Project Name',
                        ),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ),
                             Container(
                        margin: const EdgeInsets.only(top: 14),
                        width: 320,
                        height: 50,
                        child: TextFormField(
                          controller: dealPriceController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.black()
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Deal Price',
                          ),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 14),
                        width: 320,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: durationController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.black()
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),

                             hintText: 'Duration (Month)',
                          
                          ),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 14),
                        width: 320,
                        height: 50,
                        child: TextFormField(
                           keyboardType: TextInputType.number,
                          controller: workerController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.black()
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                           hintText: 'Worker (s)',
                          ),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 25)),
                      SizedBox(
                    
                        width: 320,
                        height: 50,
                        child: buttonSave(),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      SizedBox(
              
                        width: 320,
                        height: 50,
                        child: buttonCancel(),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 20))
                        ],
                      ),
                    ),
                  )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget banner(BuildContext context) {
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
          Padding( padding: const EdgeInsets.only(top: 84, left: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsText.custom(
                    text: 'Create',
                    fontSize: 16,
                    warna: Colors.white,
                    fontWeight: FontWeight.w600),
                PoppinsText.custom(
                    text: 'New Project',
                    fontSize: 16,
                    warna: Colors.white,
                    fontWeight: FontWeight.w600),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('assets/png/circle_5.png' , alignment: Alignment.topRight,)),
        ],
      ),
    );
  }

  

  



  

  Widget buttonSave() {
      provider myprovider = Provider.of<provider>(context);
    return ElevatedButton(
      onPressed: (){
                          myprovider.tambahproject(
                            projectname: projectnameController.text,
                            dealprice:int.parse(dealPriceController.text),
                            duration: durationController.text,
                            worker: int.parse(workerController.text),
                           );
                          Navigator.of(context).push(
                              PageRouteBuilder(
                             pageBuilder: ((context, animation, secondaryAnimation){
                               return Projectlist();
                               }),
                            transitionsBuilder: (context, animation, secondaryAnimation, child){
                              final tween = Tween(begin: 0.0 , end: 1.0);
                              return ScaleTransition(
                                scale: animation.drive(tween),
                                child: child
                                ,);
                            }
                          ));
                      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(232, 23, 31, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        'Add Project',
        style: GoogleFonts.poppins(
            fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }

  Widget buttonCancel() {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.black),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        'Cancel',
        style: GoogleFonts.poppins(
            fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }
}
