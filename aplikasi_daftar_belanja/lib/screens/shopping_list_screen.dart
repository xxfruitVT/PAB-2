import 'package:aplikasi_daftar_belanja/services/shopping_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final TextEditingController _controller = TextEditingController();
  final ShoppingService _shoppingService = ShoppingService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
