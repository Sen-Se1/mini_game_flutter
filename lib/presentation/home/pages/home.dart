import 'package:flutter/material.dart';
import 'package:quiz/common/widgets/appbar/appbar.dart';
import 'package:quiz/presentation/game/pages/game.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
        hideBack: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20,),
            SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const GamePage()
                        )
                    );
                  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  child: const Text("Click To Start",style: TextStyle(color: Colors.white),)
                )
            )

          ],
        ),
      ),
    );
  }
}
