import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../color_entity.dart';
import '../color_manager.dart';
import '../widgets/color_thumbnail_widget.dart';
import 'color_selected_widget.dart';

class ColorGridViewWidget extends StatefulWidget {
  const ColorGridViewWidget({
    super.key,
    required this.manager,
  });

  final ColorManager manager;

  @override
  State<ColorGridViewWidget> createState() => _ColorGridViewWidgetState();
}

class _ColorGridViewWidgetState extends State<ColorGridViewWidget> {
  late Future<List<ColorEntity>> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.manager.getColorList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 80,
          left: 10,
          right: 10,
        ),
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Эксклюзивная палитра "Colored Box"',
                  style: TextStyle(
                    fontSize: 30,
                    height: 1,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF252838),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            FutureBuilder<List<ColorEntity>>(
              future: _future,
              builder: (context, AsyncSnapshot<List<ColorEntity>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  final data = snapshot.data!;
                  return SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1 / 1.5,
                    ),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final color = data[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ColorSelectedWidget(
                                name: color.name,
                                color: color.color,
                                hex: color.hex,
                              ),
                            ),
                          );
                        },
                        onLongPress: () async {
                          await Clipboard.setData(
                            ClipboardData(text: color.hex),
                          ).then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${color.hex} скопирован в буфер обмена',
                                ),
                              ),
                            );
                          });
                        },
                        child: ColorThumbnailWidget(
                          name: color.name,
                          color: color.color,
                          hex: color.hex,
                        ),
                      );
                    },
                  );
                } else {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }
}
