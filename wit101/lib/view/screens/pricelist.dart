import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wit101/model/view_model/view_model_price.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';
import 'package:wit101/view/screens/edit_price_screen.dart';
import 'package:wit101/widgets/drawer_screen.dart';

class PriceList extends StatefulWidget {
  const PriceList({Key? key}) : super(key: key);

  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  toDetail(DocumentSnapshot post) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EditPriceScreen(post: post)));
  }

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
          Stack(
            children: [
              banner(),
              Container(
                padding: const EdgeInsets.only(top: 130, left: 10, right: 10),
                alignment: Alignment.center,
                child: searchView(),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('price_list')
                      .snapshots(),
                  builder: (context, snapshots) {
                    return (snapshots.connectionState ==
                            ConnectionState.waiting)
                        ? const Center()
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            itemCount: snapshots.data?.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshots.data?.docs[index];

                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 161,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 1),
                                              blurRadius: 5,
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                            ),
                                          ],
                                          color: Colors.white,
                                        ),
                                        child: Stack(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 10,
                                                        left: 16,
                                                      ),
                                                      child: PoppinsText.custom(
                                                        text: 'ID :',
                                                        fontSize: 14,
                                                        warna: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 10,
                                                        left: 5,
                                                      ),
                                                      child: PoppinsText.custom(
                                                        text: data!['id'],
                                                        fontSize: 13,
                                                        warna: MyColors.red(),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  height: 20,
                                                  thickness: 2,
                                                  color: MyColors.lightGrey(),
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 16),
                                                      child: PoppinsText.custom(
                                                        text: data['harga_min'],
                                                        fontSize: 14,
                                                        warna: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: PoppinsText.custom(
                                                        text: '-',
                                                        fontSize: 14,
                                                        warna: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: PoppinsText.custom(
                                                        text: data['harga_max'],
                                                        fontSize: 14,
                                                        warna: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 16),
                                                      child: PoppinsText.custom(
                                                        text: 'Persentage',
                                                        fontSize: 12,
                                                        warna: const Color
                                                                .fromRGBO(
                                                            203, 203, 203, 1),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: PoppinsText.custom(
                                                        text: ':',
                                                        fontSize: 12,
                                                        warna: const Color
                                                                .fromRGBO(
                                                            203, 203, 203, 1),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: PoppinsText.custom(
                                                        text:
                                                            data['persentase'],
                                                        fontSize: 12,
                                                        warna: const Color
                                                                .fromRGBO(
                                                            203, 203, 203, 1),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: SizedBox(
                                                          height: 40,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              toDetail(snapshots
                                                                  .data!
                                                                  .docs[index]);
                                                            },
                                                            child: PoppinsText.custom(
                                                                text:
                                                                    'Edit Price',
                                                                fontSize: 14,
                                                                warna: MyColors
                                                                    .red(),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              elevation: 0,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                side:
                                                                    BorderSide(
                                                                  color: MyColors
                                                                      .red(),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      SizedBox(
                                                        height: 40,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            DbPrice()
                                                                .deletePrice(
                                                                    id: data[
                                                                        'id'])
                                                                .then((value) =>
                                                                    Fluttertoast
                                                                        .showToast(
                                                                            msg:
                                                                                "Price Berhasil Di Hapus"));
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            elevation: 0,
                                                            backgroundColor:
                                                                MyColors.red(),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                          ),
                                                          child: SvgPicture.asset(
                                                              'assets/svg/trash.svg'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                  }))
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
          Positioned(
            top: 89,
            left: 20,
            child: PoppinsText.custom(
                text: 'Price List',
                fontSize: 16,
                warna: Colors.white,
                fontWeight: FontWeight.w700),
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

  Widget searchView() {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.search),
          hintText: 'Search...',
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
              width: 2.5,
              color: MyColors.lightGrey(),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
