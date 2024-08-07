import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}

bool isSecured = true;

Map<String, User> users = {
  'Haya@gmail.com': User(email: 'Haya@gmail.com', password: '1234'),
  'amena@gmail.com': User(email: 'amena@gmail.com', password: '4567'),
};

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 226, 117, 90),
          centerTitle: true,
          title: const Text(
            "Login Screen",
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
          leading: const Icon(
            Icons.settings,
            color: Colors.white,
            size: 27,
          ),
          actions: const [
            Icon(
              Icons.accessibility,
              color: Colors.white,
              size: 27,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.add_home_outlined,
              color: Colors.white,
              size: 27,
            ),
            SizedBox(
              width: 12,
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Text("Hello                        ",
            style: TextStyle(fontSize: 38,color: Colors.deepOrange,),
            ),
             Text("To Relax Your Mind             ",
            style: TextStyle(fontSize: 28,color: Color.fromARGB(204, 0, 0, 0),),
            ),
            Image.asset(
              'assets/login.jpg',
              height: 350,
              width: 420,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        label: Text("User Name or Email:"),
                        prefixIcon:
                            Icon(Icons.person, color: Colors.deepOrange),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        )),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isSecured,
                    decoration: InputDecoration(
                        label: Text("Enter Password:"),
                        prefixIcon: Icon(Icons.lock, color: Colors.deepOrange),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isSecured = !isSecured;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye,
                              color: Colors.deepOrange),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        )),
                  ),
                  SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      User user = users[emailController.text]!;

                      if (user.email == emailController.text &&
                          user.password == passwordController.text) {
                        print('logged');
                      } else {
                        print('Email or password is Wrong');
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepOrange,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(width: 30),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
        )
        );
  }
}
