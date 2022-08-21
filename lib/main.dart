import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Network/Cache_helper.dart';
import 'package:news_app/Network/Cubit_NewsApp.dart';
import 'package:news_app/Network/Dio_helper.dart';
import 'package:news_app/Network/Status_NewsApp.dart';
import 'package:news_app/presentation/New_app.dart';
import 'package:news_app/Network/bloc_observer.dart';
import 'package:news_app/presentation/resource/Themes.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark') ;

  runApp( MyApp(
    isDark : isDark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.isDark}) : super(key: key);

  final bool isDark ;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..changeAppMode(fromShared: isDark)..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsApp(),
          );
        },
      ),
    );
  }
}

