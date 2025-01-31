import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/cart.cart.dart';
import '../../widgets/game_card.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../theme/app_theme.dart';



//B U Y E R  H O M E S C R E E N ---------------------------------------------------------------------------------------------------------
class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({super.key});

  @override
  _BuyerHomeScreenState createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
//list of items in the home screen page 
  final List<Map<String, String>> games = [
    {
      'title': 'ELDEN RING',
      'description': 'Explore magical lands and uncover hidden secrets.',
      'price': 'LKR 950',
      'location': 'Kandy',
      'rent': 'No',
      'image.asset': 'assets/images/elden_ring.png',
    },
     {
      'title': 'GTA',
      'description': 'Explore magical lands and uncover hidden secrets.',
      'price': 'LKR 950',
      'location': 'Kandy',
      'rent': 'No',
      'image.asset': 'assets/images/GTA.png',
    },
     {
      'title': 'CALL OF DUTY',
      'description': 'Explore magical lands and uncover hidden secrets.',
      'price': 'LKR 950',
      'location': 'Kandy',
      'rent': 'No',
      'image.asset': 'assets/images/cod.png',
    },
     {
      'title': 'FARCRY6',
      'description': 'Explore magical lands and uncover hidden secrets.',
      'price': 'LKR 950',
      'location': 'Kandy',
      'rent': 'No',
      'image.asset': 'assets/images/farcry.png',
    },
     {
      'title': 'TEKKEN 8',
      'description': 'Explore magical lands and uncover hidden secrets.',
      'price': 'LKR 950',
      'location': 'Kandy',
      'rent': 'No',
      'image.asset': 'assets/images/tekken8.png',
    },
     {
      'title': 'TEKKEN 8',
      'description': 'Explore magical lands and uncover hidden secrets.',
      'price': 'LKR 950',
      'location': 'Kandy',
      'rent': 'No',
      'image.asset': 'assets/images/uncharted4.png',
    },
  ];

  //bottom navigation

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.pushReplacementNamed(context, '/cart_screen');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/buyer_profile_screen');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/chat_screen');
        break;
    }
  }

//show game detail when clicked 
 void _showGameDetailsDialog(Map<String, String> game) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          game['title']!,
          style: const TextStyle(
            color: Colors.purpleAccent,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.grey[900],
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Centered image with configurable size
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  game['image.asset']!,
                  width: 180,
                  height: 180, 
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16), 
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Description: ${game['description']}',
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Price: ${game['price']}',
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Location: ${game['location']}',
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Rent: ${game['rent']}',
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        actions: [
          // Close button styled
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                foregroundColor: Colors.purpleAccent, // Corrected styling
              ),
              child: const Text(
                'Close',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          // Add to Cart button styled
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              onPressed: () {
                final newGame = Game(
                  title: game['title']!,
                  description: game['description']!,
                  price: game['price']!,
                  imageUrl: game['image.asset']!,
                  location: game['location']!,
                  rent: game['rent']!,
                );
                Provider.of<Cart>(context, listen: false).addToCart(newGame);
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                foregroundColor: Colors.white, // Corrected styling
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode;
//dark mode light mode theme application
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Games', style: TextStyle(fontFamily: 'Anton')),
        centerTitle: true,
        elevation: 4,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDarkMode
                  ? [Colors.deepPurple, Colors.black87]
                  : [Colors.deepPurpleAccent, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Animated background gradient
          AnimatedContainer(
            duration: const Duration(seconds: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.purple.shade900, Colors.deepPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: isDarkMode ? Colors.deepPurpleAccent.shade200 : Colors.purple.shade300,
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),//search box 
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black87,
                      labelText: 'Search Games',
                      labelStyle: const TextStyle(color: Colors.white70),
                      suffixIcon: const Icon(Icons.search, color: Colors.purpleAccent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
              ),
              // grid view in the home page 
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: games.length,
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return GameCard(
                      title: game['title']!,
                      description: game['description']!,
                      price: game['price']!,
                      imageUrl: game['image.asset']!,
                      onTap: () {
                        _showGameDetailsDialog(game);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}

