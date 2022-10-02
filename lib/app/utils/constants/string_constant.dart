// ignore_for_file: non_constant_identifier_names, unnecessary_new, constant_identifier_names

part 'messages.dart';

class AppStringConstant {
  final String authentication = "authentication";
  final String locale = "id_ID";
  final String pathImages = "assets/images/";
  final String pathIcons = "assets/icons/";
}

class AppStateConstant {
  final String onCreate = "on_create";
  final String onDelete = "on_delete";
  final String onUpdate = "on_update";
  final String onGet = "on_get";
  final String firstState = "first_state";
}

AppStringConstant constant = new AppStringConstant();
AppStateConstant appState = new AppStateConstant();
