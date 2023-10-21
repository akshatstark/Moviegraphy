import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../model/app_config.dart';

class HTTPService{
  final getIt=GetIt.instance;
  final Dio dio=Dio();

  late String _baseurl;
  late String _api_key;

  HTTPService(){
    AppConfig config=getIt.get<AppConfig>();
      _baseurl =config.BASE_API_URL;
      _api_key=config.API_KEY;
  }
  Future get(String _path, {required Map<String,dynamic> query}) async{
    try{
      String _url='$_baseurl$_path';
      Map<String,dynamic> _query={
        'api_key': _api_key,
        'language': 'en-US',
      };
      if(query!=null){
        _query.addAll(query);
      }
      return await dio.get(_url,queryParameters: _query);
    }
    on DioException catch(e){
      print('Unable to perfrom get request.');
      print('DioError:$e');
    }
  }
}