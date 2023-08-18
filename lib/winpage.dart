import 'package:flutter/material.dart';
import 'package:math_puzzles/cntpagetwo.dart';
import 'package:math_puzzles/main.dart';
import 'package:share_plus/share_plus.dart';

class winpage extends StatefulWidget {
  int level;

  winpage(this.level);

  @override
  State<winpage> createState() => _winpageState();
}

class _winpageState extends State<winpage> {
  List temp = [];
  int index = 0;
  bool ContinuE = false;
  bool PuzzleS = false;
  bool Buy_PrO = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("images/background.jpg"))),
        child: Column(
          children: [
            Container(
              height: 80,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(5),
              child: Text(
                "PUZZLE ${widget.level} COMPLETED",
                style: TextStyle(fontSize: 25, color: Colors.deepPurpleAccent),
              ),
            ),
            Container(
              height: 200,
              alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("images/trophy.png"))),
            ),
            GestureDetector(
              onTapDown: (detailes) {
                ContinuE = true;
                setState(() {});
              },
              onTapUp: (detailes) {
                ContinuE = false;

                setState(() {});
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return cntpage();
                }));
              },
              onTapCancel: () {
                ContinuE = false;
                setState(() {});
              },
              child: Container(
                height: 50,
                width: 200,
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                child: Text(
                  "CONTINUE",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Colors.black38,
                      Colors.white,
                      Colors.grey,
                      Colors.black12
                    ])),
              ),
            ),
            GestureDetector(
              onTapDown: (detailes) {
                PuzzleS = true;
                setState(() {});
              },
              onTapUp: (detailes) {
                PuzzleS = false;

                setState(() {});
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Home();
                }));
              },
              onTapCancel: () {
                PuzzleS = false;
                setState(() {});
              },
              child: Container(
                height: 50,
                width: 200,
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                child: Text(
                  "MAIN MENU",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Colors.black38,
                      Colors.white,
                      Colors.grey,
                      Colors.black12
                    ])),
              ),
            ),
            GestureDetector(
                onTapDown: (detailes) {
                  Buy_PrO = true;
                  setState(() {});
                },
                onTapUp: (detailes) {
                  Buy_PrO = false;

                  setState(() {});
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Benefits of pro version",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                                fontSize: 25),
                          ),
                          content: Text("1.No Ads"
                              "\n"
                              "2.NO wait time for hint and skip"
                              "\n"
                              "3.hint for every level"
                              "\n"
                              "4.solution for every level"),
                          actions: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 30,
                                width: 70,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  "BUY",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 30,
                                width: 120,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  "NO, THANKS",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
                onTapCancel: () {
                  Buy_PrO = false;
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  width: 200,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  child: Text(
                    "BUY PRO",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Colors.black38,
                      Colors.white,
                      Colors.grey,
                      Colors.black12
                    ]),
                  ),
                )),
            Container(
              height: 50,
              width: 300,
              alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              child: Text(
                "SHARE THIS PUZZLE",
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [Colors.grey, Colors.white, Colors.grey])),
              child: InkWell(
                onTap: () {
                  Share.share('${widget.level}', subject: 'Look what I made!');
                },
                child: Container(
                  height: 45,
                  width: 45,
                  margin: EdgeInsets.all(3),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/shareus.png"))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
