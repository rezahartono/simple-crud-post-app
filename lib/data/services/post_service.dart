import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:post_app/app/utils/common/app_logger.dart';
import 'package:post_app/data/models/create_post_model.dart';
import 'package:post_app/data/sources/network_source.dart';
import 'package:post_app/domain/entities/post_entity.dart';

class PostService {
  Future<Either<String, List<PostEntity>>> getList() async {
    String path = "posts";

    final uri = NetworkSource().baseUri(path);

    final response = await http.get(
      uri,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );

    logger.responseLog(uri, response);

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      List<PostEntity> posts = [];

      for (var element in data) {
        posts.add(PostEntity.fromJson(element));
      }

      return right(posts);
    } else {
      return left("Get data fails");
    }
  }

  Future<Either<String, PostEntity>> getDetail({required int id}) async {
    String path = "posts/$id";

    final uri = NetworkSource().baseUri(path);

    final response = await http.get(
      uri,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );

    logger.responseLog(uri, response);

    if (response.statusCode == 200) {
      PostEntity data = PostEntity.fromJson(json.decode(response.body));

      return right(data);
    } else {
      return left("Get data fails");
    }
  }

  Future<Either<String, PostEntity>> create(
      {required CreatePostModel request}) async {
    String path = "posts";

    final uri = NetworkSource().baseUri(path);

    final response = await http.post(
      uri,
      body: json.encode(request.toJson()),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );

    logger.responseLog(uri, response);

    if (response.statusCode == 201) {
      PostEntity data = PostEntity.fromJson(json.decode(response.body));

      return right(data);
    } else {
      return left("Get data fails");
    }
  }

  Future<Either<String, String>> delete({required int id}) async {
    String path = "posts/$id";

    final uri = NetworkSource().baseUri(path);

    final response = await http.delete(
      uri,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );

    logger.responseLog(uri, response);

    if (response.statusCode == 200) {
      return right("Record has been deleted!");
    } else {
      return left("Get data fails");
    }
  }

  Future<Either<String, PostEntity>> update({
    required PostEntity request,
  }) async {
    String path = "posts/${request.id}";

    final uri = NetworkSource().baseUri(path);

    final response = await http.put(
      uri,
      body: json.encode(request.toJson()),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );

    logger.safeLog(request.toJson());
    logger.responseLog(uri, response);

    if (response.statusCode == 200) {
      PostEntity data = PostEntity.fromJson(json.decode(response.body));

      return right(data);
    } else {
      return left("Update data fails");
    }
  }
}
