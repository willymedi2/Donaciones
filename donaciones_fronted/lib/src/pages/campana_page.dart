import 'package:flutter/material.dart';
//import 'package:line_awesome_icons/line_awesome_icons.dart';

class CampanaPage extends StatefulWidget {
  @override
  _CampanaPageState createState() => _CampanaPageState();
}

class _CampanaPageState extends State<CampanaPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Image(
            alignment: Alignment.topCenter,
            image: AssetImage("images/charity.png"),
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          Positioned(
            top: 40,
            left: 30,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text(
                  "Campañas",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontFamily: 'CentraleSansRegular'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Ultimas Campañas",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontFamily: 'CentraleSansRegular',
                            fontWeight: FontWeight.w100))
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 110),
            height: 300,
            width: 450,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                //Aqui deberian ir las fotos de las campanias
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 370),
            height: 400,
            width: 400,
            child: ListView(
              children: <Widget>[
                //aqui irian todas las campanias y los filtros de las mismas
              ],
            ),
          )
        ],
      ),
    );
  }
}
