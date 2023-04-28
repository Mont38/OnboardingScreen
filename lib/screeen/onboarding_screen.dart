import 'package:app1/screeen/card_data.dart';
import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:lottie/lottie.dart';

class OnboardinsScreen extends StatelessWidget {

  
  OnboardinsScreen({super.key});
  final controller = PageController();
  final data = [
    CardData(
        title: "INSTITUTO TECNOLOGICO NACIONAL DE MEXICO",
        description: "Something ",
        image: AssetImage("assets/logo itc.png"),
        backgroundColor: Color.fromARGB(255, 29, 18, 13),
        titleColor: Color.fromARGB(255, 174, 132, 117),
        descriptionColor: Color.fromARGB(255, 247, 122, 122),
        background: LottieBuilder.asset('assets/background.json')),
    CardData(
        title: "IT",
        description: "Something",
        image: AssetImage("assets/tics.gif"),
        backgroundColor: Color.fromARGB(255, 36, 34, 90),
        titleColor: Color.fromARGB(255, 174, 132, 117),
        descriptionColor: Color.fromARGB(255, 247, 122, 122),
        background: LottieBuilder.asset('assets/background.json')),
    CardData(
        title: "ITC",
        description: "INSTALATION",
        image: AssetImage("assets/ajustes.gif"),
        backgroundColor: Color.fromARGB(255, 72, 122, 64),
        titleColor: Color.fromARGB(255, 174, 132, 117),
        descriptionColor: Color.fromARGB(255, 247, 122, 122),
        background: LottieBuilder.asset('assets/background.json')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        itemCount: data.length,

        colors: data.map((e) => e.backgroundColor).toList(),
        itemBuilder: (int index) {
         
   
          return CardDatas(data: data[index]);
        } 
     
      ),
    );
  }
}

