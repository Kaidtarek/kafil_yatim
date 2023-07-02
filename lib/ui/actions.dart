import 'package:flutter/material.dart';
import 'package:kafil_yatim/admin_show/family_ad/gridOfActions/orphan_home.dart';

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => orphan_info()));
            }),
            GridItem(icon: Icons.shopping_basket_outlined, text: ' القفة الشهرية ', onPressed: () {
              
            }),
            GridItem(icon: Icons.dark_mode_outlined, text: 'قفة رمضان ', onPressed: () {
              // Action for Button 3
              print('Button 3 pressed');
            }),
            GridItem(icon: Icons.mosque_outlined, text: 'عيد الاضحى', onPressed: () {
              // Action for Button 4
              print('Button 4 pressed');
            }),
            GridItem(icon: Icons.checkroom_outlined, text: 'عيد الفطر', onPressed: () {
            }),
            GridItem(icon: Icons.holiday_village, text: 'التخييمات', onPressed: () {
              
            }),
            GridItem(icon: Icons.storage, text: 'المستودع', onPressed: () {
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
