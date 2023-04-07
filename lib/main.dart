import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp((MyApp()));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roll The Dice Game',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _walletBalance = 0;

  void _rollDice() {
    setState(() {
      _walletBalance += Random().nextInt(12) + 2;
      print(_walletBalance);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 180,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Wallet Balance:',
                              style: GoogleFonts.pressStart2p(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100),
                            ),
                            SizedBox(),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Text(
                              '$_walletBalance',
                              style: GoogleFonts.pressStart2p(
                                  color: Colors.orange,
                                  fontSize: 100,
                                  fontWeight: FontWeight.w100),
                            ),
                            SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(
                    'assets/dice.png',
                    width: 150,
                    height: 150,
                  ),
                  Image.asset(
                    'assets/dice.png',
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
              InkWell(
                onTap: _rollDice,
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black12),
                  child: Center(
                    child: Text(
                      'Roll the Dice',
                      style: GoogleFonts.pressStart2p(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
