import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Device { euro, riels, dong }

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  Device? _selectedDevice;
  final TextEditingController _amountController = TextEditingController();
  String _convertedAmount = "";

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  //function to display text
  String deviceToString(Device device) {
    switch (device) {
      case Device.euro:
        return 'Euro';
      case Device.riels:
        return 'Riels';
      case Device.dong:
        return 'Dong';
    }
  }

  //function to convert from USD to other
  void convertCurrency() {
    if (_amountController.text.isEmpty || _selectedDevice == null) {
      setState(() {
        _convertedAmount = "Input invalid!";
      });
      return;
    }

    double? usdAmount = double.tryParse(_amountController.text);

    double convertValue;
    switch (_selectedDevice!) {
      case Device.euro:
        convertValue = usdAmount! * 0.95;
        break;
      case Device.riels:
        convertValue = usdAmount! * 4100;
        break;
      case Device.dong:
        convertValue = usdAmount! * 25405;
        break;
    }

    setState(() {
      _convertedAmount =
          "${convertValue.toStringAsFixed(2)} ${deviceToString(_selectedDevice!)}";
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

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
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),
          TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollar',
                  hintStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 30),
          DropdownButton(
            value: _selectedDevice,
            hint: const Text('Select a Device'),
            items: Device.values.map((Device device) {
              return DropdownMenuItem(
                value: device,
                child: Text(deviceToString(device)),
              );
            }).toList(),
            onChanged: (Device? newValue) {
              setState(() {
                _selectedDevice = newValue;
              });
            },
          ),
          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(_convertedAmount)),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                convertCurrency();
              },
              child: const Text("Convert")),
        ],
      )),
    );
  }
}
