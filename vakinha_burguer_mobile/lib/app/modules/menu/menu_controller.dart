import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burguer_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burguer_mobile/app/models/product_model.dart';
import 'package:vakinha_burguer_mobile/app/repositories/auth/products/product_repository.dart';

class MenuController extends GetxController with LoaderMixin, MessagesMixin {
  final ProductRepository _productRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;

  MenuController({required ProductRepository productRepository})
      : _productRepository = productRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      _loading.toggle();
      await findAllProducts();
      _loading.toggle();
    } catch (e, s) {
      _loading.toggle();
      log('Error when searching for products', error: e, stackTrace: s);
      _message(MessageModel(
          title: 'Error',
          message: 'Error when searching for products',
          type: MessageType.error));
    }
  }

  Future<void> findAllProducts() async {
    final products = await _productRepository.findAll();
    menu.assignAll(products);
  }

  Future<void> refreshPage() async {
    try {
      await findAllProducts();
    } catch (e, s) {
      _loading.toggle();
      log('Error when searching for products', error: e, stackTrace: s);
      _message(MessageModel(
          title: 'Error',
          message: 'Error when searching for products',
          type: MessageType.error));
    }
  }
}
