// ignore_for_file: non_constant_identifier_names

import 'dart:convert';


import 'package:http/http.dart' as http;

import '../Model/WorldStateModel.dart';
import 'Utlites/App_url.dart';



class StatusServices{
  Future<WorldStateModel> FatchWorldStateAp() async{
    final response =await http.get(Uri.parse(App_Url.WorldStateAPi));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return WorldStateModel.fromJson(data);
    }else{
      return throw Exception("Error");
    }
}


Future<List<dynamic>> countriesgetapi() async{
    final response = await http.get(Uri.parse(App_Url.CountriesList));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return data;

    }else{
      return throw Exception("Error");
    }

}





}




