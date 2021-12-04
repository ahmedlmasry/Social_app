import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/shop_app/cubit/states.dart';
import 'package:groub/models/shop_app/cateogries_model.dart';
import 'package:groub/models/shop_app/change_favorite_model.dart';
import 'package:groub/models/shop_app/favorite_model.dart';
import 'package:groub/models/shop_app/home_model.dart';
import 'package:groub/models/shop_app/login_model.dart';
import 'package:groub/modules/shop%20app/cateogries/cateogries_screen.dart';
import 'package:groub/modules/shop%20app/favorites/favorite_screen.dart';
import 'package:groub/modules/shop%20app/products/proudcts_screen.dart';
import 'package:groub/modules/shop%20app/settinges/settinges_screen.dart';
import 'package:groub/shared/components/constants.dart';
import 'package:groub/shared/network/remote/dio_helper.dart';
import 'package:groub/shared/network/remote/endpoints.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopIntialState());
  static ShopCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<Widget> bottomScreens = [
    ProductsScreen(),
    CateogriesScreen(),
    FavoritesScreen(),
    SettingesScreen(),
  ];
  void changeBottom(int index) {
    currentindex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;

  Map<int?, bool?> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      // printFullText(homeModel!.data!.banners[0].image!);
      // print(homeModel!.status);
      // print(homeModel!.data!.banners[0]);
      // print(value.toString());
      homeModel!.data!.products.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });
      // print(favorites.toString());

      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;

  void getcategories() {
    DioHelper.getData(url: GET_GATEOGRIES).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCateogriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCateogriesState());
    });
  }

  ChangeFavoriteModel? changeFavoriteModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesState());

    DioHelper.postData(
            url: FAVORITES, data: {'product_id ': productId}, token: token)
        .then((value) {
      changeFavoriteModel = ChangeFavoriteModel.fromJson(value.data);
      print(value.data);

      if (!changeFavoriteModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }

      emit(ShopSuccessChangeFavoritesState(changeFavoriteModel!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(ShopErrorChangeFavoritesState());
    });
  }

  FavoritesModel? favoritesModel;

  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      //printFullText(value.data.toString());
      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }

  ShopLoginModel? userModel;

  void getUserData() {
    emit(ShopLoadingUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      printFullText(userModel!.data!.name!);

      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateUserState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      printFullText(userModel!.data!.name!);

      emit(ShopSuccessUpdateUserState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }
}
