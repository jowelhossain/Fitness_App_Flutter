import 'dart:convert';

import 'package:fitness_app/model/fitness_model.dart';
import 'package:fitness_app/screen/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  var url= "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR2dcq-xBH13wH4pKR7VYlEy3NMWcU9cL5ySVNtCyvY9YiTNNQI54x-kT-M";
  FitnessModel? fitnessModel;

  List<FitnessModel>itemList=[];

  fetchFitnessData() async {

var response= await http.get(Uri.parse("https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR2dcq-xBH13wH4pKR7VYlEy3NMWcU9cL5ySVNtCyvY9YiTNNQI54x-kT-M"));

var data = jsonDecode(response.body);

print("${data}");

for(var i in data["exercises"]){
  fitnessModel= FitnessModel(id: i['id'], title:i['title'], thumbnail:i['thumbnail'], gif:i['gif']);

  itemList.add(fitnessModel!);
}
print("totla lenth is .........${itemList.length}");
setState(() {

});

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchFitnessData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        width:double.infinity,
        child: ListView.builder(itemBuilder: (context, index){

          return InkWell(

            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Details_Page(
                fitnessModel:itemList[index],
              )));
            },
            child: Container(
              height:MediaQuery.of(context).size.height*.25,
             padding: EdgeInsets.all(5),
             margin: EdgeInsets.only(bottom: 5),
             child: Stack(
               children: [
                 ClipRRect(
                   child:Image.network("${itemList[index].thumbnail}", fit: BoxFit.cover,width: double.infinity,),
                   borderRadius: BorderRadius.circular(20),
                 ),

                 Positioned(
                   left: 0,
                     right: 0,
                     bottom: 0,
                     child: Container(


                       padding: EdgeInsets.only(top: 20,left: 10),
                     child: Text("${itemList[index].title}", style: TextStyle(color: Colors.white, fontSize: 20)),
                   height: 60,


                   decoration: BoxDecoration(

                     borderRadius: BorderRadius.circular(10),
                     gradient: LinearGradient(
                       begin: Alignment.bottomCenter,
                       end: Alignment.topCenter,
                       colors: [

                         Colors.black,
                         Colors.black54,
                         Colors.black45,
                         Colors.black38,
                         Colors.black12,
                         Colors.transparent
                       ]

                     )
                   ),
                 )),

               ],
             ),

            ),
          );

        },
        itemCount: itemList.length,
          shrinkWrap: true,
        ),




      ),
    );
  }
}
