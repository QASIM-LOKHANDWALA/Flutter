import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorView extends StatefulWidget {
  CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  num x = 0;
  num y = 0;
  num z = 0;

  late AppLifecycleListener _listner;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState(){
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

    _listner = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onDetach: _onDetach,
      onResume: _onResume,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
    );
  }

  void _onShow() => print("onShow Called");
  void _onHide() => print("onHide Called");
  void _onDetach() => print("onDetach Called");
  void _onResume() => print("onResume Called");
  void _onInactive() => print("onInactive Called");
  void _onPause() => print("onPause Called");
  void _onRestart() => print("onRestart Called");
  void _onStateChange(AppLifecycleState state) => print("onStateChange Called With State: ${state}");

  @override
  void dispose() {
    super.dispose();
    displayOneController.dispose();
    displayTwoController.dispose();
    _listner.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Display(
            key: Key("TextField One"),
            hint: "Enter First Number",
            controller: displayOneController,
          ),
          const SizedBox(
            height: 15,
          ),
          Display(
            key: Key("TextField Two"),
            hint: "Enter Second Number",
            controller: displayTwoController,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            key: Key("Result"),
            z.toString(),
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    z = num.tryParse(displayOneController.text)!+num.tryParse(displayTwoController.text)!;
                  });
                },
                foregroundColor: Colors.white,
                backgroundColor: Colors.amber.shade800,
                shape: const StadiumBorder(),
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    z = num.tryParse(displayOneController.text)!-num.tryParse(displayTwoController.text)!;
                  });
                },
                foregroundColor: Colors.white,
                backgroundColor: Colors.amber.shade800,
                shape: const StadiumBorder(),
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    z = num.tryParse(displayOneController.text)!*num.tryParse(displayTwoController.text)!;
                  });
                },
                foregroundColor: Colors.white,
                backgroundColor: Colors.amber.shade800,
                shape: const StadiumBorder(),
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    z = num.tryParse(displayOneController.text)!/num.tryParse(displayTwoController.text)!;
                  });
                },
                foregroundColor: Colors.white,
                backgroundColor: Colors.amber.shade800,
                shape: const StadiumBorder(),
                child: const Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                displayOneController.clear();
                displayTwoController.clear();
              });
            },
            child: Card(
              elevation: 5,
              color: Colors.amber.shade900,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "Clear",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Display extends StatelessWidget {
  const Display({
    super.key,
    this.hint = "Enter a number",
    required this.controller
  });

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 3.0,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 3.0,
              color: Colors.amber.shade700,
            ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
