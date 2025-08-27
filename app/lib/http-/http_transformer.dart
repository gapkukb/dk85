import 'dart:async';

import 'package:dio/dio.dart';

/// If the request data is a `List` type, the [BackgroundTransformer] will send data
/// by calling its `toString()` method. However, normally the List object is
/// not expected for request data( mostly need Map ). So we provide a custom
/// [Transformer] that will throw error when request data is a `List` type.

class MyTransformer extends BackgroundTransformer {
  @override
  Future transformResponse(
    RequestOptions options,
    ResponseBody responseBody,
  ) async {
    final body = await super.transformResponse(options, responseBody);
    if (body is Map && body['code'] != 200) {
      throw DioException(
        requestOptions: options,
        response: Response(requestOptions: options, data: body),
        error: body['message'],
        message: body['message'],
        type: DioExceptionType.badResponse,
      );
    }
    return body;
  }
}
