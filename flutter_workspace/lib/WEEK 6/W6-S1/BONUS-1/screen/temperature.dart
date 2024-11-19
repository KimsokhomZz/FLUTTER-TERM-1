import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  //use TextEditingController
  final TextEditingController _inputController = TextEditingController();
  String _result = '';

  void convertTemperature() {
    //get input
    String input = _inputController.text;

    //convert input to double
    double? celsius = double.tryParse(input);

    if (celsius != null) {
      //conversion
      double fahrenheit = (celsius * 9 / 5) + 32;

      //rebuild to display result
      setState(() {
        _result = '${fahrenheit.toStringAsFixed(2)} °F';
      });
    } else {
      setState(() {
        _result = 'Your input is invalid!';
      });
    }
  }

  @override
  void dispose() {
    _inputController.dispose(); // Dispose the input to avoid memory leaks
    super.dispose();
  }

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final InputDecoration inputDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      hintText: 'Enter a temperature',
      hintStyle: const TextStyle(color: Colors.white));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.thermostat_outlined,
            size: 120,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 45),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Temperature in Degrees:"),
          const SizedBox(height: 10),
          TextField(
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 30),
          TextButton(
              onPressed: convertTemperature, child: const Text('Convert')),
          const SizedBox(height: 30),
          const Text("Temperature in Fahrenheit:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(_result))
        ],
      )),
    );
  }
}
