import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:tracking/langs/locale_keys.g.dart';
import 'package:tracking/pages/info/info_page.dart';
import 'package:tracking/utils/constants.dart';
import 'package:tracking/widgets/list/cart_widget.dart';
import 'package:tracking/widgets/list/rating_widget.dart';
import 'package:tracking/widgets/login/curved_widget.dart';
import 'package:tracking/widgets/login/gradient_button.dart';

final double _borderRadius = 24;
final String a = 'https://i.ytimg.com/vi/1Ne1hqOXKKI/maxresdefault.jpg';
final String b =
    'https://media-cdn.laodong.vn/storage/newsportal/2020/5/15/805708/Mu-Ky-Quac-Lam-Tu-Lo-16.jpg?w=720&crop=auto&scale=both';
var items = [
  PlaceInfo('Dubai Mall Food Court', b, 'Cosy · Casual · Good for kids',
      'Dubai · In The Dubai Mall', Constants.normalStateString),
  PlaceInfo('Hamriyah Food Court', a, 'All you can eat · Casual · Groups',
      'Sharjah', Constants.warningStateString),
  PlaceInfo('Gate of Food Court', b, 'Casual · Groups',
      'Dubai · Near Dubai Aquarium', Constants.normalStateString),
  PlaceInfo('Express Food Court', a, 'Casual · Good for kids · Delivery',
      'Dubai', Constants.normalStateString),
  PlaceInfo('BurJuman Food Court', a, '...', 'Dubai · In BurJuman',
      Constants.normalStateString),
  PlaceInfo('BurJuman Food Court', b, '...', 'Dubai · In BurJuman',
      Constants.normalStateString),
  PlaceInfo('BurJuman Food Court', a, '...', 'Dubai · In BurJuman',
      Constants.normalStateString),
  PlaceInfo('BurJuman Food Court', a, '...', 'Dubai · In BurJuman',
      Constants.normalStateString),
];

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfff2cbd0), Color(0xfff4ced9)])),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Center(
                child: CartPage(
                    index: index,
                    onPressed: () {
                      // print(index);
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => InfoPage(
                                    item: items[index],
                                  )));
                    },
                    items: items[index]),
              );
            },
          ),
        ));
    ;
  }
}

class PlaceInfo {
  final String name;
  final String category;
  final String location;
  final String state;
  final String urlAvatar;

  final Map<String, ColorState> color = {
    Constants.normalStateString: Constants.normalStateColor,
    Constants.warningStateString: Constants.warningStateColor,
  };
  final Map<String, String> context = {
    Constants.normalStateString: LocaleKeys.NormalState,
    Constants.warningStateString: LocaleKeys.NeedHelpState,
  };

  final Map<String, Icon> icon = {
    Constants.normalStateString: Icon(
      Icons.check,
      size: 50,
      color: Colors.green,
    ),
    Constants.warningStateString: Icon(
      Icons.warning,
      color: Colors.amberAccent,
      size: 50,
    ),
  };
  PlaceInfo(
      this.name, this.urlAvatar, this.category, this.location, this.state);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;
    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
