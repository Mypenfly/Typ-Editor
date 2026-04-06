import 'package:flutter/material.dart';

///侧栏
class SideBar extends StatefulWidget {
  final bool isExpanded;
  final List<String> menuItems;
  SideBar({Key? key,required this.isExpanded,required this.menuItems}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  // bool _isExpanded = true;
  // List<String> _menuItems = ["file 1", "file 2", "file 3", "file 4"];
  Widget _buildBarContent() {
    return ListView.builder(
      itemCount: widget.menuItems.length,
      itemBuilder: (context, int index) {
        final item = widget.menuItems[index];

        return Center(
          child: Text(item, style: TextStyle(color: Colors.white, fontSize: 20)),
        );
      },
    );
  }

  Widget _getChild() {
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          if (widget.isExpanded) Expanded(child: _buildBarContent()),
        ],
      ),
    );
  }
  ///构建
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // width: _isExpanded ?250:25 ,
      child: _getChild(),
    );
  }
}
