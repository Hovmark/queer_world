import 'package:flutter/material.dart';

const lightGreen = Color.fromARGB(255, 109, 171, 111);
const mediumGreen = Color.fromARGB(255, 81, 128, 62);
const green = Colors.green;

const purple = Colors.deepPurple;

const transparent = Colors.transparent;

const rainbowPurple = Color.fromRGBO(165, 124, 187, 1);
const rainbowBlue = Color.fromRGBO(130, 151, 215, 1);
const rainbowGreen = Color.fromRGBO(165, 195, 136, 1);
const rainbowYellow = Color.fromRGBO(236, 221, 127, 1);
const rainbowOrange = Color.fromRGBO(241, 172, 128, 1);
const rainbowRed = Color.fromRGBO(228, 125, 128, 1);

const lesbianRed = Color.fromRGBO(227, 74, 41, 1);
const lesbianOrange = Color.fromRGBO(247, 178, 121, 1);
const lesbianWhite = Color.fromRGBO(239, 236, 234, 1);
const lesbianPurple = Color.fromRGBO(94, 79, 145, 1);
const lesbianPink = Color.fromRGBO(150, 31, 103, 1);

const nonbinaryYellow = Color.fromRGBO(254, 244, 52, 1);
const nonbinaryWhite = Color.fromRGBO(252, 252, 252, 1);
const nonbinaryPurple = Color.fromRGBO(156, 89, 209, 1);
const nonbinaryBlack = Color.fromRGBO(44, 44, 44, 1);

const transBlue = Color.fromRGBO(91, 207, 251, 1);
const transPink = Color.fromRGBO(247, 171, 185, 1);
const transWhite = Color.fromRGBO(255, 255, 255, 1);

///gradients
const rainbowGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      rainbowRed,
      rainbowOrange,
      rainbowYellow,
      rainbowGreen,
      rainbowBlue,
      rainbowPurple
    ]);

const lesbianGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      lesbianRed,
      lesbianOrange,
      lesbianWhite,
      lesbianPurple,
      lesbianPink
    ]);

const nonbinaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [nonbinaryYellow, nonbinaryWhite, nonbinaryPurple, nonbinaryBlack]);

const transGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [transBlue, transPink, transWhite, transPink, transBlue]);
