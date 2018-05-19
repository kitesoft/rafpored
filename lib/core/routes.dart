import 'package:fluro/fluro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:rafroid/view/page/login/login_page.dart';
import 'package:rafroid/view/page/list/list_page.dart';
import 'package:rafroid/view/page/calendar/calendar_page.dart';
import 'package:rafroid/view/page/details/details_page.dart';

class Routes {

  static final Router _router = Router();

  static dynamic _bundle;

  static initRoutes() {
    _router.define(
        "/login",
        handler: Handler(
            handlerFunc: (BuildContext context, Map<String, dynamic> params) {
              SharedPreferences.getInstance().then((prefs) => prefs.remove("password"));

              return LoginPage();
            })
    );

    _router.define(
        "/list",
        handler: Handler(
            handlerFunc: (BuildContext context, Map<String, dynamic> params) {
              return ListPage();
            })
    );

    _router.define(
        "/calendar",
        handler: Handler(
            handlerFunc: (BuildContext context, Map<String, dynamic> params) {
              return CalendarPage();
            })
    );

    _router.define(
        "/details",
        handler: Handler(
            handlerFunc: (BuildContext context, Map<String, dynamic> params) {
              return DetailsPage(_bundle);
            })
    );
  }

  static navigate(BuildContext context, String route, bool replace, {dynamic bundle}) {
    _bundle = bundle;
    _router.navigateTo(
        context,
        route,
        replace: replace,
        transition: TransitionType.fadeIn,
    );
  }
}