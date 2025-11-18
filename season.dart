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
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Season",
            style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),

        body: Padding(padding: EdgeInsets.only(bottom:100  ),
        
       child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center ,
          
          children: [
            SeasonCard(countryName: "FRENCH", startSeason: Season.winter),
            SizedBox(width: 180,),
            SeasonCard(countryName: "CAMBODIA", startSeason: Season.winter),
          ],
        ),),
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


  Season currentSeason = Season.winter;
 

  void changeSeason() {
    setState(() {
      int nextIndex = (currentSeason.index + 1) % Season.values.length;
      currentSeason = Season.values[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     
      margin: EdgeInsetsDirectional.only(top:180),
      width: 250,
      height: 700,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey, width: 3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Expanded(
            child: GestureDetector(
              onTap: changeSeason,
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  seasonImage[currentSeason.index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Divider(color: Colors.grey, thickness: 3, height: 0),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              widget.countryName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
