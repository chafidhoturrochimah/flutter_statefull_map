import 'package:flutter/material.dart';
import 'Input.dart';
import 'Convert.dart';
import 'Result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //controller
  TextEditingController etInput = new TextEditingController();

  //variabel berubah
  double _inputUser = 0;

  //mengeset nilai pada dropdown
  String _newValue = "Kelvin";
  double _result = 0;

  //buat list
  var listItem = {"Kelvin", "Reamur"};

  //Fungsi perhitungan suhu perlu untuk diubah sehingga hanya memproses konversi sesuai
  //dengan pilihan pengguna.
  void konversiSuhu() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else
        _result = (4 / 5) * _inputUser;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Konverter Suhu"),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Input(etInput: etInput),
                //ubah DropdownButton
                DropdownButton<String>(
                  items: listItem.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  // isi value dengan variabel _newValue.
                  value: _newValue,
                  onChanged: dropdownOnChanged,
                ),
                Result(result: _result,),
                Convert(
                  konvertHandler: konversiSuhu,
                ),
              ],
            ),
          ),
        ));
  }
  
  //method dropdownOnChanged pada parameter value untuk mengubah pilihan pada dropdown.
  void dropdownOnChanged(String changeValue) {
    _newValue = changeValue;
  }
}
