import 'package:flutter/material.dart';

void main() => runApp(MiApp()); // llama al primer widget que se ejecutará

/*
void main() {
    runApp(MiApp);
}*/

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // es el estilo de la app
      title: "Primera App", // nombre de la app
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Inicio> {
  TextEditingController controlador = TextEditingController();
  String resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cajas de texto"),
      ),
      body: Column(
        children: [
          espacio(),
          Row(children: [Text("Introducir dato "), cajaTexto()]),
          espacio(),
          botonCuadrado(),
          espacio(),
          Text("$resultado"),
        ],
      ),
    );
  }

  Widget cajaTexto() {
    return Container(
        width: 200.0,
        child: TextField(
          controller: controlador,
          autofocus: true,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.send,
          // icono del botón
          autocorrect: true,
          textAlign: TextAlign.center,
          maxLength: 20,
          obscureText: false,
          // passowrd
          style: TextStyle(color: Colors.red),
          decoration: InputDecoration(
            //icon: Icon(Icons.three_g_mobiledata_outlined),
            prefixIcon: Icon(Icons.three_g_mobiledata_outlined),
            //prefixIcon: CircularProgressIndicator(),
            hintText: "Introducir",
            hintStyle: TextStyle(color: Colors.green),
            helperText: "Introducir datos",
          ),
        )
    );
  }

  Widget botonCuadrado() {
    return ElevatedButton(
      onPressed: () {
        print("Pulsado");
        print(controlador.text);
        setState(() {
          var calculo = int.parse(controlador.text) * 2;
          resultado = calculo.toString();
        });
      },
      style: ButtonStyle(
          maximumSize: MaterialStateProperty.all(const Size(200.0, 100.0))),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Icon(
              Icons.audiotrack,
              size: 10,
            ),
            Text("Pulsar")
          ])),
    );
  }

  Widget espacio() {
    return Container(
      height: 10,
    );
  }
}
