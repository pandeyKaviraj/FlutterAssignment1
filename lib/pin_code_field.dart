import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:math';

class CustomPinField extends StatefulWidget {
  const CustomPinField({Key? key}) : super(key: key);

  @override
  _CustomPinFieldState createState() => _CustomPinFieldState();
}

class _CustomPinFieldState extends State<CustomPinField> {
  String numStr = '';
  String currentText = '';
  bool hasError = false;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //Parents only section column 1
            Container(
              margin: EdgeInsets.only(top: 40),
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
              margin: EdgeInsets.only(top: 12, bottom: 12),
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
              width: MediaQuery.of(context).size.width * 0.70,
              height: MediaQuery.of(context).size.height * 0.5 * 0.15,
              margin: EdgeInsets.only(bottom: 12),
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
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF000000),
                  //wordSpacing: 1,
                ),
                textAlign: TextAlign.center,
                minFontSize: 18,
                maxLines: 1,
              ),
            ),

            //Pin code field column section 4
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.5 * 0.15,
              margin: EdgeInsets.only(bottom: 26),
              child: PinCodeTextField(
                showCursor: true,
                cursorColor: Colors.blue,
                cursorWidth: 1,
                appContext: context,
                autoFocus: true,
                length: 4,
                keyboardType: TextInputType.phone,
                obscureText: false,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                scrollPadding: EdgeInsets.only(),
                textStyle: TextStyle(
                  fontSize: 20.0,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(6),
                  activeColor: hasError ? Color(0XFF1353CB) : Colors.redAccent,
                  selectedFillColor: Color(0XFF1353CB),
                  selectedColor: Color(0XFF1353CB),
                  //activeFillColor: Color.fromRGBO(19, 83, 203, 1),
                  borderWidth: 1,
                  errorBorderColor: Colors.redAccent,
                  inactiveColor: Color(0XFF1353CB),
                  fieldHeight: MediaQuery.of(context).size.height * 0.5 * 0.15,
                  fieldWidth: 60,
                ),
                //animationDuration: Duration(milliseconds: 300),
                //enableActiveFill: true,
                onChanged: (value) {
                  if (value == numStr) {
                    setState(() {
                      hasError = true;
                    });
                  } else {
                    hasError = false;
                  }
                },
                onCompleted: (v) {
                  print("Completed");
                },
              ),
            ),
            //Submit button Column 5
            Container(
              height: 50,
              width: 210,
              margin: EdgeInsets.only(bottom: 14),
              child: GestureDetector(
                onTap: () {
                  if (hasError == true) {
                    print('Sucess!');
                  } else {
                    print('Try Again!');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0XFF1353CB),
                    border: Border.all(
                      color: Color(0XFF1353CB),
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: AutoSizeText(
                    'SUBMIT',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    minFontSize: 8,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
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
      numStr = numStr + currentNum.toString();
      str = someMap[currentNum].toString();
      newStr = newStr + '' + str;
    }
    return newStr;
  }
}
