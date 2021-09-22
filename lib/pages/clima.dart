import 'package:flutter/material.dart';

class Clima extends StatefulWidget {
  Clima({Key? key}) : super(key: key);

  @override
  _ClimaState createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover, colorFilter: ColorFilter.srgbToLinearGamma())),
        child: ListView(
          children: [
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Row(
                children: [
                  Text(
                    'Despejado',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _clima(){
  
}
