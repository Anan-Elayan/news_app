import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemplateCategoriesTitle extends StatelessWidget {
  const TemplateCategoriesTitle({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool isSelected;

   final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: isSelected ? 30 : 22,
            color: isSelected ? Colors.red : Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.red : Colors.white,
                fontSize: isSelected ? 19 : 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
