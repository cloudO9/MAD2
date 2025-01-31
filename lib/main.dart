import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/buyer/buyer_home_screen.dart';
import 'screens/buyer/cart_screen.dart';
import 'screens/buyer/buyer_profile_screen.dart';
import 'screens/seller/seller_profile_screen.dart';
import 'screens/seller/post_game_screen.dart';
import 'screens/seller/manage_games_screen.dart';
import 'screens/seller/subscription_screen.dart';
import 'theme/app_theme.dart';
import '/models/cart.cart.dart';
import 'widgets/custom_app_bar.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: const GamingMarketplaceApp(),
    ),
  );
}

class GamingMarketplaceApp extends StatelessWidget {
  const GamingMarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.purple,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.deepPurple,
          ),
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          routes: {
            '/login': (context) => const CustomScaffold(child: LoginScreen()),
            '/register': (context) => const CustomScaffold(child: RegisterScreen()),
            '/buyer_home': (context) => const CustomScaffold(child: BuyerHomeScreen()),
            '/cart_screen': (context) => const CustomScaffold(child: CartScreen()),
            '/buyer_profile_screen': (context) => const CustomScaffold(child: ProfileScreen()),
            '/seller_profile_screen': (context) => const CustomScaffold(child: SellerProfileScreen()),
            '/post_game_screen': (context) => const CustomScaffold(child: PostGameScreen()),
            '/manage_game_screen': (context) => const CustomScaffold(child: ManageGameScreen()),
            '/subscription_screen': (context) => const CustomScaffold(child: SubscriptionScreen()),
          },
          initialRoute: '/login',
        );
      },
    );
  }
}

/// Custom scaffold wrapper that applies the global app bar
class CustomScaffold extends StatelessWidget {
  final Widget child;

  const CustomScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Gaming Marketplace'),
      body: child,
    );
  }
}




