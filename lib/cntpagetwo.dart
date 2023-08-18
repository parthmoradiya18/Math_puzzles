import 'package:flutter/material.dart';
import 'package:math_puzzles/mydata.dart';
import 'package:math_puzzles/winpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class cntpage extends StatefulWidget {

  @override
  State<cntpage> createState() => _cntpageState();
}

class _cntpageState extends State<cntpage> {
  String str = "";
  int leve=0;
  SharedPreferences? prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  getdata()
  async {
    prefs = await SharedPreferences.getInstance();
    final int? counter = prefs!.getInt('clevel');
    leve = counter!;
    setState(() {
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("images/gameplaybackground.jpg"))),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(onTap: () {
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text("skip"),
                      content: Text("Are you sure want To skip this level ? you can play skipped leves later by clicking on PUZZLES menu from main Screen."),
                    actions: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 30,
                          width: 80,
                          margin: EdgeInsets.all(5),
                          child: Text("CANCEL",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.pink),),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          if(leve < mydata.imageslist.length-1)
                          {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString("curlevel$leve", "skip");

                            leve++;
                          }
                          Navigator.pop(context);
                          setState(() {
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 80,
                          margin: EdgeInsets.all(5),
                          child: Text("OK",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.pink),),
                        ),
                      ),
                    ],
                    );
                  });
                },
                  child: Container(
                    height: 45,
                    width: 40,
                    margin:
                        EdgeInsets.only(top: 35, left: 15, bottom: 20, right: 15),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/skip.png"))),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      "PUZZLES${leve+1}",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/level_board.png"))),
                  ),
                ),
                InkWell(onTap: () {
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text("hint"),
                      content: Text("Split 28 into 2 and 8"),
                      actions: [
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                            setState(() {
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 80,
                            margin: EdgeInsets.all(5),
                            child: Text("OK",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.pink),),
                          ),
                        ),
                      ],
                    );
                  });
                  setState(() {

                  });
                },
                  child: Container(
                    height: 45,
                    width: 40,
                    margin:
                        EdgeInsets.only(top: 35, left: 15, bottom: 20, right: 15),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/hint.png"))),
                  ),
                ),
              ],
            ),
            Container(
              height: 300,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage("images/${mydata.imageslist[leve]}"))),
            ),
            Spacer(),
            Container(
                height: 100,
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 40,
                            width: 220,
                            margin: EdgeInsets.all(3),
                            child: Text(str,style: TextStyle(fontSize: 18,),),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white70),
                                borderRadius: BorderRadius.circular(5))),
                        InkWell(onTap: () {
                          str=str.substring(0,str.length-1);
                          setState(() {

                          });
                        },
                          child: Container(
                            height: 50,
                            width: 45,
                            
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/delete.png"))),
                          ),
                        ),
                        InkWell(onTap: () async {
                          if(mydata.anslist[leve] == str)
                          {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString('clevel$leve', 'win');
                            leve++;
                            await prefs.setInt('clevel', leve);
                            str = "";
                            setState(() {});
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return winpage(leve);
                            }));
                          }
                          else
                          {
                            print("wrong!");
                          }

                        },
                          child: Container(
                            height: 55,
                            width: 65,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(3),
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(onTap: () {
                          setState(() {
                            str=str+"1";
                          });
                        },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                border: Border.all(color: Colors.white70),
                                borderRadius: BorderRadius.circular(5)),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Text(
                              "1",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        InkWell(onTap: () {
                          setState(() {
                            str=str+"2";
                          });
                        },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                border: Border.all(color: Colors.white70),
                                borderRadius: BorderRadius.circular(5)),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Text(
                              "2",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        InkWell(onTap: () {
                          setState(() {
                            str=str+"3";
                          });
                        },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                border: Border.all(color: Colors.white70),
                                borderRadius: BorderRadius.circular(5)),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Text(
                              "3",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        InkWell(onTap: () {
                          setState(() {
                            str=str+"4";
                          });
                        },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                border: Border.all(color: Colors.white70),
                                borderRadius: BorderRadius.circular(5)),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Text(
                              "4",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        InkWell(onTap: () {
                          setState(() {
                            str=str+"5";
                          });
                        },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                border: Border.all(color: Colors.white70),
                                borderRadius: BorderRadius.circular(5)),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Text(
                              "5",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        InkWell(onTap: () {
                          setState(() {
                            str=str+"6";
                          });
                        },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                border: Border.all(color: Colors.white70),
                                borderRadius: BorderRadius.circular(5)),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Text(
                              "6",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        InkWell(onTap: () {
                          setState(() {
                            str=str+"7";
                          });
                        },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                border: Border.all(color: Colors.white70),
                                borderRadius: BorderRadius.circular(5)),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Text(
                              "7",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        InkWell(onTap: () {
                          setState(() {
                            str=str+"8";
                          });
                        },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                border: Border.all(color: Colors.white70),
                                borderRadius: BorderRadius.circular(5)),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Text(
                              "8",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        InkWell(onTap: () {
                          setState(() {
                            str=str+"9";
                          });
                        },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                border: Border.all(color: Colors.white70),
                                borderRadius: BorderRadius.circular(5)),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Text(
                              "9",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        InkWell(onTap: () {
                          setState(() {
                            str=str+"0";
                          });
                        },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                border: Border.all(color: Colors.white70),
                                borderRadius: BorderRadius.circular(5)),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Text(
                              "0",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),

            Spacer(),

          ],
        ),
      ),
    );
  }
}
