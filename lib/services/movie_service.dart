

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../api.dart';
import '../api_exception.dart';
import '../models/movie.dart';

class MovieService{
  static  Future<Either<String, List<Movie>>> getMovieByCategory ({required String apiPath, required int page}) async{
    final dio = Dio();
    try{
      if(apiPath == Api.getPopular){
        final response = await dio.get(apiPath,
            queryParameters: {
              'api_key': '2a0f926961d00c667e191a21c14461f8',
              'page': 1,
              'language': 'en-US'
            }
        );
        Hive.box<String>('data').put('movies', jsonEncode(response.data));

      }
      final response = await dio.get(apiPath,
          queryParameters: {
            'api_key': '2a0f926961d00c667e191a21c14461f8',
            'page': page,
            'language': 'en-US'
          }
      );
      final data = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
      return  right(data);
    }on DioError catch (err){
      final errMessage =  DioException().getDioError(err);
      if(errMessage == 'No Internet.' && apiPath == Api.getPopular){
        final box =    Hive.box<String>('data');
        if(box.isNotEmpty){
          final data = box.get('movies');
          final movieData = (jsonDecode(data!)['results'] as List).map((e) => Movie.fromJson(e)).toList();
          return  right(movieData);

        }else{
          return  left(errMessage);
        }
      }else{
        return  left(errMessage);
      }

    }

  }
}