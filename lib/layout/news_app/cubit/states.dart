//import 'package:groub/shared/cubit/states.dart';

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccssesState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccssesState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetSceinceLoadingState extends NewsStates {}

class NewsGetSceinceSuccssesState extends NewsStates {}

class NewsGetSceinceErrorState extends NewsStates {
  final String error;
  NewsGetSceinceErrorState(this.error);
}

class NewsGetSearshLoadingState extends NewsStates {}

class NewsGetSearshSuccssesState extends NewsStates {}

class NewsGetSearshErrorState extends NewsStates {
  final String error;
  NewsGetSearshErrorState(this.error);
}
