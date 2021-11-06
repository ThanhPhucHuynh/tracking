import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:tracking/pages/list/list_page.dart';
import 'package:tracking/utils/constants.dart';
import 'package:tracking/utils/custom_clipper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'top_bar.dart';

final double _borderRadius = 24;

class StackContainer extends StatefulWidget {
  final PlaceInfo item;
  StackContainer({Key? key, required this.item}) : super(key: key);
  @override
  _StackContainerState createState() => _StackContainerState();
}

class _StackContainerState extends State<StackContainer> {
  @override
  Widget build(BuildContext context) {
    Color startColor = widget.item.color[widget.item.state]!.startColor;
    Color endColor = widget.item.color[widget.item.state]!.endColor;
    String context = widget.item.context[widget.item.state]!;
    Icon icon = widget.item.icon[widget.item.state]!;
    String urlAvatar = widget.item.urlAvatar;
    String name = widget.item.name;
    String state = widget.item.context[widget.item.state]!;
    return Container(
      height: 300.0,
      child: Stack(
        children: <Widget>[
          Container(),
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              height: 300.0,
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
                // image: DecorationImage(
                //   image: NetworkImage("https://picsum.photos/200"),
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProfileAvatar(
                  urlAvatar,
                  borderWidth: 4.0,
                  radius: 60.0,
                ),
                SizedBox(height: 4.0),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  state,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[700],
                  ),
                ).tr(),
                SizedBox(height: 4.0),
              ],
            ),
          ),
          TopBar(),
        ],
      ),
    );
  }
}
