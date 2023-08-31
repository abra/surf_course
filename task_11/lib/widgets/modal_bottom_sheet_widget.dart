import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../common/sort_type.dart';

class ModalBottomSheetWidget extends StatefulWidget {
  const ModalBottomSheetWidget({
    super.key,
    required this.sortType,
  });

  final SortType sortType;

  @override
  State<ModalBottomSheetWidget> createState() => _ModalBottomSheetWidgetState();
}

class _ModalBottomSheetWidgetState extends State<ModalBottomSheetWidget> {
  late SortType _sortType;

  @override
  void initState() {
    super.initState();
    _sortType = widget.sortType;
  }

  void _onClose() {
    Navigator.of(context).pop(_sortType);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 4),
              Container(
                width: 24,
                height: 4,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: transparentLightGrey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Сортировка',
                        style: TextStyle(
                          color: darkBlue,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      child: const Icon(Icons.close, size: 24),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              RadioListTile<SortType>(
                fillColor: MaterialStateProperty.all(Colors.lightGreen),
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'Без сортировки',
                  style: TextStyle(
                    color: Color(0xFF252849),
                    fontSize: 16,
                  ),
                ),
                value: SortType.unsorted,
                groupValue: _sortType,
                onChanged: (SortType? value) {
                  if (value != null) {
                    _sortType = value;
                    setState(() {});
                  }
                },
              ),
              const Divider(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'По имени',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              RadioListTile<SortType>(
                fillColor: MaterialStateProperty.all(lightGreen),
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'По имени от А до Я',
                  style: TextStyle(
                    color: Color(0xFF252849),
                    fontSize: 16,
                  ),
                ),
                value: SortType.ascendingTitle,
                groupValue: _sortType,
                onChanged: (SortType? value) {
                  if (value != null) {
                    _sortType = value;
                    setState(() {});
                  }
                },
              ),
              RadioListTile<SortType>(
                fillColor: MaterialStateProperty.all(lightGreen),
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'По имени от Я до А',
                  style: TextStyle(
                    color: Color(0xFF252849),
                    fontSize: 16,
                  ),
                ),
                value: SortType.descendingTitle,
                groupValue: _sortType,
                onChanged: (SortType? value) {
                  if (value != null) {
                    _sortType = value;
                    setState(() {});
                  }
                },
              ),
              const Divider(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'По цене',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              RadioListTile<SortType>(
                fillColor: MaterialStateProperty.all(lightGreen),
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'По возрастанию',
                  style: TextStyle(
                    color: Color(0xFF252849),
                    fontSize: 16,
                  ),
                ),
                value: SortType.ascendingPrice,
                groupValue: _sortType,
                onChanged: (SortType? value) {
                  if (value != null) {
                    _sortType = value;
                    setState(() {});
                  }
                },
              ),
              RadioListTile<SortType>(
                fillColor: MaterialStateProperty.all(lightGreen),
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'По убыванию',
                  style: TextStyle(
                    color: Color(0xFF252849),
                    fontSize: 16,
                  ),
                ),
                value: SortType.descendingPrice,
                groupValue: _sortType,
                onChanged: (SortType? value) {
                  if (value != null) {
                    _sortType = value;
                    setState(() {});
                  }
                },
              ),
              const Divider(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'По типу',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              RadioListTile<SortType>(
                fillColor: MaterialStateProperty.all(lightGreen),
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'По типу от А до Я',
                  style: TextStyle(
                    color: Color(0xFF252849),
                    fontSize: 16,
                  ),
                ),
                value: SortType.ascendingCategory,
                groupValue: _sortType,
                onChanged: (SortType? value) {
                  if (value != null) {
                    _sortType = value;
                    setState(() {});
                  }
                },
              ),
              RadioListTile<SortType>(
                fillColor: MaterialStateProperty.all(lightGreen),
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'По типу от Я до А',
                  style: TextStyle(
                    color: Color(0xFF252849),
                    fontSize: 16,
                  ),
                ),
                value: SortType.descendingCategory,
                groupValue: _sortType,
                onChanged: (SortType? value) {
                  if (value != null) {
                    setState(() {
                      _sortType = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(lightGreen),
                  ),
                  onPressed: () {
                    _onClose();
                  },
                  child: const Text(
                    'Готово',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
