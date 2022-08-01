import 'dart:io';

import 'package:camera/camera.dart';
import 'package:carapp/widgets/clr.dart';
import 'package:carapp/widgets/extra.dart';
import 'package:carapp/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class Adduser extends StatefulWidget {
  @override
  State<Adduser> createState() => _AdduserState();
}

class _AdduserState extends State<Adduser> {
  List listt = [];
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(children: [
        GestureDetector(
            onTap: () {
              setState(() {
                showed();
              });
            },
            child: Container(child: Icon(Icons.add))),

        // Wrap(
        //   children: List.generate(
        //     listt.length,
        //     (index) => Container(
        //       height: 100,
        //       width: 100,
        //       child: _imageFile != null
        //           ? Image.file(File(_imageFile!.path))
        //           : Image.asset("assets/images/cars1.png"),
        //     ),
        //   ),
        // ),

        ListView.builder(
            shrinkWrap: true,
            itemCount: listt.length,
            itemBuilder: (context, index) {
              return Row(children: [
                Container(
                  height: 100,
                  width: 100,
                  child: _imageFile != null
                      ? Image.file(File(_imageFile!.path))
                      : Image.asset("assets/images/cars1.png"),
                ),
              ]);
            })
      ]),
    ));
  }

  Future getpic() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
      listt.add(_imageFile);
    });
    

    //image//cam//
  }

  showed() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: boxclr,
              actions: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: 250,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          getpic();
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: butnclr,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Textwidget(
                              text: "Camera",
                              fontsize: 30,
                              colur: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      /// galery///
                      GestureDetector(
                        onTap: () {
                          getpic();
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: butnclr,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Textwidget(
                              text: "Gallery",
                              fontsize: 30,
                              colur: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
  }
}
