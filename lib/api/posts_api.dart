import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/utilities/api_utilities.dart';
import 'package:news_app/models/post.dart';

class PostsApi {
  Future<List<Post>> fetchWhatsNew() async {
    List<Post> posts = List<Post>();
    String whatsNewApiUrl = base_api + whats_new_api;
    var response = await http.get(whatsNewApiUrl);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      for (var item in data) {
        Post post = Post(
          id: item["id"].toString(),
          title: item["tittle"].toString(),
          content: item["content"].toString(),
          dateWritten: item["created_at"].toString(),
          image: item["image"].toString(),
          votesUp: item["votes_up"],
          votesDown: item["votes_down"],
          votersUp: (item["voters_up"] == null)
              ? List<int>()
              : jsonDecode(item["voters_up"]),
          votersDown: (item["voters_up"] == null)
              ? List<int>()
              : jsonDecode(item["voters_down"]),
          userId: item["author"],
          categoryId: item["category_id"],
        );
        posts.add(post);
      }
    }
    return posts;
  }
}
