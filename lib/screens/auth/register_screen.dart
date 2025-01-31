import 'package:flutter/material.dart';


//R E G I S T E R  P A G E
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

//role selection when registering 
class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedRole;
  final List<String> _roles = ['Buyer', 'Seller'];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;// applying theme 


//go back to login if arrow is pressed 
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Your GameX Account", style: TextStyle(fontFamily: 'Anton')),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),

        //applying theme 
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
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    //register form 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Create Your GameX Account',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),

                        // Name Field
                        _buildTextField(
                          label: 'Name',
                          hint: 'Enter your name',
                          icon: Icons.person,
                        ),
                        const SizedBox(height: 16),

                        // Email Field
                        _buildTextField(
                          label: 'Email',
                          hint: 'Enter your email',
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 16),

                        // Password Field
                        _buildTextField(
                          label: 'Password',
                          hint: 'Enter a password',
                          icon: Icons.lock,
                          isPassword: true,
                        ),
                        const SizedBox(height: 16),

                        // Confirm Password Field
                        _buildTextField(
                          label: 'Confirm Password',
                          hint: 'Confirm your password',
                          icon: Icons.lock,
                          isPassword: true,
                        ),
                        const SizedBox(height: 16),

                        // Role Selection Dropdown
                        DropdownButtonFormField<String>(
                          value: _selectedRole,
                          items: _roles.map((role) {
                            return DropdownMenuItem(
                              value: role,
                              child: Text(role),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedRole = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Register as',
                            prefixIcon: const Icon(Icons.group, color: Colors.purpleAccent),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            labelStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select a role';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),

                        // Register Button
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purpleAccent,
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 8,
                            ),
                            // navigation to role based screens 
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (_selectedRole == 'Seller') {
                                  Navigator.pushReplacementNamed(context, '/seller_subscription');
                                } else if (_selectedRole == 'Buyer') {
                                  Navigator.pushReplacementNamed(context, '/buyer_home');
                                }
                              }
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
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
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextFormField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.purpleAccent),
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      //validating user input 
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (label == 'Email' && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }
}
