import 'package:flutter/material.dart';
import 'package:math_puzzles/cntpagetwo.dart';

class puzzlepage extends StatefulWidget {
  List snlevel = [];

  puzzlepage(this.snlevel);

  @override
  State<puzzlepage> createState() => _puzzlepageState();
}

class _puzzlepageState extends State<puzzlepage> {
  List level = [];

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
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.all(5),
              alignment: Alignment.bottomCenter,
              child: Text(
                "Select puzzle",
                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 25),
              ),
            ),
            Expanded(
                child: GridView.builder(
              itemCount: 20,
              // scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 5, crossAxisSpacing: 5),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return cntpage();
                    }));
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5),
                    child: (widget.snlevel[index] == 'win')
                        ? Text("${index + 1}",
                            style: TextStyle(fontSize: 25, color: Colors.black))
                        : (widget.snlevel[index] == 'skip')
                            ? Text("${index + 1}",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black))
                            : null,
                    decoration: BoxDecoration(
                        image: (widget.snlevel[index] == "win")
                            ? DecorationImage(
                                image: AssetImage("images/tick.png"))
                            : (widget.snlevel[index] == "blank")
                                ? DecorationImage(
                                    image: AssetImage("images/lock.png"))
                                : null,
                        border: (widget.snlevel[index] == "win")
                            ? Border.all(width: 3, color: Colors.black)
                            : (widget.snlevel[index] == "skip")
                                ? Border.all(width: 3, color: Colors.grey)
                                : null,
                        borderRadius: (widget.snlevel[index] == "win")
                            ? BorderRadius.all(Radius.circular(10))
                            : (widget.snlevel[index] == "skip")
                                ? BorderRadius.all(Radius.circular(10))
                                : null),
                  ),
                );
              },
            )),
            // Spacer(),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/back.png"))),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/next.png"))),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
