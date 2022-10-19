import 'package:flutter/material.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';
import 'package:wit101/widgets/MyDrawer.dart';

class projectlist extends StatefulWidget {
  const projectlist({Key? key}) : super(key: key);

  @override
  State<projectlist> createState() => _projectlistState();
}
 
class _projectlistState extends State<projectlist> {
  TextEditingController SearchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          banner(),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: SingleChildScrollView(child: CardListProject())
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
      height: 157,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 89,
            left: 20,
            child: PoppinsText.custom(
                text: 'Project List',
                fontSize: 16,
                warna: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          Positioned(
            left: 300,
            child: Image.asset('assets/png/circle_5.png', alignment: Alignment.topRight,),
          ),
          Positioned(
            top: 130,
            left: 10,
            child: Container(
              height: 50,
              width:MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: searchView()),
            ),
          )
        ],
      ),
    );
  }

  Widget searchView() {
    return TextField( 
      controller: SearchController,
      decoration: InputDecoration(
        
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        suffixIcon: Icon(Icons.search),
        hintText: 'Search',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 2.5,
            color: MyColors.lightGrey(),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
         
            color: MyColors.lightGrey(),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

 
}

class CardListProject extends StatelessWidget {
  const CardListProject({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 151, 
              height: 120,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                elevation: 10,
                color: Colors.white,
              child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 8, )),
                    Padding(padding: EdgeInsets.only(left: 15, top: 2),
                    child:  PoppinsText.custom(text: 'Fradricast fuck yeh yeh' ,
                     fontSize: 14, warna: MyColors.black(),
                      fontWeight: FontWeight.w600),), 
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight ,
                        child: Padding(padding: EdgeInsets.only(right: 15),
                          child: Container( 
                                    alignment: Alignment.bottomRight,
                                    width: 65,
                                    height: 30,
                                 child: Container(
                                  height: 25, 
                                  width: 80,
                                   child: Card( 
                                    color: MyColors.lightBlue2(),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                    child: Center(child: PoppinsText.custom(text: 'Ongoing', fontSize: 8, warna: MyColors.lightBlue(), fontWeight: FontWeight.w600),),
                                 ),)
                                  ),
                        ),
                      ),
                    )
              
                  ],
                ),
                
              ),
            ),
            Container(
             width: 151, 
              height: 120,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                elevation: 10,
                 color: Colors.white,
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 8, left: 10)),
                    Padding(padding: EdgeInsets.only(left: 15, top: 2),
                    child:  PoppinsText.custom(text: 'Fradricast fuck yeh yeh' ,
                     fontSize: 14, warna: MyColors.black(),
                      fontWeight: FontWeight.w600),), 
                    Padding(padding: EdgeInsets.only(top:  30)),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight ,
                        child: Padding(padding: EdgeInsets.only(right: 15),
                            child: Container( 
                                      alignment: Alignment.bottomRight,
                                      width: 65,
                                      height: 30,
                                   child: Container(
                                    height: 25, 
                                    width: 80,
                                     child: Card( 
                                      color: MyColors.green2(),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                      child: Center(child: PoppinsText.custom(text: 'finished', fontSize: 8, warna: MyColors.green(), fontWeight: FontWeight.w600),),
                                   ),)
                                    ),
                          ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           Container(
               width: 151, 
              height: 120,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                elevation: 10,
                color: Colors.white,
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 8, left: 10)),
                    Padding(padding: EdgeInsets.only(left: 15, top: 2),
                    child:  PoppinsText.custom(text: 'Fradricast fuck yeh yeh' ,
                     fontSize: 14, warna: MyColors.black(),
                      fontWeight: FontWeight.w600),),  
                    Padding(padding: EdgeInsets.only(top:  30)),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight ,
                        child:  Padding(padding: EdgeInsets.only(right: 15),
                            child: Container( 
                                      alignment: Alignment.bottomRight,
                                      width: 65,
                                      height: 30,
                                   child: Container(
                                    height: 25, 
                                    width: 80,
                                     child: Card( 
                                      color: MyColors.green2(),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                      child: Center(child: PoppinsText.custom(text: 'Finished', fontSize: 8, warna: MyColors.green(), fontWeight: FontWeight.w600),),
                                   ),)
                                    ),
                          ),
                      ),
                    )

                  ],
                ),
                
              ),
            ),
            Container(
              width: 151, 
              height: 120,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                elevation: 10,
                 color: Colors.white,
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 8, left: 10)),
                    Padding(padding: EdgeInsets.only(left: 15, top: 2),
                    child:  PoppinsText.custom(text: 'Fradricast fuck yeh yeh' ,
                     fontSize: 14, warna: MyColors.black(),
                      fontWeight: FontWeight.w600),),  
                    Padding(padding: EdgeInsets.only(top:  30)),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight ,
                        child: Padding(padding: EdgeInsets.only(right: 15, bottom : 3),
                            child: Container( 
                                      alignment: Alignment.bottomRight,
                                      width: 65,
                                      height: 30,
                                   child: Container(
                                    height: 25, 
                                    width: 80,
                                     child: Card( 
                                      color: MyColors.darkGrey(),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                      child: Center(child: PoppinsText.custom(text: 'Not Started', fontSize: 8, warna: MyColors.lightGrey2(), fontWeight: FontWeight.w600),),
                                   ),)
                                    ),
                          ),
                      ),
                    )

                  ],
                ),
                
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           Container(
               width: 151, 
              height: 120,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                elevation: 10,
                color: Colors.white,
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 8, left: 10)),
                    Padding(padding: EdgeInsets.only(left: 15, top: 2),
                    child:  PoppinsText.custom(text: 'Fradricast fuck yeh yeh' ,
                     fontSize: 14, warna: MyColors.black(),
                      fontWeight: FontWeight.w600),),  
                    Padding(padding: EdgeInsets.only(top:  30)),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight ,
                        child:  Padding(padding: EdgeInsets.only(right: 15),
                            child: Container( 
                                      alignment: Alignment.bottomRight,
                                      width: 65,
                                      height: 30,
                                   child: Container(
                                    height: 25, 
                                    width: 80,
                                     child: Card( 
                                      color: MyColors.green2(),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                      child: Center(child: PoppinsText.custom(text: 'Finished', fontSize: 8, warna: MyColors.green(), fontWeight: FontWeight.w600),),
                                   ),)
                                    ),
                          ),
                      ),
                    )

                  ],
                ),
                
              ),
            ),
            Container(
              width: 151, 
              height: 120,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                elevation: 10,
                 color: Colors.white,
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 8, left: 10)),
                    Padding(padding: EdgeInsets.only(left: 15, top: 2),
                    child:  PoppinsText.custom(text: 'Fradricast fuck yeh yeh' ,
                     fontSize: 14, warna: MyColors.black(),
                      fontWeight: FontWeight.w600),),  
                    Padding(padding: EdgeInsets.only(top:  30)),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight ,
                        child: Padding(padding: EdgeInsets.only(right: 15, bottom : 3),
                            child: Container( 
                                      alignment: Alignment.bottomRight,
                                      width: 65,
                                      height: 30,
                                   child: Container(
                                    height: 25, 
                                    width: 80,
                                     child: Card( 
                                      color: MyColors.darkGrey(),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                      child: Center(child: PoppinsText.custom(text: 'Not Started', fontSize: 8, warna: MyColors.lightGrey2(), fontWeight: FontWeight.w600),),
                                   ),)
                                    ),
                          ),
                      ),
                    )

                  ],
                ),
                
              ),
            ),
          ],
        ),  Padding(padding: EdgeInsets.only(top: 8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           Container(
               width: 151, 
              height: 120,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                elevation: 10,
                color: Colors.white,
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 8, left: 10)),
                    Padding(padding: EdgeInsets.only(left: 15, top: 2),
                    child:  PoppinsText.custom(text: 'Fradricast fuck yeh yeh' ,
                     fontSize: 14, warna: MyColors.black(),
                      fontWeight: FontWeight.w600),),  
                    Padding(padding: EdgeInsets.only(top:  30)),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight ,
                        child:  Padding(padding: EdgeInsets.only(right: 15),
                            child: Container( 
                                      alignment: Alignment.bottomRight,
                                      width: 65,
                                      height: 30,
                                   child: Container(
                                    height: 25, 
                                    width: 80,
                                     child: Card( 
                                      color: MyColors.green2(),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                      child: Center(child: PoppinsText.custom(text: 'Finished', fontSize: 8, warna: MyColors.green(), fontWeight: FontWeight.w600),),
                                   ),)
                                    ),
                          ),
                      ),
                    )

                  ],
                ),
                
              ),
            ),
            Container(
              width: 151, 
              height: 120,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                elevation: 10,
                 color: Colors.white,
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 8, left: 10)),
                    Padding(padding: EdgeInsets.only(left: 15, top: 2),
                    child:  PoppinsText.custom(text: 'Fradricast fuck yeh yeh' ,
                     fontSize: 14, warna: MyColors.black(),
                      fontWeight: FontWeight.w600),),  
                    Padding(padding: EdgeInsets.only(top:  30)),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight ,
                        child: Padding(padding: EdgeInsets.only(right: 15, bottom : 3),
                            child: Container( 
                                      alignment: Alignment.bottomRight,
                                      width: 65,
                                      height: 30,
                                   child: Container(
                                    height: 25, 
                                    width: 80,
                                     child: Card( 
                                      color: MyColors.darkGrey(),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                      child: Center(child: PoppinsText.custom(text: 'Not Started', fontSize: 8, warna: MyColors.lightGrey2(), fontWeight: FontWeight.w600),),
                                   ),)
                                    ),
                          ),
                      ),
                    )

                  ],
                ),
                
              ),
            ),
          ],
        ),  Padding(padding: EdgeInsets.only(top: 8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           Container(
               width: 151, 
              height: 120,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                elevation: 10,
                color: Colors.white,
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 8, left: 10)),
                    Padding(padding: EdgeInsets.only(left: 15, top: 2),
                    child:  PoppinsText.custom(text: 'Fradricast fuck yeh yeh' ,
                     fontSize: 14, warna: MyColors.black(),
                      fontWeight: FontWeight.w600),),  
                    Padding(padding: EdgeInsets.only(top:  30)),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight ,
                        child:  Padding(padding: EdgeInsets.only(right: 15),
                            child: Container( 
                                      alignment: Alignment.bottomRight,
                                      width: 65,
                                      height: 30,
                                   child: Container(
                                    height: 25, 
                                    width: 80,
                                     child: Card( 
                                      color: MyColors.green2(),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                      child: Center(child: PoppinsText.custom(text: 'Finished', fontSize: 8, warna: MyColors.green(), fontWeight: FontWeight.w600),),
                                   ),)
                                    ),
                          ),
                      ),
                    )

                  ],
                ),
                
              ),
            ),
            Container(
              width: 151, 
              height: 120,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                elevation: 10,
                 color: Colors.white,
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 8, left: 10)),
                    Padding(padding: EdgeInsets.only(left: 15, top: 2),
                    child:  PoppinsText.custom(text: 'Fradricast fuck yeh yeh' ,
                     fontSize: 14, warna: MyColors.black(),
                      fontWeight: FontWeight.w600),),  
                    Padding(padding: EdgeInsets.only(top:  30)),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight ,
                        child: Padding(padding: EdgeInsets.only(right: 15, bottom : 3),
                            child: Container( 
                                      alignment: Alignment.bottomRight,
                                      width: 65,
                                      height: 30,
                                   child: Container(
                                    height: 25, 
                                    width: 80,
                                     child: Card( 
                                      color: MyColors.darkGrey(),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                      child: Center(child: PoppinsText.custom(text: 'Not Started', fontSize: 8, warna: MyColors.lightGrey2(), fontWeight: FontWeight.w600),),
                                   ),)
                                    ),
                          ),
                      ),
                    )

                  ],
                ),
                
              ),
            ),
          ],
        ),
      ],
    );
  }
}
