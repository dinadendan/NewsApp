import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Network/Cubit_NewsApp.dart';
import 'package:news_app/Network/Status_NewsApp.dart';
import 'package:news_app/presentation/resource/component.dart';

class SearchScreen extends StatelessWidget {
  final searchController = TextEditingController();

  SearchScreen({Key key}) : super(key: key);
  @override
  var FormKey =GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state){},
        builder: (context,state){
          var list =NewsCubit.get(context).search;
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: FormKey ,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(20.0),
                      child: TextFormField(
                        autofocus: true,
                        enableSuggestions: true,
                        cursorHeight: 25,
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          labelText: 'Search',
                        ),
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                        onChanged: (value){
                          NewsCubit.get(context).getSearch(value);
                        },
                        validator: (value)
                        {
                          if(value.isEmpty )
                          {
                            return 'Search must not be empty' ;
                          }
                          return null ;
                        },


                      ),
                    ),
                    Expanded(child: articleBuilder(
                      list,
                      context,
                      isSearch :true,
                    ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
