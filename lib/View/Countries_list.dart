
import 'package:covid_tracker/View/Detail_screen.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import '../Services/states_services.dart';



class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {

  // ignore: non_constant_identifier_names
  TextEditingController SearchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatusServices statusServices = StatusServices();
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("World States",style: TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),),
        backgroundColor: Colors.teal,
        elevation: 0,
       // actions: [
       //   CircleAvatar(child: Image.asset("assets/images/R.gif",color: Colors.teal,)),
       // ],
        ),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: SearchEditingController,
              onChanged: (value){
                setState(() {

                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white60,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: "Search With Countries Name",
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          Expanded(child: FutureBuilder(future:statusServices.countriesgetapi(),
              builder:(context ,  AsyncSnapshot<List<dynamic>> snapshot){
            if(!snapshot.hasData){
               return ListView.builder(
                   itemCount: 8,
                   itemBuilder: (context , index){
                     return Shimmer.fromColors(
                       baseColor:Colors.grey.shade700,
                       highlightColor: Colors.grey.shade700,
                       child: Column(children: [
                         ListTile(
                           leading:Container(height: 50,width: 50,color: Colors.white,),
                           title:Container(height: 10,width: 3,color: Colors.white,),
                           subtitle:Container(height: 8,width: 8,color: Colors.white,),
                           trailing: Container(height: 10,width: 3,color: Colors.white,),
                         ),
                       ],),
                     );
                   });
            }else{
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (context , index){
                  String name = snapshot.data![index]["country"];

                  if(SearchEditingController.text.isEmpty){
                    return SingleChildScrollView(
                      child: Column(children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                DetailScreen(
                                  test: snapshot.data![index]["tests"],
                                  image:snapshot.data![index]["countryInfo"]["flag"],
                                  name: snapshot.data![index]["country"],
                                  totalCases: snapshot.data![index]["cases"],
                                  totalDeaths: snapshot.data![index]["deaths"],
                                  totalRecovered: snapshot.data![index]["recovered"],
                                  active: snapshot.data![index]["active"],
                                  critical: snapshot.data![index]["critical"],
                                  todayRecovered: snapshot.data![index]["todayRecovered"],
                                ),
                            ));
                          },
                          child: ListTile(
                            leading:Image(
                              image: NetworkImage(snapshot.data![index]["countryInfo"]["flag"]),height: 50,width: 50,),
                            title: Text(snapshot.data![index]["country"],style: const TextStyle(
                              color: Colors.white,
                            ),),
                            subtitle:Text(snapshot.data![index]["cases"].toString(),style: const TextStyle(
                              color: Colors.white,
                            ),),
                            trailing: Text(snapshot.data![index]["continent"].toString(),style: const TextStyle(
                              fontSize:8,
                            ),),
                          ),
                        ),

                      ],),
                    );
                  }else if(name.toLowerCase().contains(SearchEditingController.text.toLowerCase())){
                    return SingleChildScrollView(
                      child: Column(children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                DetailScreen(
                                  test: snapshot.data![index]["tests"],
                                  image:snapshot.data![index]["countryInfo"]["flag"],
                                  name: snapshot.data![index]["country"],
                                  totalCases: snapshot.data![index]["cases"],
                                  totalDeaths: snapshot.data![index]["deaths"],
                                  totalRecovered: snapshot.data![index]["recovered"],
                                  active: snapshot.data![index]["active"],
                                  critical: snapshot.data![index]["critical"],
                                  todayRecovered: snapshot.data![index]["todayRecovered"],
                                ),
                            ));
                          },
                          child: ListTile(
                            leading:Image(
                              image: NetworkImage(snapshot.data![index]["countryInfo"]["flag"]),height: 50,width: 50,),
                            title: Text(snapshot.data![index]["country"],style: const TextStyle(
                              color: Colors.white,
                            ),),
                            subtitle:Text(snapshot.data![index]["cases"].toString(),style: const TextStyle(
                              color: Colors.white,
                            ),),
                            trailing: Text(snapshot.data![index]["continent"].toString(),style: const TextStyle(
                              fontSize:8,
                            ),),
                          ),
                        ),

                      ],),
                    );
                  }else{
                    return Container();
                  }

              });
            }

          }),),
        ],),
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