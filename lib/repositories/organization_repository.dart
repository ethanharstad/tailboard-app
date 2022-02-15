import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tailboard_app/models/organization.dart';

class OrganizationRepository {
  late CollectionReference<Organization> _organizationReference;

  OrganizationRepository() {
    _organizationReference =
        FirebaseFirestore.instance.collection('organizations').withConverter(
      fromFirestore: (snapshot, _) {
        var json = snapshot.data()!;
        json['id'] = snapshot.id;
        return Organization.fromJson(json);
      },
      toFirestore: (organization, _) {
        var json = organization.toJson();
        json.remove('id');
        return json;
      },
    );
  }

  Stream<Organization?> getOrganization(String id) {
    return _organizationReference
        .doc(id)
        .snapshots()
        .map<Organization?>((snapshot) => snapshot.data());
  }
}
