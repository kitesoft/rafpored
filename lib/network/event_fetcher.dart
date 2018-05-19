import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'package:rafroid/model/event.dart';
import 'package:rafroid/core/config.dart';
import 'package:rafroid/network/on_events_fetched_listener.dart';

class EventFetcher {

  static fetchEvents(OnEventsFetchedListener listener) {
    _asyncFetch().then((events) => listener.onEventsFetched(events));
  }

  static Future<List<Event>> _asyncFetch() async {
    List<Event> events = List<Event>();

    var response = JsonDecoder().convert((await Http.get(Config.getApiUrl("events.json"))).body);

    for(var event in response) {
      events.add(Event.fromJson(event));
    }

    return events;
  }
}