import 'package:flutter/material.dart';

typedef ItemBuilder<T> = Widget Function(T value);

class FilterView<T> extends StatelessWidget {
  const FilterView({
    Key? key,
    required this.filters,
    required this.currentFilter,
    required this.itemBuilder,
    required this.onChanged,
  }) : super(key: key);
  final T currentFilter;
  final List<T> filters;
  final ItemBuilder<T> itemBuilder;
  final ValueChanged<T>? onChanged;

  @override
  Widget build(BuildContext context) {
    final dropdownMenuItems = filters
        .map((filter) => DropdownMenuItem(
              value: filter,
              child: itemBuilder(filter),
            ))
        .toList();

    return DropdownButton<T>(
      value: currentFilter,
      items: dropdownMenuItems,
      onChanged: (value) {
        if (value != null) {
          onChanged?.call(value);
        }
      },
    );
  }
}

/*
class FilterView extends StatelessWidget {
  const FilterView({
    Key? key,
    required this.filters,
    required this.currentFilter,
    this.onChanged,
  }) : super(key: key);
  final String currentFilter;
  final List<String> filters;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final dropdownMenuItems = filters
        .map((filter) => DropdownMenuItem(value: filter, child: Text(filter)))
        .toList();

    return DropdownButton<String>(
      value: currentFilter,
      items: dropdownMenuItems,
      onChanged: (value) {
        if (value != null) {
          onChanged?.call(value);
        }
      },
    );
  }
}
*/
