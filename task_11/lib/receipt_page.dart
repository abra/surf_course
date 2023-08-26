import 'package:flutter/material.dart';
import 'package:task_11/colors.dart';

enum SortType {
  unsorted,
  ascendingTitle,
  descendingTitle,
  ascendingPrice,
  descendingPrice,
  ascendingType,
  descendingType,
}

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  SortType _sortType = SortType.unsorted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Чек № 56',
              style: TextStyle(
                color: darkBlue,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Text(
              '24.02.23 в 12:23',
              style: TextStyle(
                color: lightGrey,
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: BackButton(
          color: lightGreen,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Список покупок',
                    style: TextStyle(
                      color: darkBlue,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: _buildSortButtonWidget(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: Placeholder(),
            ),
            const SizedBox(height: 10),
            // Line
            const SizedBox(height: 10),
            const SizedBox(
              height: 150,
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _buildShowModalBottomSheet() {
    return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      elevation: 5,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(
      //     top: Radius.circular(30),
      //   ),
      // ),
      builder: (context) {
        return StatefulBuilder(builder: (context, setModalState) {
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
                width: double.infinity,
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
                          setModalState(() {});
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
                          setModalState(() {});
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
                          setModalState(() {});
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
                          setModalState(() {});
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
                          setModalState(() {});
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
                      value: SortType.ascendingType,
                      groupValue: _sortType,
                      onChanged: (SortType? value) {
                        if (value != null) {
                          _sortType = value;
                          setModalState(() {});
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
                      value: SortType.descendingType,
                      groupValue: _sortType,
                      onChanged: (SortType? value) {
                        if (value != null) {
                          _sortType = value;
                          setModalState(() {});
                          setState(() {});
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
                          backgroundColor:
                              MaterialStateProperty.all(lightGreen),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
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
        });
      },
    );
  }

  Widget _buildSortButtonWidget() {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: GestureDetector(
          onTap: _buildShowModalBottomSheet,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.sort_rounded,
                color: lightGrey,
              ),
              if (_sortType != SortType.unsorted)
                const Positioned(
                  right: 4,
                  bottom: 4,
                  child: Icon(
                    Icons.circle,
                    color: lightGreen,
                    size: 8,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
