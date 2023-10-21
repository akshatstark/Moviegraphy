import 'package:get_it/get_it.dart';
import 'package:moviegraphy/service/http_service.dart';

class MovieService{

  final GetIt getIt=GetIt.instance;

  late HTTPService http;
  MovieService(){
    http=getIt.get<HTTPService>();
  }
}