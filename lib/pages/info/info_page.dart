import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:tracking/pages/list/list_page.dart';
import 'package:tracking/widgets/info/call_button.dart';
import 'package:tracking/widgets/info/cart_item.dart';
import 'package:tracking/widgets/info/stack_container.dart';

class InfoPage extends StatefulWidget {
  final PlaceInfo item;

  const InfoPage({Key? key, required this.item}) : super(key: key);
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfff2cbd0), Color(0xfff4)])),
          child: SingleChildScrollView(
            child: Container(
              child: Container(
                height: size.height,
                child: Column(
                  children: <Widget>[
                    StackContainer(
                      item: widget.item,
                    ),
                    Container(child: CallButton(item: widget.item)),
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => CardItem(
                          item: widget.item,
                        ),
                        shrinkWrap: true,
                        itemCount: 7,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
