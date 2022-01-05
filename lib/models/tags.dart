import 'package:flutter/foundation.dart';

class Tags {
  final String id, type, displayName;

  factory Tags.fromJson(Map<String, dynamic> data) {
    final id = data['results']['id'] as String;
    final type = data['results']['type'] as String;
    final displayName = data['results']['display_name'] as String;
    return Tags(displayName: displayName, type: type, id: id);
  }

  Tags(
    {required this.type, required this.id, required this.displayName}
  );

}