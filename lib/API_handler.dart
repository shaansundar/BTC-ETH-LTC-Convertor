import 'dart:convert';

import 'package:http/http.dart' as http;
const apiKey = '856A9E39-F64F-46BE-B7E9-74A76229555C';
const apiUrl = 'http://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=';
String priceB,priceE,priceL;
class apiData{
  apiData({this.currency,this.cointype,this.firstLetter});
  final String firstLetter;
  final String currency;
  final String cointype;
  Future<String> getData()async{
     http.Response response = await http.get('http://rest.coinapi.io/v1/exchangerate/$cointype/$currency?apikey=856A9E39-F64F-46BE-B7E9-74A76229555C');
//     print(response.statusCode);
    String decodedData=response.body;
    if(firstLetter=='B'){
    priceB = jsonDecode(decodedData)['rate'].toString();
//    print(priceB);
    return priceB;}
     if(firstLetter=='E'){
       priceE = jsonDecode(decodedData)['rate'].toString();
//       print(priceE);
       return priceE;}
     if(firstLetter=='L'){
       priceL = jsonDecode(decodedData)['rate'].toString();
//       print(priceL);
       return priceL;}
  }


}