import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Имя: Иван Иванов'),
            Text('Электронная почта: ivan@example.com'),
            Text('Телефон: +7 (123) 456-78-90'),
          ],
        ),
      ),
    );
  }
}
