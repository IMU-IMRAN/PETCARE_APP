import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peca/components/continue_button.dart';
import 'package:peca/constants.dart';
import 'package:peca/data_services/get_pet_list.dart';
import 'package:peca/screen/pets/add_pets_screen.dart';
import 'package:peca/screen/pets/pets_screen.dart';
import 'package:peca/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List userPetList = [];
  static const String _url = 'https://www.flipkart.com/pet-supplies/pr?sid=p3t';

  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
  }

  fetchDatabaseList() async {
    dynamic result = await DataBaseManager().getPetsList();
    if (result == null) {
    } else {
      setState(() {
        userPetList = result;
      });
    }
  }

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(30)),
        userPetList.isEmpty ? notpetsfound() : petsfound(context),
        SizedBox(height: getProportionateScreenHeight(25)),
        SizedBox(
          width: 165,
          child: ContinueButton(
            icon: Icons.add_circle_outlined,
            text: " Add Pet",
            press: () => Navigator.of(context).pushNamed(AddPet.routeName),
          ),
        ),
        const Spacer(),
        Container(
          margin: EdgeInsets.all(getProportionateScreenHeight(30)),
          child: InkWell(
            onTap: () => _launchURL(),
            child: Image.asset(
              "assets/images/ads.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Center spinner() {
    return const Center(
      child: SpinKitFoldingCube(
        color: kPrimaryLightColor,
        size: 75.0,
      ),
    );
  }

  Widget notpetsfound() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/images/notfound.svg",
            height: 300,
          ),
          const Text(
            "No Pets Found",
            style: TextStyle(
              fontSize: 28,
              fontFamily: "Poppins",
              color: kSecondaryColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  InkWell petsfound(BuildContext context) {
    return InkWell(
      onDoubleTap: () => Navigator.of(context).pushNamed(PetsScreen.routeName),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: kPrimaryColor, blurRadius: 5.0),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My Pets",
                style: TextStyle(
                  fontSize: 33,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(15)),
            Container(
              height: 250,
              child: CarouselSlider.builder(
                itemCount: userPetList.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = userPetList[index]['url'];
                  final name = userPetList[index]['Name'];
                  return buildImage(urlImage, name, index);
                },
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, String name, int index) => Column(
        children: [
          SizedBox(
            height: 200,
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(12)),
              child: Image.network(
                urlImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          )
        ],
      );
}
