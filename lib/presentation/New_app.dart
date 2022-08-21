import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Network/Cubit_NewsApp.dart';
import 'package:news_app/Network/Status_NewsApp.dart';
import 'package:news_app/presentation/Search_screen.dart';



class NewsApp extends StatelessWidget {
  const NewsApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {},
      builder: (context, state)
      {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 1,
            centerTitle: true,
            title: const Text(
              'News App',
            ),
            actions: [
              IconButton(
                  onPressed:()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                  icon: const Icon(Icons.search,
                  size: 28,),
              ),
              IconButton(
                onPressed:()
                {
                  NewsCubit.get(context).changeAppMode();
                },
                icon: const Icon(
                    Icons.brightness_3_sharp,
                  size: 26,
                ),
              ),

            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },
          ),
        ) ;
      },
    );
  }
}
