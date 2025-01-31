import 'package:flutter/material.dart';
import '../buyer/buyer_home_screen.dart';
import '../seller/seller_profile_screen.dart';



//L O G I N  S C R E E N--------------------------------------------------------------------------------------------------------------------
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

//hardcoded login info depending on the user role 
  final String _buyerEmail = 'Buyer@gmail.com';
  final String _buyerPassword = 'Buyer123';

  final String _sellerEmail = 'Seller@gmail.com';
  final String _sellerPassword = 'Seller123';


//email validation
  void _login() {
    if (_formKey.currentState!.validate()) {
      String enteredEmail = _emailController.text.trim();
      String enteredPassword = _passwordController.text.trim();
      Widget nextScreen;

      if (enteredEmail == _buyerEmail && enteredPassword == _buyerPassword) {
        nextScreen = const BuyerHomeScreen();
      } else if (enteredEmail == _sellerEmail && enteredPassword == _sellerPassword) {
        nextScreen = const SellerProfileScreen();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
        return;
      }
//navigation transition/animation
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

//login form 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade900, Colors.indigo.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'GameX Login',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Anton',
                      color: Colors.yellow.shade400,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  _buildTextField(
                    controller: _emailController,
                    label: 'Email',
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: _passwordController,
                    label: 'Password',
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 10,
                    ),
                    onPressed: _login,
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Don’t have an account? ',
                        style: const TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'Register now',
                            style: TextStyle(
                              color: Colors.yellow.shade400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.yellow.shade400),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
    );
  }
}
