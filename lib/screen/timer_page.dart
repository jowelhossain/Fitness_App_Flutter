import 'dart:async';

import 'package:fitness_app/model/fitness_model.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
   TimerPage({Key? key, this.second,this.fitnessModel}) : super(key: key);

 FitnessModel? fitnessModel;
 int? second;

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  int startTime=0;
  @override
  void initState(){
    // TODO: implement initState
    print("our time issssssssssss${widget.second}");
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(timer.tick-1==widget.second){
        print("done");
        timer.cancel();
        Navigator.of(context).pop();

      }else{
        setState(() {
          startTime=timer.tick;
        });

      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        width: double.infinity,
        height: MediaQuery.of(context).size.height*.5,
        child: Column(children: [
          Image.network("${widget.fitnessModel!.gif}",height: MediaQuery.of(context).size.height*.3,),

          Text("$startTime",style: TextStyle(color: Colors.red, fontSize: 30),),



        ],),



      ),
    );
  }
}
