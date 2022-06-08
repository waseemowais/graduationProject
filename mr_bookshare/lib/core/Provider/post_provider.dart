import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:mr_bookshare/core/Models/postmodel.dart';
import 'package:mr_bookshare/core/services/postservice.dart';
import 'package:mr_bookshare/core/session_manager/session_manager.dart';

class PostProvider extends ChangeNotifier {
  final PostService _postService = PostService();

  // PostList get offlinePots {
  //   List<PostModel> postList = [];
  //   var encodedData = Prefs.getListStringValue('postsData') ?? [];
  //   if (encodedData.isNotEmpty) {
  //     var model = PostModel();
  //     for (var item in encodedData) {
  //       model = PostModel.fromJson(json.decode(item));
  //       postList.add(model);
  //     }
  //     PostList finalModel = PostList(posts: postList);
  //     return finalModel;
  //   }
  //   return PostList(posts: []);
  // }

  Future<PostList> getPosts() async {
    return await _postService.getPosts().whenComplete(() {
      refresh();
    });
  }


  Future<void> addPost(PostModel model) async {
    await _postService.addPost(model).whenComplete(() {
      refresh();
      notifyListeners();
    }).catchError((error) {
      log('adding Post error : $error');
    });
  }

  Future<void> updatePost(String id, PostModel model) async {
    await _postService.updatePost(id, model).whenComplete(() {
      refresh();
      notifyListeners();
    }).catchError((error) {
      log('updating Post error : $error');
    });
  }

  Future<void> deletePost(String id) async {
    await _postService.deletePost(id).whenComplete(() {
      refresh();
      notifyListeners();
    }).catchError((error) {
      log('deleting Post error : $error');
    });
  }

  void refresh() async {
    await Prefs.removeValue('postsData');
    PostList model;
    String encodedData = '';
    List<String> encodedDataList = [];
    PostService postService = PostService();
    model = await postService.getPosts();
    for (var item in model.posts) {
      encodedData = json.encode(item.toJson());
      encodedDataList.add(encodedData);
    }
    Prefs.setStringListValue(
        'postsData', encodedDataList); // background service
  }
}
