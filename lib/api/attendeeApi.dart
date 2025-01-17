import 'dart:convert';

import 'package:event_attendance/config/apiConfig.dart';
import 'package:event_attendance/models/AttendeeModel.dart';
import 'package:http/http.dart' as http;




Future<List<Attendee>> fetchAttendees(eventId) async {
  final response = await http.get(BASE_URL + EVENT_URL);

  if (response.statusCode == 200){
    List<Attendee> attendeeList = [];

    for(Map<String, dynamic> attendee in json.decode(response.body)){
      attendeeList.add(Attendee.fromJson(attendee));
    }
    return attendeeList;
  }
  else{
    throw Exception('Error fetching Attendees');
  }
}

Future<Attendee> fetchAttendee(attendeeId) async {
  final response = await http.get(BASE_URL + EVENT_URL);

  if (response.statusCode ==  200){
    return Attendee.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error fetching Attendee');
  }
}

Future<Attendee> createAttendee(Attendee attendee) async {

  final Map<String, dynamic> attendeeData = {
    'userId': attendee.userId,
    'eventId': attendee.eventId,
    'status': attendee.status
  };

  final response = await http.post(BASE_URL + EVENT_URL, body: json.encode(attendeeData));

  if(response.statusCode == 200){
    return Attendee.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error Creating an Attendee');
  }
}

Future<Attendee> updateAttendee(Attendee attendee) async{
  final Map<String, dynamic> attendeeData = {
    'userId': attendee.userId,
    'eventId': attendee.eventId,
    'status': attendee.status
  };

  final response = await http.put(BASE_URL + EVENT_URL + attendee.attendeeId, body: json.encode(attendeeData));

  if (response.statusCode == 200){
    return  Attendee.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error Updating Attendee');
  }
}

Future<Attendee> deleteAttendee(attendeeId) async {
  final response = await http.delete(BASE_URL + EVENT_URL + attendeeId);

  if (response.statusCode == 200){
    return Attendee.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Error Deleting Attendee');
  }
}


