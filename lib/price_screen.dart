import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'API_handler.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'INR';

  DropdownButton<String> androidDropDownButton(){

    List<DropdownMenuItem<String>> dropDownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }

    return DropdownButton<String>(
        value: selectedCurrency,
        items: dropDownItems,
        onChanged: (value)async{
          selectedCurrency = value;
          apiData calledDataB= apiData(cointype:'BTC',currency: '$selectedCurrency',firstLetter: 'B');
          apiData calledDataE= apiData(cointype:'ETH',currency: '$selectedCurrency',firstLetter: 'E');
          apiData calledDataL= apiData(cointype:'LTC',currency: '$selectedCurrency',firstLetter: 'L');
        String recievedDataB= await calledDataB.getData();
          String recievedDataE= await calledDataE.getData();
          String recievedDataL= await calledDataL.getData();
          setState((){
//            print(recievedData);
          });
        });
  }





  CupertinoPicker iOSPicker(){
    List<Widget> pickerItems = [];
    for (String currencyText in currenciesList) {
      var newItem = Text(
        '$currencyText',
        style: TextStyle(color: Colors.white),
      );
      pickerItems.add(newItem);
    }

  return CupertinoPicker(
  backgroundColor: Colors.lightBlue,
  itemExtent: 30,
  onSelectedItemChanged: (selectedIndex) {
  print(selectedIndex);
  },
  children: pickerItems,
  );
  }

  Widget getPicker(){
    if(Platform.isIOS){
      return iOSPicker();
    }
    else if(Platform.isAndroid){
      return androidDropDownButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $priceB $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $priceE $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $priceL $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: getPicker()),
        ],
      ),
    );
  }
}
