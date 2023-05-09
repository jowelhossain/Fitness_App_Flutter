import 'package:fitness_app/model/fitness_model.dart';
import 'package:fitness_app/screen/timer_page.dart';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


class Details_Page extends StatefulWidget {
  Details_Page({Key? key, this.fitnessModel}) : super(key: key);
FitnessModel ? fitnessModel;
  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page> {
double second=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        width: double.infinity,
        child: Stack(
          children: [

            Image.network("${widget.fitnessModel!.thumbnail}", fit: BoxFit.cover,height: double.infinity,),

            Positioned(
              left: 0,right: 0,
              bottom: 40,
              child:Column(
                children: [
                  SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(progressBarWidth: 10)),
                  min: 0,
                  max: 20,
                  initialValue: 10,
                    

                    onChange: (double value) {
                    
                    setState(() {
                      second=value;
                    });
                      // callback providing a value while its being changed (with a pan gesture)
                    },
                    onChangeStart: (double startValue) {
                      // callback providing a starting value (when a pan gesture starts)
                    },
                    onChangeEnd: (double endValue) {
                      // ucallback providing an ending value (when a pan gesture ends)
                    },
                    innerWidget: (double value) {
                    return Center(child: Text("${value.toStringAsFixed(0)}", style: TextStyle(color: Colors.orange, fontSize: 35) ,));
                      // use your custom widget inside the slider (gets a slider value from the callback)
                    }
            ),

                  ElevatedButton(onPressed:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                        TimerPage(
                          fitnessModel: widget.fitnessModel,
                          second: second.toInt(),
                        )
                    ));


                  }, child: Text('Count', style: TextStyle(fontSize: 20),),)
                ],
              )



              )
          ],
        ),
      ),
    );
  }
}
