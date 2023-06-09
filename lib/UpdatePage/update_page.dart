import 'package:flutter/material.dart';
import 'package:welcome/Mechanic_page/component/defaultAppBar.dart';
import 'package:welcome/Mechanic_page/component/defaultBackButton.dart';
import 'package:welcome/constant.dart';
import 'package:welcome/inputField.dart';

class Update_Page extends StatefulWidget {
  const Update_Page({super.key});

  @override
  State<Update_Page> createState() => _Update_PageState();
}

class _Update_PageState extends State<Update_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'UPDATE INFOR',
        child: DefaultBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Update Data'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'times new roman',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                inputField(
                  const Icon(Icons.person, color: Colors.black),
                  'Ful_Name',
                  obscure: false,
                ),
                inputField(
                  Icon(Icons.person_outlined, color: Colors.black),
                  'Business Name',
                  obscure: false,
                ),
                inputField(
                  Icon(Icons.home_outlined, color: Colors.black),
                  'Shop Address',
                  obscure: false,
                ),
                inputField(
                  Icon(Icons.phone_android, color: Colors.black),
                  'Phone Nubeer',
                  obscure: false,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    child: Text(
                      'Update'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: kDarkColor),
                    ),
                    onPressed: () => {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlue),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
