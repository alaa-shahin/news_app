import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config.dart';
import 'package:news_app/cubit/states.dart';
import 'package:http/http.dart' as http;

class ApiCubit extends Cubit<NewsStates> {
  ApiCubit() : super(ApiInitialState());

  static ApiCubit get(context) => BlocProvider.of(context);

  List<dynamic> business = [];
  List<dynamic> sciences = [];
  List<dynamic> sports = [];

  Future getBusiness(String category) async {
    emit(ApiBusinessLoadingState());
    Configure configure = Configure();
    await configure.initialized;
    String url = '${configure.baseUrl}category=$category';
    var response = await http.get(Uri.parse(url));
    final extractData = jsonDecode(response.body);
    emit(ApiGetBusinessState());
    business = extractData['articles'];
    return business;
  }

  Future getSciences(String category) async {
    emit(ApiScienceLoadingState());
    Configure configure = Configure();
    await configure.initialized;
    String url = '${configure.baseUrl}category=$category';
    var response = await http.get(Uri.parse(url));
    final extractData = jsonDecode(response.body);
    emit(ApiGetScienceState());
    sciences = extractData['articles'];
    return sciences;
  }

  Future getSports(String category) async {
    emit(ApiSportsLoadingState());
    Configure configure = Configure();
    await configure.initialized;
    String url = '${configure.baseUrl}category=$category';
    var response = await http.get(Uri.parse(url));
    final extractData = jsonDecode(response.body);
    emit(ApiGetSportsState());
    sports = extractData['articles'];
    return sports;
  }
}
