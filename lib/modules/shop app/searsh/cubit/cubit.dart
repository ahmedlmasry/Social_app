import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/models/shop_app/searsh_model.dart';
import 'package:groub/modules/shop%20app/searsh/cubit/states.dart';
import 'package:groub/shared/components/constants.dart';
import 'package:groub/shared/network/remote/dio_helper.dart';
import 'package:groub/shared/network/remote/endpoints.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;

  void search(String text) {
    emit(SearchLoadingState());

    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        'text': text,
      },
    ).then((value) {
      model = SearchModel.fromJson(value.data);

      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
