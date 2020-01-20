import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlexGridView extends StatefulWidget {
  final double rowSpacing;
  final double columnSpacing;
  final int rowCount;
  final int columnCount;
  final IndexedWidgetBuilder indexedWidgetBuilder;
  FlexGridView(
      {Key key,
      this.rowCount,
      this.columnCount,
      this.rowSpacing,
      this.columnSpacing,
      this.indexedWidgetBuilder})
      : super(key: key);
  @override
  _FlexGridViewState createState() => _FlexGridViewState();
}

class _FlexGridViewState extends State<FlexGridView> {
  Size _size;
  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_key.currentContext != null) {
        setState(() {
          _size = _key.currentContext.size;
        });
      }
    });
    super.initState();
  }

  double _getWidth() {
    return _size == null
        ? 0
        : _size.width - widget.rowSpacing * (widget.rowCount - 1);
  }

  double _getHeight() {
    return _size == null
        ? 0
        : _size.height - widget.columnSpacing * (widget.columnCount - 1);
  }

  double _getChildAspectRatio() {
    return _size == null
        ? 1
        : _getWidth() * widget.columnCount / widget.rowCount / _getHeight();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        key: _key,
        child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisSpacing: widget.rowSpacing,
            mainAxisSpacing: widget.columnSpacing,
            padding: EdgeInsets.all(0),
            crossAxisCount: widget.rowCount,
            childAspectRatio: _getChildAspectRatio(),
            children: List.generate(widget.rowCount * widget.columnCount,
                (index) => widget.indexedWidgetBuilder(context, index))));
  }
}
