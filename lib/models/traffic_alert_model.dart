class TrafficAlertModel {
  final String id;
  final String type;
  final String message;
  final double latitude;
  final double longitude;
  final DateTime timestamp;

  TrafficAlertModel({
    required this.id,
    required this.type,
    required this.message,
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  // Convertir en Map (pour Firestore)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'message': message,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  // Convertir un document Firestore en TrafficAlertModel
  factory TrafficAlertModel.fromMap(
    Map<String, dynamic> map,
    String documentId,
  ) {
    return TrafficAlertModel(
      id: documentId,
      type: map['type'],
      message: map['message'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
