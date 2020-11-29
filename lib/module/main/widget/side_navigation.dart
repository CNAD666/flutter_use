import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_use/app/typedef/function.dart';
import 'package:flutter_use/app/utils/ui/auto_ui.dart';

///NavigationRail组件为侧边栏
class SideNavigation extends HookWidget {
  SideNavigation({
    this.onItem,
    @required this.selectedIndex,
    @required this.sideItems,
  });

  ///侧边栏item
  final List sideItems;

  ///选择的index
  final int selectedIndex;
  final ParamSingleCallback onItem;

  @override
  Widget build(BuildContext context) {
    return _navigationRailSide(context);
  }

  //增加NavigationRail组件为侧边栏
  Widget _navigationRailSide(BuildContext context) {
    final isExtend = useState(false);

    //顶部widget
    Widget topWidget = Center(
      child: Container(
        width: auto(80),
        height: auto(80),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(
                  "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3383029432,2292503864&fm=26&gp=0.jpg"),
              fit: BoxFit.cover),
        ),
      ),
    );

    //底部widget
    Widget bottomWidget = Container(
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(20),
      child: Wrap(
        direction: Axis.vertical,
        spacing: auto(20),
        children: [
          //展开按钮
          CupertinoSwitch(
            value: isExtend.value,
            onChanged: (value) {
              isExtend.value = !isExtend.value;
            },
          ),
        ],
      ),
    );

    return NavigationRail(
      backgroundColor: Colors.white,
      //阴影Z轴高度
      elevation: 3,
      extended: isExtend.value,
      labelType: isExtend.value
          ? NavigationRailLabelType.none
          : NavigationRailLabelType.selected,
      //侧边栏中的item
      destinations: sideItems.map((item) {
        return NavigationRailDestination(
          icon: item.icon,
          label: Container(
            padding: EdgeInsets.only(top: auto(10)),
            child: Text(
              item.title,
            ),
          ),
        );
      }).toList(),
      //顶部widget
      leading: topWidget,
//    //底部widget
      trailing: bottomWidget,
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) {
        onItem(index);
      },
    );
  }
}
