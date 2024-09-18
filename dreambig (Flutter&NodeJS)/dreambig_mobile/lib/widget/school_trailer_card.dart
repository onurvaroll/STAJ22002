import 'package:dreambig_mobile/model/school_model.dart';
import 'package:flutter/material.dart';

class SchoolTrailerCard extends StatelessWidget {
  const SchoolTrailerCard({super.key, required this.schoolTrailerModel});
final SchoolTrailerModel schoolTrailerModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration:
              BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(schoolTrailerModel.schoolImageUrl!)
                  )
              ),
          child: Stack(
            children: [
              Positioned(left: 12,top:0,
                  child: Image.network(schoolTrailerModel.schoolLogoUrl!)),

            ],
          ),
        ),
        Text(schoolTrailerModel.schoolName!),
        Row(
          children: [
            Text(schoolTrailerModel.schoolCountry!),
            Text(schoolTrailerModel.schoolCity!),
          ],
        ),
        Text(schoolTrailerModel.schoolQuality!)

      ],
    );
  }
}
