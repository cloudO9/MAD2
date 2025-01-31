import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/bottom_nav_bar.dart';
import '/theme/app_theme.dart';



//B U Y E R  P R O F I L E -----------------------------------------------------------------------------------------------------------
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 2;

// buyer profile information hardcoded 
  final String name = "John Doe";
  final String email = "johndoe@example.com";
  final String phone = "+1 234 567 890";
  final String imageUrl = "https://www.w3schools.com/w3images/avatar2.png";


//bottom navigation 
  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/buyer_home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/cart_screen');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/buyer_profile_screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode;
//theme applying 
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [Colors.black, Colors.deepPurple.shade900]
                : [Colors.blue.shade100, Colors.purple.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                title: const Text('Profile', style: TextStyle(fontFamily: 'Anton')),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: isDarkMode
                              ? [Colors.blueGrey.shade900, Colors.deepPurple.shade700]
                              : [Colors.blue.shade300, Colors.purple.shade400],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isDarkMode ? Colors.purpleAccent.withOpacity(0.5) : Colors.blueGrey.withOpacity(0.3),
                            blurRadius: 12,
                            spreadRadius: 3,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(imageUrl),
                            backgroundColor: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isDarkMode ? Colors.purpleAccent : Colors.blueAccent,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(60),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.purpleAccent : Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            email,
                            style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white70 : Colors.grey[600]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            phone,
                            style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white70 : Colors.grey[600]),
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: () {
                              //edit profile button not functional
                              print("Edit profile clicked");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isDarkMode ? Colors.deepPurpleAccent : Colors.purpleAccent,
                              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 8,
                            ),
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Dark Mode", style: TextStyle(fontSize: 16, color: Colors.white70)),
                              Switch(//toggle to switch between light and dark mode 
                                value: themeProvider.isDarkMode,
                                onChanged: (value) {
                                  themeProvider.toggleTheme();
                                },
                                activeColor: Colors.purpleAccent,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () { //when pressed logout go back to the log in page 
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 8,
                            ),
                            child: const Text(
                              'Logout',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
  }
}
