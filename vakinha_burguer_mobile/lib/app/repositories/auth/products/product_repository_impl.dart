import 'dart:developer';

import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/models/product_model.dart';
import 'package:vakinha_burguer_mobile/app/repositories/auth/products/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RestClient _restClient;

  ProductRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<ProductModel>> findAll() async {
    final result = await _restClient.get('/products/');

    if (result.hasError) {
      log('Error when searching for products ${result.statusCode}',
          error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException(message: 'Error when searching for products');
    }

    return result.body
        .map<ProductModel>((p) => ProductModel.fromMap(p))
        .toList();
  }
}
