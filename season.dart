import 'package:flutter/material.dart';

enum Season { winter, sprint, summer, fall }

const String winterImage = '../assets/winter.PNG';
const String summerImage = '../assets/summer.PNG';
const String sprintImage = '../assets/sprint.PNG';
const String fallImage = '../assets/fall.PNG';

const List<String> seasonImage = [
  winterImage,
  sprintImage,
  summerImage,
  fallImage,
];

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Season"), backgroundColor: Colors.white),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SeasonCard(countryName: "French",startSeason: Season.winter,),
          SizedBox(width: 100,),
          SeasonCard(countryName: "Cambodia",startSeason: Season.winter,),
        ],
        
      ),
      ),
  
     
    ),
  );
}

class SeasonCard extends StatefulWidget {
  const SeasonCard({
    super.key,
    required this.countryName,
    required this.startSeason,
  });

  final String countryName;
  final Season startSeason;

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  // Season currentSeason = Season.winter;

  Season currentSeason = Season.winter;
  // String countryName;

  void changeSeason() {
    setState(() {
      int nextIndex = (currentSeason.index + 1) % Season.values.length;
      currentSeason = Season.values[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          GestureDetector(
            onTap: changeSeason,
            child: Image.asset(seasonImage[currentSeason.index], width: 200),
          ),
        
         Text(
          widget.countryName, style: TextStyle(color: Colors.black,fontSize: 32),
        ),
        ],
      ),
    );
  }
}
