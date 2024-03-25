import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_lighting/theme/colors.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
// size: Size(WIDTH, (WIDTH*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
// painter: RPSCustomPainter(),
// )

class Lamp extends CustomPainter {

  final bool bulbOn;

  const Lamp({required this.bulbOn});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2622083, size.height * 0.7205417);
    path_0.lineTo(size.width * 0.1372083, size.height * 0.8455417);
    path_0.arcToPoint(Offset(size.width * 0.1961250, size.height * 0.9044583),
        radius: Radius.elliptical(
            size.width * 0.04166667, size.height * 0.04166667),
        rotation: 0,
        largeArc: true,
        clockwise: false);
    path_0.lineTo(size.width * 0.3211250, size.height * 0.7794583);
    path_0.arcToPoint(Offset(size.width * 0.2622083, size.height * 0.7205417),
        radius: Radius.elliptical(
            size.width * 0.04166667, size.height * 0.04166667),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = bulbOn ? gold : Theme.of(Get.context!).primaryColorDark;
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.8627917, size.height * 0.8455417);
    path_1.lineTo(size.width * 0.7377917, size.height * 0.7205417);
    path_1.arcToPoint(Offset(size.width * 0.6788750, size.height * 0.7794583),
        radius: Radius.elliptical(
            size.width * 0.04166667, size.height * 0.04166667),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.lineTo(size.width * 0.8038750, size.height * 0.9044583);
    path_1.arcToPoint(Offset(size.width * 0.8627917, size.height * 0.8455417),
        radius: Radius.elliptical(
            size.width * 0.04166667, size.height * 0.04166667),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = bulbOn ? gold : Theme.of(Get.context!).primaryColorDark;
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.5000000, size.height * 0.7083333);
    path_2.arcToPoint(Offset(size.width * 0.4583333, size.height * 0.7500000),
        radius: Radius.elliptical(
            size.width * 0.04166667, size.height * 0.04166667),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.lineTo(size.width * 0.4583333, size.height * 0.8750000);
    path_2.arcToPoint(Offset(size.width * 0.5416667, size.height * 0.8750000),
        radius: Radius.elliptical(
            size.width * 0.04166667, size.height * 0.04166667),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.lineTo(size.width * 0.5416667, size.height * 0.7500000);
    path_2.arcToPoint(Offset(size.width * 0.5000000, size.height * 0.7083333),
        radius: Radius.elliptical(
            size.width * 0.04166667, size.height * 0.04166667),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = bulbOn ? gold : Theme.of(Get.context!).primaryColorDark;
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.7916667, size.height * 0.5416667);
    path_3.arcToPoint(Offset(size.width * 0.7916667, size.height * 0.4583333),
        radius: Radius.elliptical(
            size.width * 0.04166667, size.height * 0.04166667),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_3.lineTo(size.width * 0.7083333, size.height * 0.4583333);
    path_3.arcToPoint(Offset(size.width * 0.5416667, size.height * 0.2916667),
        radius:
            Radius.elliptical(size.width * 0.1666667, size.height * 0.1666667),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_3.lineTo(size.width * 0.5416667, size.height * 0.1250000);
    path_3.arcToPoint(Offset(size.width * 0.4583333, size.height * 0.1250000),
        radius: Radius.elliptical(
            size.width * 0.04166667, size.height * 0.04166667),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_3.lineTo(size.width * 0.4583333, size.height * 0.2916667);
    path_3.arcToPoint(Offset(size.width * 0.2916667, size.height * 0.4583333),
        radius:
            Radius.elliptical(size.width * 0.1666667, size.height * 0.1666667),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_3.lineTo(size.width * 0.2083333, size.height * 0.4583333);
    path_3.arcToPoint(Offset(size.width * 0.2083333, size.height * 0.5416667),
        radius: Radius.elliptical(
            size.width * 0.04166667, size.height * 0.04166667),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_3.lineTo(size.width * 0.3826667, size.height * 0.5416667);
    path_3.arcToPoint(Offset(size.width * 0.6173333, size.height * 0.5416667),
        radius:
            Radius.elliptical(size.width * 0.1242500, size.height * 0.1242500),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = bulbOn ? gold : Theme.of(Get.context!).primaryColorDark;
    canvas.drawPath(path_3, paint_3_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
