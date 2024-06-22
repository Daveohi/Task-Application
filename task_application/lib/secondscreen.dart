import 'package:flutter/material.dart';
import 'package:task_application/bottomnavigator.dart';
// import 'package:task_application/inicio.dart';
// import 'package:task_application/thirdpage.dart';


class Secondscreen extends StatefulWidget {
  const Secondscreen(
      {this.onChanged,
      //  this.onPressed,
      super.key});

  // final String onPressed;
  final Function(bool?)? onChanged;
  // final Function(bool?)? onPressed;

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  isLoading() => false;
  bool _isLight = false;
  bool _obscureText = true;

  void onTap(bool obscureText) {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid && _isChecked && _isLight) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Account Created Successfully'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BottomNavigator()));
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Crear una cuenta',
          style: TextStyle(fontSize: 35),
          maxLines: 2,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Text('Nombre'),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your Full Name',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 4) {
                      return 'Enter your Full Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const Text('Email'),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const Text('Contrasena'),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          onTap(_obscureText);
                        });
                      },
                    ),
                  ),
                  obscureText: _obscureText,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 0),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = true;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                    const Text(
                      'Debe tener al menos 8 caracteres',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 50,
                          ),
                        ),
                        Switch.adaptive(
                          activeColor: const Color(0xFF6C63FF),
                          value: _isLight,
                          onChanged: (bool value) {
                            setState(() {
                              _isLight = true;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                const Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Aceptar',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' Terminos y condiciones',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: OutlinedButton(
                    style: ButtonStyle(
                      fixedSize: WidgetStateProperty.all(const Size(500, 60)),
                      backgroundColor:
                          WidgetStateProperty.all(const Color(0xFF6C63FF)),
                      textStyle: WidgetStateProperty.all(
                        const TextStyle(fontSize: 20),
                      ),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                    ),
                    onPressed: () {
                      _submit();
                    
                    },
                    child: const Text(
                      'Registrarme',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    '-------------------- O registrate con --------------------',
                    style: TextStyle(color: Colors.black54, fontSize: 13, height: 2),
                  ),
                ),
                Center(
                  child: OutlinedButton(
                    style: ButtonStyle(
                      fixedSize: WidgetStateProperty.all(const Size(500, 60)),
                      backgroundColor:
                          WidgetStateProperty.all(const Color(0xFFffffFF)),
                      textStyle: WidgetStateProperty.all(
                        const TextStyle(fontSize: 20),
                      ),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                    ),
                    onPressed: () {
                      _submit();
                    
                    },
                    child: const Text(
                            ' Google',
                            style: TextStyle(color: Colors.black54, fontSize: 30),
                    ),
                  ),
                ),
                //   onPressed: () {
                //     _submit();
                //   },
                //   
                //   ),
                // ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Ya tenes una cuenta?',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        TextSpan(
                          text: ' Iniciar session',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                isLoading()
                    ? const CircularProgressIndicator()
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
