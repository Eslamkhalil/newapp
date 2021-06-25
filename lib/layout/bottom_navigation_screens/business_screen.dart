
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/shared/components/components.dart';
import 'package:newapp/shared/cubit/app_news_state.dart';
import 'package:newapp/shared/cubit/cubit.dart';

class BusinessNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,AppNewsState>(builder: (context,state){
      var list = NewsCubit.get(context).business;
      return ConditionalBuilder(condition: list.length > 0 , builder: (context) => ListView.separated(
          itemBuilder: (context, index) => buildItemList(list[index]),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length)
      ,fallback:(context) => Center(child: CircularProgressIndicator()),
      );
    }, listener: (context,state){});
  }
}