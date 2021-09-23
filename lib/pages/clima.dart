import 'package:app_clima/providers/climaProvider.dart';
import 'package:flutter/material.dart';

class Clima extends StatefulWidget {
  Clima({Key? key}) : super(key: key);

  @override
  _ClimaState createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {
  String ciudad = '';
  var clima;
  var temperatura;
  var sensacion;
  var _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.srgbToLinearGamma())),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ciudad(),
              _grados(),
              _feelslike(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _estado(),
                ],
              ),
              _inputs(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _button(ciudad, clima, temperatura),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  submit() async {
    var climaProvider = await ClimaProvider().getAll(_textController.text);
    ciudad = climaProvider['name'];
    clima = climaProvider['weather'][0]['main'];

    var operacion = (climaProvider['main']['temp'] - 273.15).toString();
    temperatura = double.parse(operacion).toStringAsFixed(1).toString();



    var operacionsensacion = (climaProvider['main']['feels_like'] - 273.15).toString();
    sensacion = double.parse(operacionsensacion).toStringAsFixed(1).toString();

    setState(() {});
    print(ciudad);
    print(clima);
    print(operacion);
  }

  Widget _ciudad() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30, 0, 10),
      child: Text(
        ciudad,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  Widget _grados() {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: Text(
          temperatura == null ? '' : temperatura.toString() + '°',
          style: TextStyle(color: Colors.white, fontSize: 80),
        ));
  }

  Widget _feelslike() {
    return Container(
        child: Row(
      children: [
        Text(
          "Feels like",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            sensacion == null ? '' : sensacion.toString() + '°',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    ));
  }

  Widget _estado() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      color: Colors.transparent,
      child: Row(
        children: [
          Text(
            clima,
            style: TextStyle(color: Colors.white, fontSize: 21),
          )
        ],
      ),
    );
  }

  Widget _inputs() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: TextFormField(
        controller: _textController,
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget _button(ciudad, clima, temperatura) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
      width: 100,
      child: TextButton(
          child: Text('Enviar'),
          style: TextButton.styleFrom(
              primary: Colors.white,
              shadowColor: Colors.purple,
              elevation: 7,
              backgroundColor: Colors.lightGreen),
          onPressed: () => submit()),
    );
  }
}
