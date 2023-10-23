import 'dart:async';


import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../Model/WorldStateModel.dart';
import '../Routring/route_name.dart';
import '../Services/states_services.dart';

class WorldstateScreen extends StatefulWidget {
  const WorldstateScreen({super.key});

  @override
  State<WorldstateScreen> createState() => _WorldstateScreenState();
}

class _WorldstateScreenState extends State<WorldstateScreen> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
     // super.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    StatusServices statusServices = StatusServices();

    return Scaffold(
      backgroundColor: Colors.teal,
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top:50,),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height:MediaQuery.of(context).size.height * .01,),
                FutureBuilder(
                    future: statusServices.FatchWorldStateAp(),
                    builder:(context ,AsyncSnapshot<WorldStateModel>snapshot){
                      if(!snapshot.hasData){
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 300,),
                            Center(
                              child: Image(image: AssetImage("assets/images/R.gif"),height: 50,width: 50,),
                            ),
                            SizedBox(height: 15,),
                            Text("L o a d i n g",style: TextStyle(fontSize:16),),
                          ],
                        );
                      }else{
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                            PieChart(dataMap: {
                              "Total" :double.parse(snapshot.data!.cases.toString(),),
                              "Discover":double.parse(snapshot.data!.recovered.toString()),
                              "Death" :double.parse(snapshot.data!.deaths.toString()),

                            },

                              chartValuesOptions:const ChartValuesOptions(
                                showChartValuesInPercentage: true,
                                showChartValueBackground: true,
                                showChartValues: true,
                                showChartValuesOutside: true,
                              ),
                              animationDuration: const Duration(milliseconds: 1200),
                              chartType: ChartType.ring,
                              chartRadius: MediaQuery.of(context).size.width / 3.2,
                              legendOptions: const LegendOptions(legendPosition: LegendPosition.left),
                              baseChartColor: Colors.white,

                              // colorList: [
                              //   Colors.green,
                              //   Colors.blue,
                              //   Colors.red,
                              // ],

                            ),
                              SizedBox(height: MediaQuery.of(context).size.height * .04,),
                              Card(
                                elevation: 6.4,
                                shadowColor: Colors.greenAccent,
                                child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ReuseableRow(tittle: "Total",textstyle: const TextStyle(color: Colors.teal ,fontSize: 15,fontWeight:FontWeight.bold),value:snapshot.data!.cases.toString()),
                                    ReuseableRow(tittle: "Deaths",textstyle: const TextStyle(color: Colors.red ,fontSize: 15,fontWeight:FontWeight.bold),value:snapshot.data!.deaths.toString()),
                                    ReuseableRow(tittle: "Recovered", textstyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight:FontWeight.bold),value:snapshot.data!.recovered.toString()),
                                    ReuseableRow(tittle: "Active",textstyle: const TextStyle(color: Colors.blue,fontSize: 15,fontWeight:FontWeight.bold),value:snapshot.data!.active.toString()),
                                    ReuseableRow(tittle: "Critical", textstyle: const TextStyle(color: Colors.red ,fontSize: 15,fontWeight:FontWeight.bold),value:snapshot.data!.critical.toString()),
                                    ReuseableRow(tittle: "Today Deaths",textstyle: const TextStyle(color: Colors.deepPurpleAccent,fontSize: 15,fontWeight:FontWeight.bold), value:snapshot.data!.todayCases.toString()),
                                    ReuseableRow(tittle: "Today Recovered",textstyle: const TextStyle(color: Colors.purple,fontSize: 15,fontWeight:FontWeight.bold), value:snapshot.data!.todayDeaths.toString()),
                                  ],
                                ),
                              ),),
                              SizedBox(height: MediaQuery.of(context).size.height * .04,),

                              InkWell(
                                child: Container(
                                  height:50,
                                  width: MediaQuery.of(context).size.width * 04,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black,
                                  ),
                                  child: const Center(
                                    child: Text("Track Countries",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),),
                                  ),
                                ),
                                onTap: (){
                                  Navigator.pushNamed(context, RouteName.countriesList);
                                },
                              ),
                          ],),
                        );
                      }

                }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


// ignore: must_be_immutable
class ReuseableRow extends StatelessWidget {
  var textstyle = TextStyle(color: Colors.green,);
  String tittle, value ;
     // ignore: non_constant_identifier_names
      ReuseableRow({super.key,required this.tittle , required this.value, required this.textstyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 20),
      child: Column(
        children: [
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tittle,style:textstyle,),
              Text(value),
            ],
          ),
        ],
      ),
    );
  }
}
