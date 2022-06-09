// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_statement_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _DetailStatementService implements DetailStatementService {
  _DetailStatementService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://bank-statement-bff.herokuapp.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DetailStatementModel?> getStatementDetail(token, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<DetailStatementModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'myStatement/detail/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null
        ? null
        : DetailStatementModel.fromJson(_result.data!);
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
