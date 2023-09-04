import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorSelectedWidget extends StatelessWidget {
  ColorSelectedWidget({
    required this.name,
    required this.color,
    required this.hex,
    super.key,
  });

  final String name;
  final Color color;
  final String hex;

  late final Map<String, int> rgbMap = {
    'Red': color.red,
    'Blue': color.blue,
    'Green': color.green,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: color,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildColorNameWidget(),
                  const SizedBox(height: 20),
                  _buildHexColorWidget(context),
                  const SizedBox(height: 20),
                  _buildRgbColorRowWidget(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorNameWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildHexColorWidget(BuildContext context) {
    final hexColor = hex
        .replaceFirst(RegExp(r'ff'), '')
        .toUpperCase();

    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(
          ClipboardData(text: hexColor),
        ).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '$hexColor скопирован в буфер обмена',
              ),
            ),
          );
        });
      },
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.2,
              blurRadius: 30.0,
              offset: const Offset(0.0, 25.0),
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text('Hex'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Text(
                    hexColor,
                    style: const TextStyle(
                      color: Color(0xFF252838),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.copy,
                    color: Color(0xFFC8CBDC),
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRgbColorRowWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: rgbMap.keys.map((key) {
        return GestureDetector(
          onTap: () async {
            final rgbColor = rgbMap[key].toString();
            await Clipboard.setData(
              ClipboardData(text: rgbColor),
            ).then((value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'RGB $rgbColor скопирован в буфер обмена',
                  ),
                ),
              );
            });
          },
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0.2,
                  blurRadius: 30.0,
                  offset: const Offset(0.0, 25.0),
                ),
              ],
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(key),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      Text(
                        rgbMap[key].toString(),
                        style: const TextStyle(
                          color: Color(0xFF252838),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
