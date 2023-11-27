import 'package:peca/components/bullet_list.dart';
import 'package:flutter/material.dart';
import 'package:peca/size_config.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({Key? key}) : super(key: key);
  static String routeName = "/tips";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Care Tips"),
        elevation: 1,
      ),
      body: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        color: Colors.white, // Set a background color
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
            const  Text(
                'Pet Care Tips',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
             const BulletList([
                'Regular Exams are Vital.',
                'Spay and Neuter Your Pets.',
                'Prevent Parasites.',
                'Maintain a Healthy Weight.',
                'Get Regular Vaccinations.',
                'Provide an Enriched Environment.',
                'Microchip and Tattoo Your Pet.',
                'Pets Need Dental Care, Too.',
                'Never Give Pets People Medication.',
                'Proper Restraint in a Vehicle.',
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
