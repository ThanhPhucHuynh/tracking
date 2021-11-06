import 'package:flutter/material.dart';
import 'package:tracking/pages/list/list_page.dart';
import 'package:tracking/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'rating_widget.dart';

class CartPage extends StatefulWidget {
  final void Function() onPressed;
  final int index;
  final PlaceInfo items;

  CartPage({
    Key? key,
    required this.index,
    required this.onPressed,
    required this.items,
  }) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

final double _borderRadius = 24;

class _CartPageState extends State<CartPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Color startColor = widget.items.color[widget.items.state]!.startColor;
    Color endColor = widget.items.color[widget.items.state]!.endColor;
    String context = widget.items.context[widget.items.state]!;
    Icon icon = widget.items.icon[widget.items.state]!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MaterialButton(
        onPressed: widget.onPressed,
        hoverColor: Colors.white,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: StadiumBorder(),
        child: Stack(
          children: <Widget>[
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_borderRadius),
                gradient: LinearGradient(colors: [
                  startColor,
                  endColor,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: endColor,
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              top: 0,
              child: CustomPaint(
                size: Size(100, 150),
                painter:
                    CustomCardShapePainter(_borderRadius, startColor, endColor),
              ),
            ),
            Positioned.fill(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: new EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.network(
                          widget.items.urlAvatar,
                          fit: BoxFit.cover,
                          height: 75,
                          width: 60,
                        ),
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.items.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Avenir',
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          widget.items.category,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Avenir',
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.white70,
                              size: 16,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: Text(
                                widget.items.location,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontFamily: 'Avenir',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        RatingBar(
                          icon: icon,
                        ),
                        Text(
                          context,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Avenir',
                              fontSize: 10,
                              fontWeight: FontWeight.w700),
                        ).tr(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
