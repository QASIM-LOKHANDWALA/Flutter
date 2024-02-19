import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  num x = 0;
  num y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState(){
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Display(hint: "Enter First Number",controller: displayOneController),
          const SizedBox(
            height: 15,
          ),
          Display(hint: "Enter Second Number",controller: displayTwoController,),
          const SizedBox(
            height: 15,
          ),
          Text(z.toString(),style: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),),
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
                  child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    z = num.tryParse(displayOneController.text)!-num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    z = num.tryParse(displayOneController.text)!*num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    z = num.tryParse(displayOneController.text)!/num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton.extended(
            onPressed: (){
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                displayOneController.clear();
                displayTwoController.clear();
              });
            },
            label: const Text("Clear"),
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
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 3.0,
              color: Colors.black,
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
