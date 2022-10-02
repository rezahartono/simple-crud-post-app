import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/presentation/bindings/create_post_page_binding.dart';
import 'package:post_app/presentation/bindings/home_page_binding.dart';
import 'package:post_app/presentation/bindings/post_detail_page_binding.dart';
import 'package:post_app/presentation/bindings/update_post_page_binding.dart';
import 'package:post_app/presentation/pages/create_post_page.dart';
import 'package:post_app/presentation/pages/home_page.dart';
import 'package:post_app/presentation/pages/post_detail_page.dart';
import 'package:post_app/presentation/pages/update_post_page.dart';

class AppRoute {
  static final pages = [
    GetPage(
      name: RouteName.homeScreen,
      page: () => const HomePage(),
      binding: HomePageBinding(),
      curve: Curves.easeOut,
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.postDetailScreen,
      page: () => const PostDetailPage(),
      binding: PostDetailPageBinding(),
      curve: Curves.easeOut,
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.createPostScreen,
      page: () => const CreatePostPage(),
      binding: CreatePostPageBinding(),
      curve: Curves.easeOut,
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.updatePostScreen,
      page: () => const UpdatePostPage(),
      binding: UpdatePostPageBinding(),
      curve: Curves.easeOut,
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}

abstract class RouteName {
  static const homeScreen = '/';
  static const postDetailScreen = '/post-detail';
  static const createPostScreen = '/create-post';
  static const updatePostScreen = '/update-post';
}
