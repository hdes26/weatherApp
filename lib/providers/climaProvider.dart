import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_clima/pages/clima.dart';

class ClimaProvider{
  
  
  getAll(String ciudad) async{
      final url = 'http://api.openweathermap.org/data/2.5/weather?q='+ciudad+'&APPID=6f8a989383eff21b0a42e0f21bc2f2c0'; 
    final response = await http.post(Uri.parse(url));
    final decodeData = json.decode(response.body);
    return decodeData;
  }  

}