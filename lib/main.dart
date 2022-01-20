import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black38,
        body: const MyStatelessWidget(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<dynamic>(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        //Parents only
                        Center(
                          child: Container(
                            child: AutoSizeText(
                              'Parents Only',
                              style: TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF2DAD9D),
                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,
                              minFontSize: 18,
                            ),
                            padding: EdgeInsets.only(top: 14),
                          ),
                        ),
                        //Please only
                        Center(
                          child: Container(
                            child: AutoSizeText(
                              'To access,\n'
                              'Please enter the below numbers',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                color: Color(0XFF000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            margin: EdgeInsets.only(top: 10),
                          ),
                        ),
                        //Add container and work
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0XFFFFDC00),
                              border: Border.all(
                                color: Colors.white70,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: AutoSizeText(
                              'Two Four Two Zero',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF000000),
                                backgroundColor: Color(0XFFFFDC00),
                              ),
                              textAlign: TextAlign.center,
                              minFontSize: 18,
                              maxLines: 2,
                            ),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.height * 0.38,
                            height: MediaQuery.of(context).size.height * 0.06,
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(top: 10),
                          ),
                        ),
                        //Pin code field work
                        Center(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(),
                              child: PinCodeTextField(
                                autofocus: true,
                                highlight: true,
                                highlightColor: Colors.indigo,
                                defaultBorderColor: Colors.indigo,
                                pinBoxBorderWidth: 1.0,
                                maxLength: 4,
                                pinBoxWidth:
                                    MediaQuery.of(context).size.height * 0.07,
                                pinBoxHeight:
                                    MediaQuery.of(context).size.height * 0.06,
                                wrapAlignment: WrapAlignment.spaceAround,
                                pinBoxDecoration: ProvidedPinBoxDecoration
                                    .defaultPinBoxDecoration,
                                pinBoxRadius: 8.0,
                                pinTextStyle: TextStyle(
                                  fontSize: 25.0,
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 16, bottom: 20),
                          ),
                        ),
                        //Submit button
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.height * 0.28,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0XFF1353CB),
                                  border: Border.all(
                                    color: Color(0XFF1353CB),
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: AutoSizeText(
                                        "SUBMIT",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        minFontSize: 12,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.only(right: 8, left: 8),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
