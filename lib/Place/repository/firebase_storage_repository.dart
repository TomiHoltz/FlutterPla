import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'firebase_storage_api.dart';

class FirebaseStorageRepository {
  final _firebaseStorageAPI = FirebasStorageAPI();

  Future<firebase_storage.UploadTask> uploadFile(String path, File image) async =>
      _firebaseStorageAPI.uploadFile(path, image);
}
