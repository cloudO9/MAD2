import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/theme/app_theme.dart';
import 'post_game_screen.dart';
import 'manage_games_screen.dart';
import 'subscription_screen.dart';
import '../auth/login_screen.dart';


//S E L L E R  P R O F I L E ------------------------------------------------------------------------------------------------------------
class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({super.key});

  @override
  _SellerProfileScreenState createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const SellerProfile(),
    const PostGameScreen(),
    const ManageGameScreen(),
    const SubscriptionScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

void _logout(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreen()),
  );
}


  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('GameX', style: TextStyle(fontFamily: 'Anton', fontSize: 22)),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.redAccent,
            tooltip: 'Logout',
            onPressed: () => _logout(context),
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDarkMode
                  ? [Colors.deepPurple.shade900, Colors.black87]
                  : [Colors.purpleAccent.shade100, Colors.blueAccent.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [Colors.black87, Colors.deepPurple.shade900]
                : [Colors.purple.shade100, Colors.blue.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(child: _widgetOptions[_selectedIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Post Games'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Manage Games'),
          BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: 'Subscription'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.grey.shade400,
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        onTap: _onItemTapped,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class SellerProfile extends StatelessWidget {
  const SellerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDarkMode
                  ? [Colors.deepPurple.shade800, Colors.deepPurple.shade600]
                  : [Colors.blue.shade100, Colors.purple.shade200],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: isDarkMode ? Colors.purpleAccent.withOpacity(0.4) : Colors.black26,
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: const AssetImage('assets/images/seller_avatar.png'),
                backgroundColor: isDarkMode ? Colors.deepPurple.shade900 : Colors.indigo.shade300,
              ),
              const SizedBox(height: 16),
              Text(
                'Seller Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.purpleAccent : Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'seller@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white70 : Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '+1 234 567 890',
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white70 : Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: () {
                  print("Edit Profile button pressed");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dark Mode', style: TextStyle(fontSize: 16, color: Colors.grey)),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                    activeColor: Colors.purpleAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
