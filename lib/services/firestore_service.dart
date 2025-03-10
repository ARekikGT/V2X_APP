import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/traffic_alert_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Ajouter une alerte trafic
  Future<void> addTrafficAlert(TrafficAlertModel alert) async {
    await _firestore.collection('traffic_alerts').add(alert.toMap());
  }

  // Récupérer les alertes en temps réel
  Stream<List<TrafficAlertModel>> getTrafficAlerts() {
    return _firestore
        .collection('traffic_alerts')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => TrafficAlertModel.fromMap(doc.data(), doc.id))
                  .toList(),
        );
  }
}
