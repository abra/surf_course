import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../common/sort_type.dart';
import '../data/receipt.dart';
import '../widgets/modal_bottom_sheet_widget.dart';
import '../widgets/product_list_widget.dart';
import '../widgets/sort_button_widget.dart';

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
                  // child: _buildSortButtonWidget(),
                  child: SortButtonWidget(
                    sortType: _sortType,
                    onTap: () async {
                      final selectedType = await _showModalBottomSheet(
                        _sortType,
                      );

                      if (selectedType != null && _sortType != selectedType) {
                        setState(() {
                          _sortType = selectedType;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ProductListWidget(
                products: Receipt.products,
                sortType: _sortType,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<SortType?> _showModalBottomSheet(SortType sortType) async {
    return showModalBottomSheet<SortType>(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      elevation: 5,
      builder: (context) {
        return ModalBottomSheetWidget(sortType: sortType);
      },
    );
  }
}
