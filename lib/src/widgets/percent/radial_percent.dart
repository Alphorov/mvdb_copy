import 'dart:math';

import 'package:flutter/material.dart';

class Some extends StatefulWidget {
  const Some({Key? key, required this.core}) : super(key: key);
  final int core;

  @override
  _SomeState createState() => _SomeState();
}

class _SomeState extends State<Some> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RadialProcentWidget(
          chlid: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: widget.core <= 100 ? widget.core.toString() : '100',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900)),
              const TextSpan(
                  text: '%',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.normal))
            ]),
          ),
          core: widget.core,
        ),
        width: 52,
        height: 52,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.transparent)),
      ),
    );
  }
}

class RadialProcentWidget extends StatelessWidget {
  const RadialProcentWidget({Key? key, required this.chlid, required this.core})
      : super(key: key);
  final Widget chlid;
  final int core;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(painter: MyPainter((core / 100))),
        Center(child: chlid)
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double procent;

  MyPainter(this.procent);
  @override
  void paint(Canvas canvas, Size size) {
    final arcRect =
        const Offset(6, 6) & Size(size.height - 12, size.width - 12);

    drawBackground(canvas, size);

    final filledPainter = Paint();
    filledPainter.color = Colors.yellow.withOpacity(0.4);
    filledPainter.style = PaintingStyle.stroke;
    filledPainter.strokeWidth = 3;
    canvas.drawArc(
      arcRect,
      pi * 2 * procent - (pi / 2),
      pi * 2 * (1.0 - procent),
      false,
      filledPainter,
    );

    final fillPainter = Paint();
    fillPainter.color = Colors.yellow;
    fillPainter.style = PaintingStyle.stroke;
    fillPainter.strokeWidth = 3;
    fillPainter.strokeCap = StrokeCap.round;
    canvas.drawArc(
      arcRect,
      -pi / 2,
      pi * 2 * procent,
      false,
      fillPainter,
    );
  }

  void drawBackground(Canvas canvas, Size size) {
    final backgroundPainter = Paint();
    backgroundPainter.color = const Color.fromRGBO(8, 28, 34, 1);
    backgroundPainter.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backgroundPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
