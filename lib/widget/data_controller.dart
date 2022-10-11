import 'package:flutter/material.dart';

DataCell dataController({
  void Function()? onRemovePressed,
  void Function()? onEditPressed,
  void Function()? onViewPressed,
}) {
  return DataCell(
    Row(
      children: [
        if (onViewPressed != null)
          IconButton(
              icon: Icon(Icons.remove_red_eye), onPressed: onViewPressed),
        if (onEditPressed != null)
          IconButton(icon: Icon(Icons.edit), onPressed: onEditPressed),
        if (onRemovePressed != null)
          IconButton(icon: Icon(Icons.delete), onPressed: onRemovePressed)
      ],
    ),
  );
}
