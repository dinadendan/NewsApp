import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/Business_screen.dart';
import 'package:news_app/Network/Cache_helper.dart';
import 'package:news_app/Network/Dio_helper.dart';
import 'package:news_app/Network/Status_NewsApp.dart';
import 'package:news_app/presentation/Sports_screen.dart';

import '../presentation/Science _screen.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState()) ;

  static NewsCubit get(context) => BlocProvider.of(context) ;

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems =
  [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_baseball,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),

  ];

  List<Widget> screens =
  [
    const BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<dynamic> business = [];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url:'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'7aaa13e8a75d44cfb13dcc81ebd077d4',
      },
    ).then((value) {
      business = value.data['articles'] ;
      // print(business[0]['title']) ;
      emit(NewsGetBusinessSuccessState()) ;
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());
   if(sports.isEmpty)
     {
       DioHelper.getData(
         url:'v2/top-headlines',
         query: {
           'country':'eg',
           'category':'sports',
           'apiKey':'7aaa13e8a75d44cfb13dcc81ebd077d4',
         },
       ).then((value) {
         //print(value.data['articles'][0]['title']) ;
         sports = value?.data['articles'] ;
         // print(sports [0]['title']) ;
         emit(NewsGetSportsSuccessState()) ;

       }).catchError((error)
       {
         print(error.toString());
         emit(NewsGetSportsErrorState(error.toString()));
       });
     } else
       {
         emit(NewsGetSportsSuccessState());
       }
  }


  List<dynamic> science = [];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    if(science.isEmpty)
      {
        DioHelper.getData(
          url:'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'science',
            'apiKey':'7aaa13e8a75d44cfb13dcc81ebd077d4',
          },
        ).then((value) {
          science = value?.data['articles'] ;
          // print(science[0]['title']) ;
          emit(NewsGetScienceSuccessState()) ;

        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        });
      } else
        {
          emit(NewsGetScienceSuccessState());
        }
  }

  List<dynamic> search = [];
  void getSearch(String value)
  {

    emit(NewsGetSearchLoadingState());

      DioHelper.getData(
        url:'v2/everything',
        query:
        {
          'q':value,
          'apiKey':'7aaa13e8a75d44cfb13dcc81ebd077d4',
        },
      ).then((value) {
        search = value?.data['articles'] ;
        emit(NewsGetSearchSuccessState()) ;
      }).catchError((error)
      {
        print(error.toString());
        emit(NewsGetSearchErrorState(error.toString()));
      });
    }

  void changeBottomNavBar (int index)
  {
    currentIndex = index ;
    if(index == 1) {
      getSports();
    }
    if(index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());

  }


  bool isDark =false ;
  void changeAppMode({bool fromShared })
  {
    if(fromShared != null)
    {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else
    {
      isDark = !isDark ;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value)
      {
        emit(AppChangeModeState());
      });
    }

  }
  }



