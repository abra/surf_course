import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorSelectedWidget extends StatefulWidget {
  const ColorSelectedWidget({
    required this.name,
    required this.color,
    required this.hex,
    super.key,
  });

  final String name;
  final Color color;
  final String hex;

  @override
  State<ColorSelectedWidget> createState() => _ColorSelectedWidgetState();
}

class _ColorSelectedWidgetState extends State<ColorSelectedWidget> {
  String copiedColor = '';

  late final Map<String, int> rgbMap = {
    'Red': widget.color.red,
    'Blue': widget.color.blue,
    'Green': widget.color.green,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: widget.color,
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
        widget.name,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildHexColorWidget(BuildContext context) {
    final hexColor = widget.hex.replaceFirst(RegExp(r'#'), '').toUpperCase();

    const row = Row(
      children: [
        SizedBox(width: 10),
        Icon(
          Icons.copy,
          color: Color(0xFFC8CBDC),
          size: 16,
        ),
      ],
    );

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
        }).then((value) {
          setState(() {
            copiedColor = hexColor;
          });
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
                    '#$hexColor',
                    style: const TextStyle(
                      color: Color(0xFF252838),
                    ),
                  ),
                  copiedColor.isNotEmpty ? row : const SizedBox.shrink(),
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
            }).then((value) {
              setState(() {
                copiedColor = rgbColor;
              });
            });
          },
          child: SizedBox(
            height: 56,
            child: DecoratedBox(
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
          ),
        );
      }).toList(),
    );
  }
}
