import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            GridItem(icon: Icons.home_work, text: 'السـكن', onPressed: () {
              // Action for Button 1
              print('Button 1 pressed');
            }),
            GridItem(icon: Icons.shopping_basket_outlined, text: 'Button 2', onPressed: () {
              // Action for Button 2
              print('Button 2 pressed');
            }),
            GridItem(icon: Icons.dark_mode_outlined, text: 'Button 3', onPressed: () {
              // Action for Button 3
              print('Button 3 pressed');
            }),
            GridItem(icon: Icons.mosque_outlined, text: 'Button 4', onPressed: () {
              // Action for Button 4
              print('Button 4 pressed');
            }),
            GridItem(icon: Icons.checkroom_outlined, text: 'Button 5', onPressed: () {
              // Action for Button 5
              print('Button 5 pressed');
            }),
            GridItem(icon: Icons.holiday_village, text: 'Button 6', onPressed: () {
              // Action for Button 6
              print('Button 6 pressed');
            }),
            GridItem(icon: Icons.storage, text: 'Button 7', onPressed: () {
              // Action for Button 7
              print('Button 7 pressed');
            }),
            
          ],
        ),
      ),
    );
  }
}
class GridItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const GridItem({required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Card(color: Colors.amberAccent,
              child: ElevatedButton(
                onPressed: onPressed,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(icon,size: 80,),
                    Text(text),
                  ],
                ),
                
              ),
            ),
          ),
          SizedBox(height: 8.0),
          
        ],
      ),
    );
  }
}
