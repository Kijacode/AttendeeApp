import 'dart:convert';

import 'package:event_attendance/config/apiConfig.dart';
import 'package:event_attendance/models/EventModel.dart';
import 'package:http/http.dart' as http;




Future<List<Event>> fetchEvents(userId) async {
  final response = await http.get(BASE_URL + EVENT_URL);

  if (response.statusCode == 200){
    List<Event> eventList = [];

    for(Map<String, dynamic> event in json.decode(response.body)){
      eventList.add(Event.fromJson(event));
    }
    return eventList;
  }
  else{
    throw Exception('Error fetching Events');
  }
}

Future<Event> fetchEvent(eventId) async {
  final response = await http.get(BASE_URL + EVENT_URL);

  if (response.statusCode ==  200){
    return Event.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error fetching Event');
  }
}

Future<Event> createEvent(Event event) async {

  final Map<String, dynamic> eventData = {
    'eventId': event.eventId,
    'userId': event.userId,
    'name': event.name,
    'decription': event.description,
    'date': event.date
  };

  final response = await http.post(BASE_URL + EVENT_URL, body: json.encode(eventData));

  if(response.statusCode == 200){
       return Event.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error Creating an Event');
  }
}

Future<Event> updateEvent(Event event) async{
  final Map<String, dynamic> eventData = {
    'eventId': event.eventId,
    'userId': event.userId,
    'name': event.name,
    'decription': event.description,
    'date': event.date
  };

  final response = await http.put(BASE_URL + EVENT_URL + event.eventId, body: json.encode(eventData));

  if (response.statusCode == 200){
      return  Event.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error Updating Event');
  }
}

Future<Event> deleteEvent(eventId) async {
  final response = await http.delete(BASE_URL + EVENT_URL + eventId);

  if (response.statusCode == 200){
    return Event.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error Deleting Event');
  }
}


