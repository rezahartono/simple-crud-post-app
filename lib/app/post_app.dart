import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/app/app_route.dart';
import 'package:post_app/app/utils/styles/theme.dart';
import 'package:post_app/presentation/bindings/home_page_binding.dart';
import 'package:post_app/presentation/pages/home_page.dart';

class PostApp extends StatelessWidget {
  const PostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'POST APPS',
      debugShowCheckedModeBanner: false,
      getPages: AppRoute.pages,
      home: const HomePage(),
      initialBinding: HomePageBinding(),
      theme: theme.light(),
      darkTheme: theme.dark(),
    );
  }
}
