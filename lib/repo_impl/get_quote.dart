import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:getx_testing/abstract_repos/get_quote_data.dart';
import 'package:getx_testing/api/api_endpoint.dart';
import 'package:getx_testing/api/get_api.dart';
import 'package:getx_testing/error/failure.dart';
import 'package:getx_testing/error/server_exception.dart';
import 'package:getx_testing/RANDOM/quote/models/quote_model.dart';

/// return QuoteModel when api call is successful
///
/// return `ServerException` when api call is unsuccessful

class GetQuoteImpl implements GetQuoteData {
  @override
  Future<Either<Failure, QuoteModel>> getDataFromApi() async {
    debugPrint("--------------------- Hello from impl ------------------");

    try {
      final data = await GetApi(API_ENDPOINT, "quotes").get();
      debugPrint("--------------------- Hello from impl ------------------");

      return Right(QuoteModel.fromJson(data[0]));
    } on ServerExecption catch (e) {
      throw ServerExecption(message: e.message);
    }
  }
}
