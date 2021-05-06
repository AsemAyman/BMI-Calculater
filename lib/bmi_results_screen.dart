import 'package:flutter/material.dart';
class BMIResultScreen extends StatelessWidget {
  final result;


  const BMIResultScreen({@required this.result}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Result: $result',style: TextStyle(fontSize:25 ,fontWeight: FontWeight.bold,color: Colors.white),),

          ],
        ),
      ),
    );
  }
}
