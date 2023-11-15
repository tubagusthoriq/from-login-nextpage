import 'package:flutter/material.dart';
import 'product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tubagus Thoriq Akbar 3337210057',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.blue,
            ], // Gradien warna hitam ke abu-abu
          ),
        ),
        child: Center(
          child: Container(
            width: 300,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue[50], // Warna latar belakang formulir
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SignInForm(),
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  String _signInMessage = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _signInMessage = 'Sign In Success';
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductList()),
      );
    } else {
      setState(() {
        _autoValidate = AutovalidateMode.always;
        _signInMessage = 'Sign In Failed';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidate,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email), // Icon email di atas kolom email
              border: OutlineInputBorder(),
              hintText: 'Masukan Email Anda',
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email tidak boleh kosong';
              }
              if (!RegExp(
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zAZ]{2,}))$')
                  .hasMatch(value)) {
                return 'Masukkan email yang valid';
              }
              return null;
            },
          ),
          SizedBox(
              height: 16.0), // Jarak vertikal antara kolom email dan password
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon:
                  Icon(Icons.lock), // Icon kunci (lock) di atas kolom password
              border: OutlineInputBorder(),
              hintText: 'Masukan Password Anda',
            ),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password tidak boleh kosong';
              }
              if (value.length <= 12) {
                return 'Password minimal 12 karakter';
              }
              return null;
            },
          ),
          SizedBox(
              height:
                  10.0), // Jarak vertikal antara kolom password dan tombol "Sign In"
          ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[800], // Ubah warna tombol menjadi abu-abu
              ),
              child: Text('Sign In')),
          Text(
            _signInMessage,
            style: TextStyle(
              color: _signInMessage == 'Sign In Success'
                  ? Colors.green
                  : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
