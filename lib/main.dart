import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  String _infoText = "Informe seus dados";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void reset() {
    _pesoController.text = "";
    _alturaController.text = "";
    setState(() {
      _infoText = "Informe seus dados";
    });
  }

  void calcIMC() {
    setState(() {
      double peso = double.parse(_pesoController.text);
      double altura = double.parse(_alturaController.text) / 100;
      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        _infoText = "Você esta abaixo do peso, seu IMC é ${imc.toStringAsPrecision(3)}";
      }
      else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Parabéns você esta no peso ideal, seu IMC é ${imc.toStringAsPrecision(3)}";
      }
      else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Hm... você está levemente acima do peso, seu IMC é ${imc.toStringAsPrecision(3)}";
      }
      else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Ai ficou ruim, você está com Obesidade Grau I, seu IMC é ${imc.toStringAsPrecision(3)}";
      }
      else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Ai ficou ruim, você está com Obesidade Grau II, seu IMC é ${imc.toStringAsPrecision(3)}";
      }
      else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Ai ficou ruim, você está com Obesidade Grau III, seu IMC é ${imc.toStringAsPrecision(3)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          actions: [IconButton(icon: Icon(Icons.refresh), onPressed: reset)],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: Form(
              key: _formKey,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.person_outline,
                      size: 120.0, color: Colors.redAccent),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Insira sem peso (em kg)",
                        labelStyle: TextStyle(color: Colors.redAccent)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.redAccent, fontSize: 20.0),
                    controller: _pesoController,
                    validator: (value) {
                      if(value.isEmpty) {
                          return "Insira seu peso";
                        }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Insira sua altura (em centímetros)",
                        labelStyle: TextStyle(color: Colors.redAccent)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.redAccent, fontSize: 20.0),
                    controller: _alturaController,
                      validator: (value) {
                        if(value.isEmpty) {
                          return "Insira seu peso";
                        }
                      }
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Container(
                        height: 50.0,
                        child: RaisedButton(
                            child: Text("Calcular",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25.0)),
                            color: Colors.redAccent,
                            onPressed: () {
                              if(_formKey.currentState.validate()) {
                                calcIMC();
                              }
                            } ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(_infoText,
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 18.0, color: Colors.redAccent)),
                  )
                ],
              )
            )
        ));
  }
}
