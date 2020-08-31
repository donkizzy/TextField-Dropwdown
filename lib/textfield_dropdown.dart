library textfield_dropdown;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldDropdown extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final ValueChanged<String> onChanged;
  final InputDecoration decoration;
  final Widget dropDownItem;
  final List<String> items;
  final FormFieldValidator<String> validator;

  const TextFieldDropdown(
      {Key key,
      this.controller,
      this.textInputType = TextInputType.text,
      this.onChanged,
      this.decoration,
      this.dropDownItem ,
      this.items,
      this.validator})
      : assert(controller != null ),
        assert(items != null),

        super(key: key);

  @override
  _TextFieldDropdownState createState() {
    return _TextFieldDropdownState(
        controller: controller,
        decoration: decoration,
        dropDownItem: dropDownItem,
        onChanged: onChanged,
        textInputType: textInputType,
        items: items,
        validator: validator);
  }
}

class _TextFieldDropdownState extends State<TextFieldDropdown> {
  final TextEditingController controller;
  final TextInputType textInputType;
  final ValueChanged<String> onChanged;
  final InputDecoration decoration;
  final Widget dropDownItem;
  final List<String> items;
  final FormFieldValidator<String> validator;

  _TextFieldDropdownState(
      {this.controller,
      this.textInputType,
      this.onChanged,
      this.decoration,
      this.dropDownItem,
      this.items,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          keyboardType: textInputType,
          onChanged: onChanged,
          decoration: decoration,
          validator: validator,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    setState(() {
                      controller.text = items[index];
                      items.clear();
                    });
                  },
                  child: dropDownItem);
            }),
      ],
    );
  }
}
