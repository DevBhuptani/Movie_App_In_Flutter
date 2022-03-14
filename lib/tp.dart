import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainCard(),
    );
  }
}

class MainCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[            
         
            TransactionSlider(),
           
          ],
        ),
      ),
    );
  }
}

double transLimit = 0.0;

class TransactionSlider extends StatefulWidget {
  @override
  _TransactionSliderState createState() => _TransactionSliderState();
}

class _TransactionSliderState extends State<TransactionSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.blue,
            inactiveTrackColor: Colors.grey.withOpacity(0.25),
            trackHeight: 10,
            thumbColor: Colors.white,
          ),
          child: Slider(
            value: transLimit,
            min: 0.0,
            max: 1.0,
            onChanged: (limitInput){
              setState(() {
                transLimit = limitInput;
              });
            },
          ),
        )
      ],
    );
  }
}

