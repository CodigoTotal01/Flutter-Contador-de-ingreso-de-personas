import 'package:flutter/material.dart';

// StatelessWidget - Sin estado, por ende, no se podra modificar
class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CounterFunctionsScreenState();
}

//Const es en tiempo de construccion
class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Espera un Wiget que exteineda de PreferenceWidge
        appBar: AppBar(
          title: const Text('Counter Functions'),
          //leading: Solo uno,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //Enumeracion
            children: [
              Text('$clickCounter',
                  style: const TextStyle(
                      fontSize: 160, fontWeight: FontWeight.w100)),
              Text('Click${(clickCounter == 1) ? '' : 's'}',
                  style: const TextStyle(fontSize: 25))
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(icon: Icons.refresh_rounded, onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },),
            const SizedBox(height: 10,),
            CustomButton(icon: Icons.exposure_minus_1_outlined,onPressed: () {
              if(clickCounter == 0) return;
              setState(() {
                clickCounter--;
              });
            },),
            const SizedBox(height: 10,),
            CustomButton(icon: Icons.plus_one,onPressed: () {
              setState(() {
                clickCounter++;
              });
            },)
          ],
        )); // Caja con una x
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;

  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: const StadiumBorder(),
        onPressed: onPressed,
        child: Icon(icon)
    );
  }
}
