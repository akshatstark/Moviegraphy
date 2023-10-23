import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  late double _devHeight;
  late double _devWidth;
  late TextEditingController _searchTextFieldController;

  @override
  Widget build(BuildContext context, WidgetRef watch) {
    _devHeight = MediaQuery.of(context).size.height;
    _devWidth = MediaQuery.of(context).size.width;
    _searchTextFieldController = TextEditingController();
    return buildUI();
  }

  Widget buildUI() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: _devHeight,
        width: _devWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _backgroundWidget(),
            _foregroundWidget(),
          ],
        ),
      ),
    );
  }

  Widget _backgroundWidget() {
    return Container(
        height: _devHeight,
        width: _devWidth,
        decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w220_and_h330_face/NNxYkU70HPurnNCSiCjYAmacwm.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
          ),
        ));
  }

  Widget _foregroundWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, _devHeight * 0.2, 0, 0),
      width: _devWidth * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start, //here
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidget(),
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return Container(
      height: _devHeight * 0.08,
      decoration: BoxDecoration(
          color: Colors.black54, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        // check wht happens if u remove this
        children: [
          _searchFieldWidget(),
          // _categorySelectionWidget(),
        ],
      ),
    );
  }

  Widget _searchFieldWidget() {
    final _border = InputBorder.none;
    return Container(
      height: _devHeight * 0.05,
      width: _devWidth * 0.50,
      child: TextField(
        controller: _searchTextFieldController,
        onSubmitted: (input) {},
        style: TextStyle(color: Colors.white54),
        decoration: InputDecoration(
            focusedBorder: _border,
            border: _border,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white54
            ),
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white54),
            filled: false,
          fillColor: Colors.white24,
        ),
      ),
    );
  }
}
