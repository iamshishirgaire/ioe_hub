import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String hintText;
  final T? selectedValue;
  final List<T> items;
  final Function(T?)? onChanged;
  final String Function(T) getItemLabel;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.getItemLabel,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<T>(
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 3),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.surfaceContainer,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            width: 1,
          ),
        ),
        offset: const Offset(0, -6),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      hint: Text(
        hintText,
        style: Theme.of(context).inputDecorationTheme.hintStyle,
      ),
      value: selectedValue,
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(getItemLabel(item)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
