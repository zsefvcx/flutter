import 'package:flutter/material.dart';
import 'package:hotels/models/models.dart';
import 'package:hotels/views/widget/widget.dart';

class HotelsGridView extends StatelessWidget {
  const HotelsGridView({
    super.key,
    required bool listViewModeButton,
    required List<HotelPreview> hotels,
  }) : _listViewModeButton = listViewModeButton, _hotels = hotels;

  final bool _listViewModeButton;
  final List<HotelPreview> _hotels;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.constrainWidth();
          double mainAxisExtent = width/(_listViewModeButton?1.65:2.2)-20;

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _listViewModeButton?1:2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                mainAxisExtent: mainAxisExtent, // here set custom Height You Want
                childAspectRatio: 1,
              ),
              itemCount: _hotels.length,
              itemBuilder: (BuildContext context, int index) {
                return LiteListViewWidget(hotel: _hotels[index]
                    , liteType: _listViewModeButton);
              },
            ),
          );
        }
    );
  }
}