import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tailboard_app/models/user_access.dart';

class UserAccessRepository {
  late CollectionReference<UserAccess> _accessReference;

  UserAccessRepository() {
    _accessReference =
        FirebaseFirestore.instance.collection('user_access').withConverter(
      fromFirestore: (snapshot, _) {
        var json = snapshot.data()!;
        json['id'] = snapshot.id;
        return UserAccess.fromJson(json);
      },
      toFirestore: (userAccess, _) {
        var json = userAccess.toJson();
        json.remove('id');
        return json;
      },
    );
  }

  Stream<List<UserAccess>> getUserAccess() async* {
    await for (final authUser in FirebaseAuth.instance.userChanges()) {
      if (authUser != null) {
        final userRef =
            FirebaseFirestore.instance.collection('user').doc(authUser.uid);
        await for (final querySnapshot in _accessReference
            .where('user', isEqualTo: authUser.uid)
            .snapshots()) {
          yield querySnapshot.docs
              .map((docSnapshot) => docSnapshot.data())
              .toList();
        }
      }
      yield [];
    }
  }
}
