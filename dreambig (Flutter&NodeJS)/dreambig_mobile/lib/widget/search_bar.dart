import 'package:dreambig_mobile/screens/scholl_from_country.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    required this.getList,
    required this.defaultString,
    this.onChanged,
  });

  final List<String> getList;
  final String defaultString;
  final ValueChanged<String?>? onChanged;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupProps: PopupProps.menu(
          showSearchBox: true,
          showSelectedItems: true,
          disabledItemFn: (String s) => s.startsWith('I'),
          menuProps: MenuProps(
              backgroundColor: Colors.white, elevation: 0,borderRadius: BorderRadius.circular(20))),
      items: widget.getList,
      dropdownDecoratorProps: DropDownDecoratorProps(
        //yazı rengini buradan değiştiriyorsun
        baseStyle: TextStyle(color: Colors.white),

        dropdownSearchDecoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.deepOrange,
              width: 2,
            ),
          ),
        ),
      ),
      onChanged: widget.onChanged ??
          (value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SchoolFromCountry(countryName: value!),
              ),
            );
          },
      selectedItem: widget.defaultString,
    );
  }
}
