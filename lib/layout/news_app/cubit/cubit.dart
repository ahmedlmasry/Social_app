//import 'package:blo/c/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/news_app/cubit/states.dart';
import 'package:groub/modules/news%20app/business/business_screen.dart';
import 'package:groub/modules/news%20app/science/science_screen.dart';
import 'package:groub/modules/news%20app/sports/sports_screen.dart';

import 'package:groub/shared/network/remote/dio_helper.dart';
//import 'package:groub/layout/news_layout/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Bussines'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sporst'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getSceince();

    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '2c7f86357a0b47dea2c1f30794d868b4',
    }).then((value) {
      business = value.data['articles'];

      print(business[0]['title']);

      emit(NewsGetBusinessSuccssesState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '2c7f86357a0b47dea2c1f30794d868b4',
      }).then((value) {
        sports = value.data['articles'];

        print(sports[0]['title']);

        emit(NewsGetSportsSuccssesState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else
      emit(NewsGetSportsSuccssesState());
  }

  List<dynamic> sceince = [];

  void getSceince() {
    emit(NewsGetSceinceLoadingState());
    if (sceince.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '2c7f86357a0b47dea2c1f30794d868b4',
      }).then((value) {
        sceince = value.data['articles'];

        print(sceince[0]['title']);

        emit(NewsGetSceinceSuccssesState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSceinceErrorState(error.toString()));
      });
    } else
      emit(NewsGetSceinceSuccssesState());
  }

  List<dynamic> searsh = [];

  void getSearsh(String value) {
    emit(NewsGetSearshLoadingState());

    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '2c7f86357a0b47dea2c1f30794d868b4',
    }).then((value) {
      searsh = value.data['articles'];

      print(searsh[0]['title']);

      emit(NewsGetSearshSuccssesState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearshErrorState(error.toString()));
    });
  }
}
