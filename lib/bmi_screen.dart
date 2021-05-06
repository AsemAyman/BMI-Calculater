
import 'dart:math';

import 'package:bmi/bmi_results_screen.dart';
import 'package:flutter/material.dart';


class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}
const kActiveCardColor = Color(0xFF1D1E33);
const kInActiveCardColor  = Color(0xFF111328);

class _BmiScreenState extends State<BmiScreen> {
  bool activeMale=true;
  bool activeFemale=false;
  double height=180;
  int wieght=40;
  int age=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(onTap: (){
                    setState(() {
                         activeMale=!activeMale;
                         activeFemale=!activeFemale;
                         print(activeMale);

                    });
                  },child: buildMaleFemale( text: 'MALE',imgPath: 'assets/images/male.png',color:activeMale?kActiveCardColor:kInActiveCardColor)),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child:
                        GestureDetector(onTap: (){
                          setState(() {
                            activeMale=!activeMale;
                            activeFemale=!activeFemale;
                          });
                        },child: buildMaleFemale( text: 'FEMALE',imgPath: 'assets/images/female.png',color:activeFemale?kActiveCardColor:kInActiveCardColor))),
              ],
            ),
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: kActiveCardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0,color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w900,color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'cm',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.white),
                        )
                      ],
                    ),
                    Slider(
                        value: height,
                        max: 220.0,
                        min: 80.0,
                        activeColor: Colors.tealAccent,
                        onChanged: (value) {
                          setState(() {
                            height=value;
                          });
                        }),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
            children: [
                buildWheightAge("AGE"),
                SizedBox(width: 20),
              buildWheightAge("WHEITE"),

            ],
          ),
              )),
          Container(
            width: double.infinity,
            color: Colors.tealAccent,
            child: MaterialButton(
              onPressed:(){
                var result=wieght/pow(height/100, 2);
                Navigator.push(context,MaterialPageRoute(builder: (context){return BMIResultScreen(result: result.round(),) ;}));
               } ,
              child: Text(
                'CALCULATE',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildWheightAge(title,) {

    return Expanded(
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: kActiveCardColor,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0,color: Colors.white),
                        ),
                        Text(
                          title=="AGE"?'$age':'$wieght',
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900,color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: '$title  -',
                              backgroundColor: Colors.tealAccent,
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  title=="AGE"?age--:wieght--;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              heroTag: '$title +',
                              backgroundColor: Colors.tealAccent,
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  title=="AGE"?age++:wieght++;
                                });
                              },
                              child: Icon(Icons.add,),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
  }

  Widget buildMaleFemale({ @required text,@required imgPath,@required color}) {
    return Container(
      decoration: BoxDecoration(
        color:  color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(imgPath),height: 90,width: 90,),
          SizedBox(
            height: 15,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ],
      ),
    );
  }
}
