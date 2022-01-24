import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black38,
        body: MyStatelessWidget(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  padding:
                      EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 16),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //Parents only section column 1
                      Container(
                        padding: EdgeInsets.all(4.0),
                        margin: EdgeInsets.only(top: 26),
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
                      ),

                      //Please only section column 2
                      Container(
                        margin: EdgeInsets.only(top: 4, bottom: 4),
                        child: AutoSizeText(
                          'To access,\n'
                          'Please enter the below numbers',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            color: Color(0XFF000000),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      //Yellow OTP section Column 3
                      Container(
                        width: MediaQuery.of(context).size.height * 0.40,
                        height: MediaQuery.of(context).size.height * 0.06,
                        margin: EdgeInsets.only(top: 10, bottom: 12),
                        padding: EdgeInsets.all(1),
                        alignment: Alignment.center,
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
                          addString(),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF000000),
                            backgroundColor: Color(0XFFFFDC00),
                            //wordSpacing: 1,
                          ),
                          textAlign: TextAlign.center,
                          minFontSize: 16,
                          maxLines: 2,
                        ),
                      ),

                      //Pin code field column section 4
                      Container(
                        padding: EdgeInsets.all(2),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.075,
                        margin: EdgeInsets.only(top: 4, bottom: 8),
                        child: PinCodeTextField(
                          showCursor: true,
                          cursorColor: Colors.blue,
                          cursorWidth: 1,
                          cursorHeight: 16,
                          appContext: context,
                          autoFocus: true,
                          length: 4,
                          keyboardType: TextInputType.phone,
                          obscureText: false,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          scrollPadding: EdgeInsets.only(),
                          textStyle: TextStyle(
                            fontSize: 25.0,
                          ),
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(6),
                            activeColor: Color.fromRGBO(19, 83, 203, 1),
                            selectedFillColor: Color.fromRGBO(19, 83, 203, 1),
                            selectedColor: Color.fromRGBO(19, 83, 203, 1),
                            //activeFillColor: Color.fromRGBO(19, 83, 203, 1),
                            borderWidth: 1,
                            errorBorderColor: Colors.redAccent,
                            inactiveColor: Color.fromRGBO(19, 83, 203, 1),
                            fieldHeight:
                                MediaQuery.of(context).size.height * 0.06,
                            fieldWidth:
                                MediaQuery.of(context).size.height * 0.07,
                          ),
                          //animationDuration: Duration(milliseconds: 300),
                          //enableActiveFill: true,
                          onChanged: (value) {},
                          onCompleted: (v) {
                            print("Completed");
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        ),
                      ),

                      //Submit button Column 5
                      Container(
                        height: MediaQuery.of(context).size.height * 0.055,
                        width: MediaQuery.of(context).size.height * 0.28,
                        padding: EdgeInsets.only(
                            left: 3, top: 1, right: 3, bottom: 1),
                        margin: EdgeInsets.only(top: 4, bottom: 12),
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
                                AutoSizeText(
                                  'SUBMIT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  minFontSize: 12,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  //Function to return string in OTP field
  String addString() {
    String newStr = '';
    String str;
    var currentNum;
    final Map<int, String> someMap = {
      0: 'Zero',
      1: 'One',
      2: 'Two',
      3: 'Three',
      4: 'Four',
      5: 'Five',
      6: 'Six',
      7: 'Seven',
      8: 'Eight',
      9: 'Nine'
    };
    var ran = new Random();
    for (var i = 0; i < 4; i++) {
      currentNum = ran.nextInt(10);
      str = someMap[currentNum].toString();
      newStr = newStr + ' ' + str;
    }
    return newStr;
  }
}
