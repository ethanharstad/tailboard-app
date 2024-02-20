import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tailboard_app/models/app_user.dart';

class UserRepository {
  late CollectionReference<AppUser> userReference;

  UserRepository() {
    userReference =
        FirebaseFirestore.instance.collection('users').withConverter(
      fromFirestore: (snapshot, _) {
        var json = snapshot.data()!;
        json['id'] = snapshot.id;
        return AppUser.fromJson(json);
      },
      toFirestore: (user, _) {
        var json = user.toJson();
        json.remove('id');
        return json;
      },
    );
  }

  Stream<AppUser?> getUser(String id) {
    return userReference.doc(id).snapshots().map((snapshot) => snapshot.data());
  }
}
