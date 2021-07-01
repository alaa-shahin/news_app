import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:news_app/common_widgets/article_items.dart';
import 'package:news_app/common_widgets/divider.dart';
import 'package:news_app/cubit/api_cubit.dart';
import 'package:news_app/cubit/states.dart';

class SciencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiCubit()..getSciences('science'),
      child: BlocConsumer<ApiCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var sciences = ApiCubit.get(context).sciences;
          return Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) => sciences.length > 0,
            widgetBuilder: (BuildContext context) {
              return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: sciences.length,
                separatorBuilder: (context, index) => buildDivider(),
                itemBuilder: (context, index) {
                  return buildArticleItems(sciences[index], context);
                },
              );
            },
            fallbackBuilder: (BuildContext context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
