import 'dart:developer';

import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/models/order.dart';
import 'package:vakinha_burguer_mobile/app/models/order_pix.dart';
import 'package:vakinha_burguer_mobile/app/repositories/auth/order/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final RestClient _restClient;

  OrderRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<OrderPix> createOrder(Order order) async {
    final result = await _restClient.post('/order/', {
      'userId': order.userId,
      'cpf': order.cpf,
      'address': order.address,
      'items': order.items
          .map((shoppingCard) => {
                'quantity': shoppingCard.quantity,
                'productId': shoppingCard.product.id
              })
          .toList()
    });
    if (result.hasError) {
      log(
        'Error when placing order ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException(message: 'Error when placing order');
    }
    return OrderPix.fromMap(result.body);
  }
}
