import 'package:flutter/material.dart';
//import 'package:http/http.dart';
// import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // you need to add cast to Map
    data =  data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background image
    String bgImage = data['isDayTime'] ? 'day.png': 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration( //read doc for detail
            image: DecorationImage(
              image:AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () async {
                      // Navigator.pushNamed(context, '/location');
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location':result['location'],
                          'isDayTime':result['isDayTime'],
                          'flag' : result['flag']
                        };
                      });
                      },
                    icon: Icon(
                        Icons.edit_location,
                        color:Colors.grey[300]
                    ),

                    label: Text(
                        'Edit Location',
                        style: TextStyle(
                            color: Colors.grey[300]
                        ),
                    )
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                          color: Colors.grey[300]
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 42.0,
                      color: Colors.grey[300]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}