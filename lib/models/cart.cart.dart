import 'package:flutter/material.dart';

class Game {
  final String title;
  final String description;
  final String price;
  final String imageUrl;
  final String location;
  final String rent;

  Game({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.location,
    required this.rent,
  });
}

class Cart with ChangeNotifier {
  // Start with an empty cart (no items)
  final List<Game> _items = [];

  List<Game> get items => _items;
//add items to cart 
  void addToCart(Game game) {
    _items.add(game);
    notifyListeners();
  }
//remov items from cart
  void removeFromCart(Game game) {
    _items.remove(game);
    notifyListeners();
  }
}

