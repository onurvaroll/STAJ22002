import 'package:flutter/material.dart';

class FlagBuilder extends StatelessWidget {
  const FlagBuilder({
    super.key,
    required this.flags,
  });

  final List<String> flags;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: flags.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: CircleAvatar(
          radius: 50,
          child: ClipOval(
            child: Image.asset(
              'assets/images/country_flag/${flags[index]}.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
