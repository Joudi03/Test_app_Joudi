import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart'; // Import your Counter model

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(), // Provide the Counter model
      child: MaterialApp(
        title: 'Flutter Provider Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.blue[50], // Light blue background color
          appBarTheme: AppBarTheme(
           color: Colors.blue,  // AppBar color set to blue
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue, // Blue FAB
          ),
          textTheme: TextTheme(
            headlineMedium: TextStyle(color: Colors.blue, fontSize: 48), // Headline text style
            bodyMedium: TextStyle(color: Colors.blue[900]),  // Body text with dark blue
          ),
        ),
        home: CounterScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter with Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.bodyMedium, // Body text with blue color
            ),
            // Access the counter value from Provider
            Consumer<Counter>(
              builder: (context, counter, child) {
                return Text(
                  '${counter.count}',
                  style: Theme.of(context).textTheme.headlineMedium, // Blue headline text
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Access the Counter model to increment the count
          context.read<Counter>().increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
