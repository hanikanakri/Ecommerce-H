
import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 185, 220, 240)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.9991400,size.height*0.2890500);
    path_0.quadraticBezierTo(size.width*0.9258600,size.height*0.4044500,size.width*0.8502600,size.height*0.4050000);
    path_0.cubicTo(size.width*0.8004200,size.height*0.4070000,size.width*0.7470600,size.height*0.3035000,size.width*0.6988800,size.height*0.2026000);
    path_0.quadraticBezierTo(size.width*0.6059400,size.height*0.0190000,size.width*0.4991000,size.height*-0.0063000);
    path_0.quadraticBezierTo(size.width*0.3941200,size.height*0.0168500,size.width*0.2976800,size.height*0.2014000);
    path_0.cubicTo(size.width*0.2462200,size.height*0.3014500,size.width*0.1939600,size.height*0.4000500,size.width*0.1438000,size.height*0.4063500);
    path_0.quadraticBezierTo(size.width*0.0679400,size.height*0.4058000,size.width*-0.0005800,size.height*0.2958000);
    path_0.lineTo(size.width*-0.0044200,size.height*1.0178000);
    path_0.lineTo(size.width*1.0013000,size.height*1.0157000);
    path_0.lineTo(size.width*0.9991400,size.height*0.2890500);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);


    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 185, 220, 240)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_0, paintStroke0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
















