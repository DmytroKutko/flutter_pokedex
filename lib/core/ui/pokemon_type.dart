import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonType extends StatelessWidget {
  final String type;
  const PokemonType({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "normal":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "fire":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.orange,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "water":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.blue,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "grass":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.green,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "electric":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.yellow,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "ice":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.lightBlue,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "fighting":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.red,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "poison":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.purple,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "ground":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.brown,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "flying":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.lightBlueAccent,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "psychic":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.orangeAccent,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "bug":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.lightGreen,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "rock":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "ghost":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.purple,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "dark":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.blueGrey,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "dragon":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.blue[800],
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "steel":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.blueGrey,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      case "fairy":
        return Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.pinkAccent,
          ),
          child: SvgPicture.asset(
            'assets/icons/$type.svg',
            width: 30.0,
            height: 30.0,
          ),
        );

      default:
        return const SizedBox();
    }
  }
}
