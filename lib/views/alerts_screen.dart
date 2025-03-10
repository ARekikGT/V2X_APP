import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AlertsScreen extends StatefulWidget {
  @override
  _AlertsScreenState createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Traffic Alerts")),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('traffic_alerts').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView(
            children:
                snapshot.data!.docs.map((doc) {
                  return ListTile(
                    title: Text(doc['message']),
                    subtitle: Text("Type: ${doc['type']}"),
                    leading: Icon(Icons.warning, color: Colors.red),
                  );
                }).toList(),
          );
        },
      ),
    );
  }
}
