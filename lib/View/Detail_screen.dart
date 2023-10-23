// ignore_for_file: non_constant_identifier_names

import 'package:covid_tracker/Routring/route_name.dart';
import 'package:covid_tracker/View/World_state_Sreeen.dart';
import 'package:flutter/material.dart';





class DetailScreen extends StatefulWidget {
  String image;
  String name;
  int totalCases,totalDeaths,totalRecovered,active,critical,todayRecovered,test;
   DetailScreen({super.key,
     required this.test,
  required this.image,
  required this.name,
  required this.totalCases,
  required this.totalDeaths,
  required this.totalRecovered,
  required this.active,
  required this.critical,
  required this.todayRecovered,



});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(widget.name),
          centerTitle: true,
        ),
        body:SingleChildScrollView(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Card(
                  shadowColor: Colors.red,
                  elevation: 6.0,
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(widget.image)),
                    title: Text(widget.name),
                    subtitle:Text("Test :  ${widget.test}"),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding:EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.01),
                    child: Card(
                      child: Column(
                        children: [
                          const SizedBox(height: 8,),
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(widget.image),

                          ),
                          const SizedBox(height: 20,),
                          ReuseableRow(tittle: "Total",textstyle: const TextStyle(color: Colors.teal ,fontSize: 15,fontWeight:FontWeight.bold),value:widget.totalCases.toString()),
                          ReuseableRow(tittle: "Deaths",textstyle: const TextStyle(color: Colors.red ,fontSize: 15,fontWeight:FontWeight.bold),value:widget.totalDeaths.toString()),
                          ReuseableRow(tittle: "Recovered", textstyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight:FontWeight.bold),value:widget.totalRecovered.toString()),
                          ReuseableRow(tittle: "Active",textstyle: const TextStyle(color: Colors.blue,fontSize: 15,fontWeight:FontWeight.bold),value:widget.active.toString()),
                          ReuseableRow(tittle: "Critical", textstyle: const TextStyle(color: Colors.red ,fontSize: 15,fontWeight:FontWeight.bold),value:widget.critical.toString()),
                          ReuseableRow(tittle: "Today Deaths",textstyle: const TextStyle(color: Colors.deepPurpleAccent,fontSize: 15,fontWeight:FontWeight.bold), value:widget.totalDeaths.toString()),
                          ReuseableRow(tittle: "Today Recovered",textstyle: const TextStyle(color: Colors.purple,fontSize: 15,fontWeight:FontWeight.bold), value:widget.todayRecovered.toString()),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RouteName.countriesList);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.99,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.teal,
                    ),
                    child: const Center(child: Text("Back",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


