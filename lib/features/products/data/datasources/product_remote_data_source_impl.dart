import 'package:flutter_assignment_upwork/core/packages.dart';
import 'package:flutter_assignment_upwork/core/constants/api_constants.dart';
import 'package:flutter_assignment_upwork/core/network/json_utils.dart';
import 'package:flutter_assignment_upwork/features/products/data/datasources/product_remote_data_source.dart';
import 'package:flutter_assignment_upwork/features/products/data/models/product_model.dart';
import 'package:flutter_assignment_upwork/features/products/data/models/product_page_model.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  const ProductRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<ProductPageModel> getProducts({
    required int limit,
    required int skip,
  }) async {
    final response = await _dio.get<dynamic>(
      ApiConstants.products,
      queryParameters: {'limit': limit, 'skip': skip},
    );
    return ProductPageModel.fromJson(requireJsonMap(response.data));
  }

  @override
  Future<ProductModel> getProduct(int id) async {
    final response = await _dio.get<dynamic>('${ApiConstants.products}/$id');
    return ProductModel.fromJson(requireJsonMap(response.data));
  }
}
