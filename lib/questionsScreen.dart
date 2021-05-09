import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';
import 'giftscreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String radioItem = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/gift.gif'),
              fit: BoxFit.cover,
            )),
        child: Align(
          alignment: FractionalOffset.bottomLeft,
          child: Container(
            height: 340,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Container(
                  child: SizedBox(
                    child: Text(
                      "What is your step?",
                      style: TextStyle(
                        color: Color(0xFFBF8989),
                        fontSize: 24,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(top: 50),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(80, 35, 30, 20),
                  child: RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Color(0xFFE4B4B4),
                    groupValue: radioItem,
                    title: Text('Make a recommendation'),
                    value: 'Item 1',
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(80, 0, 30, 0),
                  child: RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Color(0xFFE4B4B4),
                    groupValue: radioItem,
                    title: Text('Browse the categories'),
                    value: 'Item 2',
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xFFBF8989), //0xFFBF8989 CEAEAF E4B4B4
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    onPressed: () => setState(() {

                      if(radioItem =='Item 2'){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GiftScreen()),
                        );
                      }
                      else if(radioItem == 'Item 1') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyNextPage()),
                        );
                      }
                    }),
                    child: Text(
                      "Next".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            alignment: FractionalOffset.topCenter,
          ),
        ),
      ),
    );
  }
}

class MyNextPage extends StatefulWidget {
  MyNextPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyNextPageState createState() => _MyNextPageState();
}

class _MyNextPageState extends State<MyNextPage> {
  int currentValue = 16;
  double value = 1500.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/gift.gif'),
              fit: BoxFit.cover,
            )),
        child: Align(
          alignment: FractionalOffset.bottomLeft,
          child: Container(
            height: 400,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: 30),
                  child: Row(
                    children: [
                      Text(
                        "Budget",
                        style: TextStyle(
                          color: Color(0xFFBF8989),
                          fontSize: 24,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Slider(
                    value: value,
                    min: 1.0,
                    max: 5000.0,
                    divisions: 100,
                    label: "$value",
                    activeColor: Color(0xFFBF8989),
                    inactiveColor: Color(0xFFEEEEEE),
                    onChanged: (newRating) {
                      setState(() => value = newRating.roundToDouble());
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, left: 30),
                  child: Row(
                    children: [
                      Text(
                        "Age",
                        style: TextStyle(
                          color: Color(0xFFBF8989),
                          fontSize: 24,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      // decoration: BoxDecoration(
                      //   border: Border.all(
                      //     color: Color(0xFFBF8989),
                      //     style: BorderStyle.solid,
                      //   ),
                      // ),
                      child: NumberPicker(
                        value: currentValue,
                        minValue: 1,
                        maxValue: 50,
                        selectedTextStyle: TextStyle(color: Color(0xFFBF8989)),
                        onChanged: (newValue) {
                          setState(() => currentValue = newValue);
                        },

                        decoration: BoxDecoration(
                          border: new Border(

                            top: new BorderSide(

                              style: BorderStyle.solid,
                              color: Colors.black26,
                            ),
                            bottom: new BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xFFBF8989), //0xFFBF8989 CEAEAF E4B4B4
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    onPressed: () => setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyQuestionPage()),
                      );
                    }),
                    child: Text(
                      "Next".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            alignment: FractionalOffset.topCenter,
          ),
        ),
      ),
    );
  }
}

class MyQuestionPage extends StatefulWidget {
  MyQuestionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyQuestionPage createState() => _MyQuestionPage();
}

class _MyQuestionPage extends State<MyQuestionPage> {
  int currentValue = 16;
  double value = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/gift.gif'),
              fit: BoxFit.cover,
            )),
        child: Align(
          alignment: FractionalOffset.bottomLeft,
          child: Container(
            height: 370,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "What does he/she mean to you?",
                          style: TextStyle(
                            color: Color(0xFFBF8989),
                            fontSize: 24,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      child: CupertinoPicker(
                        itemExtent: 50,
                        looping: true,
                        onSelectedItemChanged: (int index) {},
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Father",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Mother",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Brother",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Sister",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Son",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xFFBF8989), //0xFFBF8989 CEAEAF E4B4B4
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    onPressed: () => setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyQuestionPage2()),
                      );
                    }),
                    child: Text(
                      "Next".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            alignment: FractionalOffset.topCenter,
          ),
        ),
      ),
    );
  }
}

class MyQuestionPage2 extends StatefulWidget {
  MyQuestionPage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyQuestionPage2 createState() => _MyQuestionPage2();
}

class _MyQuestionPage2 extends State<MyQuestionPage2> {
  int currentValue = 16;
  double value = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/gift.gif'),
              fit: BoxFit.cover,
            )),
        child: Align(
          alignment: FractionalOffset.bottomLeft,
          child: Container(
            height: 370,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "What is the gift occasion?",
                          style: TextStyle(
                            color: Color(0xFFBF8989),
                            fontSize: 24,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      child: CupertinoPicker(
                        itemExtent: 50,
                        looping: true,
                        onSelectedItemChanged: (int index) {},
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Birthday",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Anniversary",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Graduation",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Achievement",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Wedding",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xFFBF8989), //0xFFBF8989 CEAEAF E4B4B4
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    onPressed: () => setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyQuestionPage3()),
                      );
                    }),
                    child: Text(
                      "Next".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            alignment: FractionalOffset.topCenter,
          ),
        ),
      ),
    );
  }
}

class MyQuestionPage3 extends StatefulWidget {
  MyQuestionPage3({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyQuestionPage3 createState() => _MyQuestionPage3();
}

class _MyQuestionPage3 extends State<MyQuestionPage3> {
  int currentValue = 16;
  double value = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/gift.gif'),
              fit: BoxFit.cover,
            )),
        child: Align(
          alignment: FractionalOffset.bottomLeft,
          child: Container(
            height: 370,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 30, left: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "What are his interests?",
                              style: TextStyle(
                                color: Color(0xFFBF8989),
                                fontSize: 24,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      child: CupertinoPicker(
                        itemExtent: 50,
                        looping: true,
                        onSelectedItemChanged: (int index) {},
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Sport",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Reading",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Watch Movies",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Arts & Painting",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Kitchen & Cooking",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xFFBF8989), //0xFFBF8989 CEAEAF E4B4B4
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    onPressed: () => setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyQuestionPage4()),
                      );
                    }),
                    child: Text(
                      "Next".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            alignment: FractionalOffset.topCenter,
          ),
        ),
      ),
    );
  }
}

class MyQuestionPage4 extends StatefulWidget {
  MyQuestionPage4({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyQuestionPage4 createState() => _MyQuestionPage4();
}

class _MyQuestionPage4 extends State<MyQuestionPage4> {
  int currentValue = 16;
  double value = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/gift.gif'),
              fit: BoxFit.cover,
            )),
        child: Align(
          alignment: FractionalOffset.bottomLeft,
          child: Container(
            height: 370,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "What does he like?",
                            style: TextStyle(
                              color: Color(0xFFBF8989),
                              fontSize: 24,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      child: CupertinoPicker(
                        itemExtent: 50,
                        looping: true,
                        onSelectedItemChanged: (int index) {},
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Accessories",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Makeup & Skincare",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Pets",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Clothes",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Electornics",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBF8989),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xFFBF8989), //0xFFBF8989 CEAEAF E4B4B4
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    onPressed: () => setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GiftScreen()),
                      );
                    }),
                    child: Text(
                      "Search".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            alignment: FractionalOffset.topCenter,
          ),
        ),
      ),
    );
  }
}
