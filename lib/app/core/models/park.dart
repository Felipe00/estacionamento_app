import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('parking');

class ParkingLot {
  String? createdAt;
  List<Incomes>? incomes;

  ParkingLot({this.createdAt, this.incomes});

  ParkingLot.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    incomes = List.empty();
    if (json['incomes'] != null) {
      json['incomes'].forEach((v) {
        incomes?.add(Incomes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    if (this.incomes != null) {
      data['incomes'] = this.incomes?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static String _today() => DateFormat('dd-MM-yyyy').format(DateTime.now());

  static String _incomesDbName() => 'incomes';

  // DATABASE

  static Future<void> addItem({
    required Incomes incomes,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(_today()).collection(_incomesDbName()).doc();

    Map<String, dynamic> data = <String, dynamic>{
      "incomes": incomes.toJson(),
    };

    try {
      await documentReferencer.set(data).whenComplete(() {
        print("Incomes added to the database");
      }).catchError((e) {
        print('>> $e');
      });
    } catch (e) {
      print('>> # >> $e');
    }
  }

  static Query _queryItems() {
    return _mainCollection.doc(_today()).collection(_incomesDbName());
    // .orderBy('created_at', descending: true);
  }

  static Future<List<QueryDocumentSnapshot>> readItem() async {
    return (await _queryItems().get()).docs;
  }

  static Stream<QuerySnapshot> readItems() {
    return _queryItems().snapshots();
  }

  static Future<void> updateItem({
    required Incomes incomes,
  }) async {
    DocumentReference documentReferencer = _mainCollection
        .doc(_today())
        .collection(_incomesDbName())
        .doc(incomes.docId);

    Map<String, dynamic> data = <String, dynamic>{"incomes": incomes.toJson()};

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Incomes updated in the database"))
        .catchError((e) => print(e));
  }
}

class Incomes {
  String? createdAt;
  String? leaveAt;
  String? parkingSpace;
  String? carPlate;
  String? docId;

  Incomes(
      {this.createdAt,
      this.leaveAt,
      this.parkingSpace,
      this.carPlate,
      this.docId});

  Incomes.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    leaveAt = json['leave_at'];
    parkingSpace = json['parking_space'];
    carPlate = json['car_plate'];
  }

  Incomes.fromJsonDocId(Map<String, dynamic>? json, currentId) {
    if (json == null) {
      json = Map<String, dynamic>();
    }
    createdAt = json['created_at'];
    leaveAt = json['leave_at'];
    parkingSpace = json['parking_space'];
    carPlate = json['car_plate'];
    docId = currentId;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['leave_at'] = this.leaveAt;
    data['parking_space'] = this.parkingSpace;
    data['car_plate'] = this.carPlate;
    return data;
  }
}
