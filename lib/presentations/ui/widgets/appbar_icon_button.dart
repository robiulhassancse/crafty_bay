import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key, required this.icon, required this.ontap,
  });
  final IconData icon;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(100),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.grey.withOpacity(0.5),
        child: Icon(icon,color: Colors.black38,size: 20,),
      ),
    );
  }
}