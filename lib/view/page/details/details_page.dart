import 'package:flutter/material.dart';
import 'package:rafpored/core/res.dart' as Res;
import 'package:rafpored/view/common/back_bar.dart';
import 'package:rafpored/view/page/details/details_body.dart';

class DetailsPage extends StatelessWidget {

  final DetailsBodyState _state;

  DetailsPage(this._state);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Column(
          children: <Widget>[
            BackBar(Res.Strings.appName),
            DetailsBody(_state),
          ],
        ),
      );
}