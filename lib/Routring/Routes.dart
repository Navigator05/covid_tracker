import 'package:flutter/material.dart';
import '../View/Countries_list.dart';
import '../View/Splash_Screen.dart';
import '../View/World_state_Sreeen.dart';
import 'route_name.dart';

class Routes {
  static Route<dynamic>generateRoute(
    RouteSettings settings){
    switch(settings.name){
      case RouteName.splash_Screen:
     return  MaterialPageRoute(builder: (context)=> const Splash_Screen());
      case RouteName.WorldStateScreen:
        return  MaterialPageRoute(builder: (context)=> const WorldstateScreen());
      case RouteName.countriesList:
        return  MaterialPageRoute(builder: (context)=> const CountriesList() );
        // case RouteName.signup_screeen:
        // return  MaterialPageRoute(builder: (context)=> const Signup_screeen() );
      default :
        return  MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Column(
              children: [
                Text("Opps Your Goging an Other Side"),
              ],
            ),
          );
        });
    }
  }
}
// flutter pub add http