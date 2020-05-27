import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 250.0,
                color: Color(getColorHexFromStr('#fff5ea'))
              ),
              Column(
                children: <Widget>[
            
               Container(
               padding:  EdgeInsets.fromLTRB(15.0, 35, 15,10 ),
                 child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(25),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border:InputBorder.none ,
                          prefixIcon: Icon(Icons.search,color: Colors.black,),
                          contentPadding: EdgeInsets.only(left: 15, top: 15),
                          hintText: 'search for recipes',
                          hintStyle: TextStyle(color: Colors.orange)
                        ),
                      ),
                    ),
               ),
                 SizedBox(height: 15.0,) ,
                 Padding(padding: EdgeInsets.only(left:15.0),
                 child: Container(
                   padding: EdgeInsets.only(left:10.0),
                   decoration: BoxDecoration(
                     border: Border(left: BorderSide(
                       color: Colors.orange,
                       style: BorderStyle.solid,
                       width:3.0
                     ) )
                   ),
                child:   Row(children: <Widget>[
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                            Text('POPULAR RECIPES',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Timesroman',
                                      fontWeight: FontWeight.bold)),
                              Text('THIS WEEK',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Timesroman',
                                      fontWeight: FontWeight.bold)),
                         ],
                       )
                   ],)
                 ),
                 ),
                 Padding(padding: EdgeInsets.only(bottom:15.0)
                 ),
                 Container(
                   padding:EdgeInsets.only(top:15.0, left: 15.0),
                   height: 125.0,
                   child: ListView(
                     shrinkWrap:true,
                     scrollDirection: Axis.horizontal,
                     children: <Widget>[
                     foodCard(),
                       SizedBox(height: 10.0,),
                       foodCard(),
                       SizedBox(height: 10.0,),
                       foodCard(),
                       SizedBox(height: 10.0,)
                     ],
                   ),
                 )
                ],
              )
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15.0),
            child: Text('septemper 7',
            style: TextStyle(
              fontFamily: 'Quicksand',
              color: Colors.orange,
              fontSize: 14.0
            ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15.0),
            child: Text('TODAY',
            style: TextStyle(
              fontFamily: 'Timesnewroman',
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              fontSize: 30.0
            ),
            ),
          ),
          SizedBox(height: 10.0,),
          Stack(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 12.0,right: 12.0),
                child: Container(
                  height: 275.0,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: AssetImage('images/breakfast.jpg'),fit:BoxFit.cover )
                  ) ,
                 /* child: BackdropFilter(filter:ImageFilter.blur(sigmaX:1.5,sigmaY:1.5  ),
                  
                    child: Container(

                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),

                  ),*/

                ),
              ),

              Container(
                  padding: EdgeInsets.only(top: 150.0, left: 60.0),
                  child: Column(
                    children: <Widget>[
                      Text('BEST OF',
                        style: TextStyle(
                            fontFamily: 'Timesroman',
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('THE DAY',
                        style: TextStyle(
                            fontFamily: 'Timesroman',
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 3.0,
                        width: 50.0,
                        color: Colors.orange,
                      )
                    ],
                  )
              )
            ],
          )
        ],
      ),
    );
  }
  Widget foodCard(){
  return Container(height: 125.0,
    width:250.0 ,
    decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white
    ) ,
    child: Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(image: AssetImage('images/balanced.jpg'))
          ),
          height: 125.0,
          width: 100.0,
        ),
        SizedBox(
          width:20.0,   ),
        Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: <Widget>[
            Text('grilled chicken', style: TextStyle(fontFamily:'Quicksand' ),),
            Text('with fruit salad', style: TextStyle(fontFamily:'Quicksand' ),),
            SizedBox(height: 10.0,),
            Container(
              height: 2.0,
              width: 70.0,
              color: Colors.orange,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 25.0,
                  width: 25.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      image: DecorationImage(image: AssetImage('images/chris.jpg'))
                  ),
                ),
                SizedBox(width:10.0 ,),
                Text('james oliver', style: TextStyle(fontFamily: 'Quicksand'),)
              ],
            )


          ],
        )


      ],
    ),
  );
  }
}
