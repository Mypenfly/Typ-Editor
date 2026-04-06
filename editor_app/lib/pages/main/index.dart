import 'package:editor_app/pages/main/side_bar.dart';
import 'package:flutter/material.dart';

///主页
class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isExpandedBar = true;
  List<String> _menuItems = ["file 1", "file 2", "file 3", "file 4"];
  String _title = "unkwon";

  Widget _buildMainContent() {
    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey,
      child: Center(
        child: Text("首页", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu_sharp),
        onPressed: () => setState(() {
          _isExpandedBar = !_isExpandedBar;
        }),
      ),
      title: Text(_title, style: TextStyle(fontSize: 40, color: Colors.white)),
      backgroundColor: Colors.grey,
    );
  }

  Widget _buildBar() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: _isExpandedBar ? 250 : 0,
      child: SideBar(isExpanded: _isExpandedBar, menuItems: _menuItems),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _buildAppBar(),
      body: Row(
        children: [
          _buildBar(),
          Expanded(child: _buildMainContent()),
        ],
      ),
    );
  }
}
