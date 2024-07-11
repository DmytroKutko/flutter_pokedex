import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonType extends StatelessWidget {
  final String type;
  const PokemonType({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "normal":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.grey,
        );

      case "fire":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.orange,
        );

      case "water":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.blue,
        );

      case "grass":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.green,
        );
      case "electric":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.yellow,
        );

      case "ice":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.lightBlue,
        );

      case "fighting":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.red,
        );

      case "poison":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.purple,
        );

      case "ground":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.grey,
        );

      case "flying":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.lightBlueAccent,
        );

      case "psychic":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.orangeAccent,
        );

      case "bug":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.lightGreen,
        );

      case "rock":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.grey,
        );

      case "ghost":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.purple,
        );

      case "dark":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.blueGrey,
        );

      case "dragon":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.lightBlue,
        );

      case "steel":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.blueGrey,
        );

      case "fairy":
        return SvgPicture.asset(
          'assets/icons/$type.svg',
          width: 30.0,
          height: 30.0,
          color: Colors.pinkAccent,
        );


      default:
        return const SizedBox();
    }
  }
}
