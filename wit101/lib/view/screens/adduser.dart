import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/widgets/MyDrawer.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  var controllerName = TextEditingController();

  var controllerEmail = TextEditingController();

  var controllerUsername = TextEditingController();

  var controllerPassword = TextEditingController();

  var controllerAddress = TextEditingController();

  bool _showPassword = true;

  String selectedValue = 'Position';

  var items = ['Position', 'Admin', 'Market', 'Account Management'];

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
          banner(context),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
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
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 20,
                              ),
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage:
                                    AssetImage('assets/png/stockprofile.png'),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 117, left: 100),
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) =>
                                        bottomSheet(context)),
                                  );
                                },
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Color.fromRGBO(232, 23, 31, 1),
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 14),
                          width: 320,
                          height: 50,
                          child: TextFormField(
                            controller: controllerUsername,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: 'Username',
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
                            controller: controllerEmail,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: 'Email',
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
                            controller: controllerPassword,
                            obscureText: _showPassword,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              suffixIcon: IconButton(
                                icon: Icon(_showPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  _showPassword = !_showPassword;
                                  setState(() {});
                                },
                              ),
                              hintText: "Password",
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
                            controller: controllerAddress,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: 'Address',
                            ),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 14),
                          width: 320,
                          height: 60,
                          child: dropdownMenu(),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 62.48),
                          width: 320,
                          height: 50,
                          child: buttonSave(),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.48),
                          width: 320,
                          height: 50,
                          child: buttonCancel(),
                        ),
                        SizedBox(
                          height: 20,
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
          Padding(
            padding: EdgeInsets.only(left: 20, top: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsText.custom(
                    text: 'Create',
                    fontSize: 16,
                    warna: Colors.white,
                    fontWeight: FontWeight.w600),
                PoppinsText.custom(
                    text: 'New Account',
                    fontSize: 16,
                    warna: Colors.white,
                    fontWeight: FontWeight.w600),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Image.asset('assets/png/circle1.png'),
          ),
        ],
      ),
    );
  }

  Widget changeProfile(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Positioned(
          top: 40,
          left: 110,
          child: CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/png/stockprofile.png'),
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          top: 130,
          left: 215,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet(context)),
              );
            },
            child: const Icon(
              Icons.camera_alt,
              color: Color.fromRGBO(232, 23, 31, 1),
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: <Widget>[
          Text(
            'Choose Profile Photo',
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 80,
                child: TextButton(
                  onPressed: () {},
                  child: Column(
                    children: const [
                      Icon(Icons.camera),
                      Text('Camera'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 80,
                child: TextButton(
                  onPressed: () {},
                  child: Column(
                    children: const [
                      Icon(Icons.photo_album),
                      Text('Gallery'),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget dropdownMenu() {
    return InputDecorator(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: selectedValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: const Color.fromRGBO(156, 156, 156, 1)),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            }),
      ),
    );
  }

  Widget buttonSave() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(232, 23, 31, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        'Save',
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
