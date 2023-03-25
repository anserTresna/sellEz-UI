import 'package:flutter/material.dart';
import 'package:sellez_mobile/main.dart';
import 'package:introduction_screen/introduction_screen.dart';


class ResponsiveNavBarPage extends StatelessWidget {
  ResponsiveNavBarPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;

    return Theme(
      data: ThemeData(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          titleSpacing: 0,
          leading: isLargeScreen
              ? null
              : IconButton(
                  color: Colors.grey,
                  icon: const Icon(Icons.menu),
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
          // title: Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const Text(
          //         "Logo",
          //         style: TextStyle(
          //             color: Colors.green, fontWeight: FontWeight.bold),
          //       ),
          //       if (isLargeScreen) Expanded(child: _navBarItems())
          //     ],
          //   ),
          // ),
          // actions: const [
          //   Padding(
          //     padding: EdgeInsets.only(right: 16.0),
          //     child: CircleAvatar(child: _ProfileIcon()),
          //   )
          // ],
        ),
        drawer: isLargeScreen ? null : _drawer(),
        body: const Center(
          child: Text(
            "Body",
          ),
        ),
      ),
    );
  }

  Widget _drawer() => Drawer(
        child: ListView(
          children: _menuItems
              .map((item) => ListTile(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    title: Text(item),
                  ))
              .toList(),
        ),
      );

  Widget _navBarItems() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _menuItems
            .map(
              (item) => InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
            .toList(),
      );
}

final List<String> _menuItems = <String>[
  'About',
  'Contact',
  'Settings',
  'Sign Out',
];

enum Menu { itemOne, itemTwo, itemThree }

// class _ProfileIcon extends StatelessWidget {
//   const _ProfileIcon({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<Menu>(
//         icon: const Icon(Icons.person),
//         offset: const Offset(0, 40),
//         onSelected: (Menu item) {},
//         itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
//               const PopupMenuItem<Menu>(
//                 value: Menu.itemOne,
//                 child: Text('Account'),
//               ),
//               const PopupMenuItem<Menu>(
//                 value: Menu.itemTwo,
//                 child: Text('Settings'),
//               ),
//               const PopupMenuItem<Menu>(
//                 value: Menu.itemThree,
//                 child: Text('Sign Out'),
//               ),
//             ]);
//   }
// }
