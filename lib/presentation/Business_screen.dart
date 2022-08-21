import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Network/Cubit_NewsApp.dart';
import 'package:news_app/Network/Status_NewsApp.dart';
import 'package:news_app/presentation/resource/component.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).business ;
        return articleBuilder(list,context);
      },
    );
  }
}
