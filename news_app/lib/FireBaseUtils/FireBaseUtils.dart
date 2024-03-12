import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/api/news/article.dart';
import 'package:news_app/model/user.dart';

class FireBaseUtils {
  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
          fromFirestore: (snapshot, options) =>
              MyUser.fromJson(snapshot.data()!),
          toFirestore: (user, options) => user.toJson(),
        );
  }

  static Future<void> addUserToFireStore(MyUser myUser) {
    return getUsersCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFormFireStore(String userID) async {
    var querySnapsot = await getUsersCollection().doc(userID).get();
    return querySnapsot.data();
  }

  static CollectionReference<Article> getArticleCollection(String userId) {
    return getUsersCollection()
        .doc(userId)
        .collection(Article.collectionName)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              Article.fromJson(snapshot.data()!),
          toFirestore: (article, options) => article.toJson(),
        );
  }

  static Future<void> addBookmarkedArticleToFireStore(
    String userId,
    Article article,
  ) {
    var taskCollectionRef = getArticleCollection(userId);
    var taskDocRef = taskCollectionRef.doc();
    article.id = taskDocRef.id;
    return taskDocRef.set(article);
  }

  static Future<List<Article>> getAllArticles(String userId) async {
    QuerySnapshot<Article> querySnapshot =
        await getArticleCollection(userId).get();
    List<Article> map = querySnapshot.docs.map((doc) => doc.data()).toList();
    return map;
  }

  /*  static Future<void> deleteTaskFromList(Article article, String userId) {
    return getArticleCollection(userId).doc(article.id).delete();
  } */
}
