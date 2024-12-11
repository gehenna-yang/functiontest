// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:popup_menu_plus/popup_menu_plus.dart';

class PopUpMenuButton extends StatefulWidget {
  final String title;
  const PopUpMenuButton({Key? key, required this.title}) : super(key: key);

  @override
  State<PopUpMenuButton> createState() => _PopUpMenuButtonState();
}

class _PopUpMenuButtonState extends State<PopUpMenuButton> {
  PopupMenu? menu;
  GlobalKey btnKey = GlobalKey();
  GlobalKey btnKey2 = GlobalKey();
  GlobalKey btnKey3 = GlobalKey();
  GlobalKey btnKey4 = GlobalKey();
  GlobalKey btnKey5 = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void onClickMenu(PopUpMenuItemProvider item) {
    print('Click menu -> ${item.menuTitle}');
  }

  void onDismiss() {
    print('Menu is dismiss');
  }

  void onShow() {
    print('Menu is show');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.blue,
              child: MaterialButton(
                height: 45.0,
                key: btnKey,
                onPressed: maxColumn,
                child: const Text('Show Menu'),
              ),
            ),
            MaterialButton(
              key: btnKey2,
              height: 45.0,
              onPressed: customBackground,
              child: const Text('Show Menu'),
            ),
            MaterialButton(
              key: btnKey3,
              height: 45.0,
              onPressed: onDismissOnlyBeCalledOnce,
              child: const Text('Show Menu'),
            ),
            MaterialButton(
              key: btnKey5,
              height: 45.0,
              onPressed: menuCustom,
              child: const Text('Show Menu Custom'),
            ),
            MaterialButton(
              key: btnKey4,
              height: 45.0,
              onPressed: listMenu,
              child: const Text('List Menu'),
            ),
            MaterialButton(
              height: 30.0,
              onPressed: () {},
              child: const Text('Gestures Demo'),
            )
          ],
        ),
      ),
    );
  }

  void onDismissOnlyBeCalledOnce() {
    menu = PopupMenu(
      config: const MenuConfig(
        backgroundColor: Colors.green,
        lineColor: Colors.greenAccent,
        highlightColor: Colors.lightGreenAccent,
      ),
      context: context,
      items: [
        // MenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
        // MenuItem(title: 'Home', image: Icon(Icons.home, color: Colors.white,)),
        PopUpMenuItem(
            title: 'Mail', image: const Icon(Icons.mail, color: Colors.white)),
        PopUpMenuItem(
            title: 'Power',
            image: const Icon(Icons.power, color: Colors.white)),
        PopUpMenuItem(
            title: 'Setting',
            image: const Icon(Icons.settings, color: Colors.white)),
        PopUpMenuItem(
            title: 'PopupMenu',
            image: const Icon(Icons.menu, color: Colors.white))
      ],
      onClickMenu: onClickMenu,
      onDismiss: onDismiss,
    );
    menu!.show(widgetKey: btnKey3);
  }

  void maxColumn() {
    PopupMenu menu = PopupMenu(
      context: context,
      config: const MenuConfig(maxColumn: 3),
      duration: const Duration(milliseconds: 200),
      items: [
        PopUpMenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
        PopUpMenuItem(
            title: 'Power',
            image: const Icon(Icons.power, color: Colors.white)),
        PopUpMenuItem(
            title: 'Setting',
            image: const Icon(Icons.settings, color: Colors.white)),
        PopUpMenuItem(
            title: 'PopupMenu',
            image: const Icon(Icons.menu, color: Colors.white))
      ],
      onClickMenu: onClickMenu,
      onDismiss: onDismiss,
    );
    menu.show(widgetKey: btnKey);
  }

  void menuCustom() {
    PopupMenu menu = PopupMenu(
      context: context,
      config: MenuConfig(
          type: MenuType.custom,
          itemHeight: 200,
          itemWidth: 400,
          backgroundColor: Colors.blue,
          border: BorderConfig(
            width: 4,
            color: Colors.black,
          )),
      content: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
        ],
      ),
      onClickMenu: onClickMenu,
      onDismiss: onDismiss,
    );
    menu.show(widgetKey: btnKey5);
  }

  //
  void customBackground() {
    PopupMenu menu = PopupMenu(
        context: context,
        config: const MenuConfig(
          backgroundColor: Color(0xffc1e0f7),
          lineColor: Colors.tealAccent,
        ),
        items: [
          // PopUpMenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
          PopUpMenuItem(
              title: 'Home',
              image: const Icon(Icons.home, color: Colors.white)),
          PopUpMenuItem(
              title: 'Mail',
              image: const Icon(Icons.mail, color: Colors.white)),
          // PopUpMenuItem(
          //     title: 'Power',
          //     image: const Icon(Icons.power, color: Colors.white)),
          // PopUpMenuItem(
          //     title: 'Setting',
          //     image: const Icon(Icons.settings, color: Colors.white)),
          // PopUpMenuItem(
          //     title: 'PopupMenu',
          //     image: const Icon(Icons.menu, color: Colors.white))
        ],
        onClickMenu: onClickMenu,
        onDismiss: onDismiss);
    menu.show(widgetKey: btnKey2);
  }

  void listMenu() {
    PopupMenu menu = PopupMenu(
        context: context,
        config: MenuConfig.forList(
            border: BorderConfig(width: 2, color: Colors.black)),
        items: [
          // MenuItem.forList(
          //     title: 'Copy', image: Image.asset('assets/copy.png')),
          PopUpMenuItem.forList(
              title: 'Home',
              image:
                  const Icon(Icons.home, color: Color(0xFF181818), size: 20)),
          PopUpMenuItem.forList(
              title: 'Mail',
              image:
                  const Icon(Icons.mail, color: Color(0xFF181818), size: 20)),
          PopUpMenuItem.forList(
              title: 'Power',
              image:
                  const Icon(Icons.power, color: Color(0xFF181818), size: 20)),
          PopUpMenuItem.forList(
              title: 'Setting',
              image: const Icon(Icons.settings,
                  color: Color(0xFF181818), size: 20)),
          PopUpMenuItem.forList(
              title: 'PopupMenu',
              image: const Icon(Icons.menu, color: Color(0xFF181818), size: 20))
        ],
        onClickMenu: onClickMenu,
        onShow: onShow,
        onDismiss: onDismiss);
    menu.show(widgetKey: btnKey4);
  }
}
