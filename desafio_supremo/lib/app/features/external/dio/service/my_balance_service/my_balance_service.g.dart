// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_balance_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _MyBalanceService implements MyBalanceService {
  _MyBalanceService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://bank-statement-bff.herokuapp.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BalanceModel>? getMyBalance(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BalanceModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'myBalance',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BalanceModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
