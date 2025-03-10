import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/traffic_alert_model.dart';
import '../services/firestore_service.dart';

class TrafficProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<TrafficAlertModel> _alerts = [];

  List<TrafficAlertModel> get alerts => _alerts;

  // Charger les alertes en temps réel
  void loadTrafficAlerts() {
    _firestoreService.getTrafficAlerts().listen((alerts) {
      _alerts = alerts;
      notifyListeners();
    });
  }

  // Ajouter une alerte de trafic
  Future<void> addTrafficAlert(TrafficAlertModel alert) async {
    await _firestoreService.addTrafficAlert(alert);
  }
}
