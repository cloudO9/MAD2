import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/cart.cart.dart';
import '../../widgets/bottom_nav_bar.dart';


//B U Y E R  CART --------------------------------------------------------------------------------------------------------------------------
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}


// navigation 
class _CartScreenState extends State<CartScreen> {
  final int _currentIndex = 1;

  void _onNavItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/buyer_home');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/buyer_profile_screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>( //theme applying 
      builder: (context, cart, child) {
        List<Game> cartItems = cart.items;
        bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
        double screenWidth = MediaQuery.of(context).size.width;

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDarkMode
                    ? [Colors.black87, Colors.deepPurple.shade900]
                    : [Colors.purple.shade100, Colors.deepPurple.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  AppBar(
                    title: const Text('Your Cart', style: TextStyle(fontFamily: 'Anton')),
                    centerTitle: true,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                  Expanded(
                    child: cartItems.isEmpty //if cart is empty 
                        ? Center(
                            child: Text(
                              'Your cart is empty.',
                              style: TextStyle(
                                fontSize: 18,
                                color: isDarkMode ? Colors.white70 : Colors.black87,
                              ),
                            ),
                          )
                          //if items are added to the cart 
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              Game game = cartItems[index];

                              return Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                    colors: isDarkMode
                                        ? [Colors.deepPurple.shade900, Colors.black87]
                                        : [Colors.purple.shade300, Colors.deepPurple.shade400],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: isDarkMode ? Colors.purpleAccent.withOpacity(0.5) : Colors.black26,
                                      blurRadius: 12,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                              child: ListTile(
  contentPadding: const EdgeInsets.all(16),
  leading: ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.asset(
      game.imageUrl, // Use the game's actual image URL
      width: screenWidth > 600 ? 80 : 60,
      height: screenWidth > 600 ? 80 : 60,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.image_not_supported, size: 60, color: Colors.grey);
      },
    ),

                               ),
                                  title: Text(
                                    game.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth > 600 ? 20 : 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Price: ${game.price}',
                                        style: TextStyle(
                                          fontSize: screenWidth > 600 ? 16 : 14,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              print("Contacting Seller for ${game.title}");
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.purpleAccent,
                                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                            ),
                                            child: Text(
                                              'Contact Seller',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: screenWidth > 600 ? 16 : 14,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          IconButton(
                                            icon: Icon(Icons.remove_shopping_cart, color: Colors.white),
                                            onPressed: () {
                                             
                                              cart.removeFromCart(game); // remove item from cart
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavBar(
            currentIndex: _currentIndex,
            onTap: _onNavItemTapped,
          ),
        );
      },
    );
  }
}
