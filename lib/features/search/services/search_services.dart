import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';

import '../../../constances/error_handling.dart';
import '../../../constances/global_variable.dart';
import '../../../constances/utils.dart';
import '../../../models/product.dart';
import '../../../providers/user_provider.dart';

class SearchServices {
  Future<List<Product>> fetchSearchedProduct({
    required BuildContext context,
    required String searchQuery,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/products/search/$searchQuery'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      print('error occured: $e');
      showSnackBar(context, e.toString());
    }
    return productList;
  }
}
