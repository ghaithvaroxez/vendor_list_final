import 'package:flutter_bloc/flutter_bloc.dart';



enum LanguageEvents{english,arabic}


class LanguageBloc extends Bloc<LanguageBloc,bool>{
  LanguageBloc() : super(false);

  @override
  Stream<bool> mapEventToState(LanguageBloc event)async* {
    // TODO: implement mapEventToState
    if(event==LanguageEvents.english)
      yield true;
    else yield false;
  }
}