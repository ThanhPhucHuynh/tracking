import 'package:flutter/material.dart';
import 'package:tracking/langs/locale_keys.g.dart';
import 'package:tracking/pages/list/list_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tracking/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CallButton extends StatelessWidget {
  void _launchURL() async => await launch('tel://0347766101');
  final PlaceInfo item;
  const CallButton({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> callContext = {
      Constants.normalStateString: LocaleKeys.CallContentNormalState,
      Constants.warningStateString: LocaleKeys.CallContentNeedHelpState,
    };
    String text = callContext[item.state] == LocaleKeys.CallContentNormalState
        ? LocaleKeys.CallContentNormalState
        : LocaleKeys.CallContentNeedHelpState;
    Color startColor = item.color[item.state]!.startColor;
    Color endColor = item.color[item.state]!.endColor;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          alignment: Alignment.center,
          // mainAxisSize: MainAxisSize.min,
          child: SizedBox(
            // width: 100,
            child: MaterialButton(
              onPressed: () => _launchURL(),
              color: startColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'NimbusSanL',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ).tr(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.phone),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
