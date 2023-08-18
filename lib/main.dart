import 'package:flutter/material.dart';
import 'package:math_puzzles/cntpagetwo.dart';
import 'package:math_puzzles/mydata.dart';
import 'package:math_puzzles/puzzlepage.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // int curinex=0;
  List temp = [];
  bool ContinuE = false;
  bool PuzzleS = false;
  bool Buy_PrO = false;
  int curindex = 0;
  List level = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    temp = List.filled(mydata.anslist.length, false);
  }

  getdata() async {
    level.clear();
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < mydata.imageslist.length; i++) {
      final String? action = prefs.getString('clevel$i') ?? "blank";
      level.add(action);
      setState(() {});
    }
    print(level);
  }

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
              height: 100,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              child: Text(
                "math puzzle",
                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 25),
              ),
            ),
            Expanded(
              child: Container(
                // height: 400,
                width: double.infinity,
                margin: EdgeInsets.all(20),

                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/blackboard_main_menu.png"))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTapDown: (detailes) {
                        ContinuE = true;
                        setState(() {});
                      },
                      onTapUp: (detailes) {
                        ContinuE = false;

                        setState(() {});
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: (ContinuE == true)
                              ? Border.all(width: 5, color: Colors.grey)
                              : null,
                        ),
                        margin: EdgeInsets.all(5),
                        child: Text(
                          "CONTINUE",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: "f2",
                              fontWeight: FontWeight.bold),
                        ),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return puzzlepage(level);
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: (PuzzleS == true)
                              ? Border.all(width: 5, color: Colors.grey)
                              : null,
                        ),
                        margin: EdgeInsets.all(5),
                        child: Text(
                          "PUZZLES",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: "f2",
                              fontWeight: FontWeight.bold),
                        ),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: (Buy_PrO == true)
                              ? Border.all(width: 5, color: Colors.grey)
                              : null,
                        ),
                        margin: EdgeInsets.all(5),
                        child: Text(
                          "BUY PRO",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: "f2",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 30,
                      width: 30,
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: Text(
                        "AD",
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(bottom: 5, left: 15, right: 15),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/ltlicon.png"))),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Share.share('${mydata.imageslist[curindex]}',
                                    subject: 'Look what I made!');
                                //Share.share("${widget.shayrilist[widget.curind]}", subject: 'Look what I made!');
                                setState(() {});
                              },
                              child: Container(
                                height: 45,
                                width: 45,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black54),
                                    color: Colors.grey),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "images/shareus.png"))),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: Container(
                                height: 45,
                                width: 45,
                                alignment: Alignment.bottomLeft,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.black54),
                                    color: Colors.grey),
                                child: Container(
                                  height: 43,
                                  width: 43,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "images/emailus.png"))),
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: Text(
                              "Privacy Policy",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
