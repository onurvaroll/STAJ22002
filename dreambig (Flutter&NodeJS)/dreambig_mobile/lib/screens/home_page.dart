import 'package:flutter/material.dart';

import '../data/flag_data.dart';
import '../widget/flag_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/dreambig_logo.png',
                width: 80,
                height: 80,
              ),
              const SizedBox(width: 140),
              const Text(
                'Hoşgeldiniz,\nOnur VAROL',
                style: TextStyle(
                  color: Color(0xFF1c3c6e),
                  fontSize: 20,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 30),
        Expanded(flex: 1,
          child: FlagBuilder(flags: FlagData().flags),
        ),
        SizedBox(
          height: 10,
        ),
          Expanded(flex: 3,
              child: TrailerCard()),
          Expanded(
            flex: 5,
              child: const SizedBox())
        ],
      ),
    );
  }
}

class TrailerCard extends StatelessWidget {
  const TrailerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Set a fixed height for the ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          width: 200, // Set a fixed width for the container
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
            image: const DecorationImage(fit: BoxFit.cover,
              image: AssetImage('assets/images/oxford_main.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
