import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/news_app/cubit/cubit.dart';
import 'package:groub/layout/news_app/cubit/states.dart';
import 'package:groub/shared/components/components.dart';

//import 'package:groub/shared/cubit/cubit.dart';

class SearshScreen extends StatelessWidget {
  var searshController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).searsh;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defalutFormfeild(
                    controller: searshController,
                    type: TextInputType.text,
                    onChanged: (value) {
                      NewsCubit.get(context).getSearsh(value);
                    },
                    valdiate: (value) {
                      if (value.isEmpty) {
                        return 'searsh must not be empty';
                      }
                      return null;
                    },
                    label: 'searsh',
                    prefix: Icons.search,
                  ),
                ),
                Expanded(child: articleBuilder(list, context, isSearsh: true))
              ],
            ),
          );
        },
      ),
    );
  }
}
