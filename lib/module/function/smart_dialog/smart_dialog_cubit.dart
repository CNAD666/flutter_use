import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_use/bean/common/btn_info.dart';

part 'smart_dialog_state.dart';

class SmartDialogCubit extends Cubit<SmartDialogState> {
  SmartDialogCubit() : super(SmartDialogState().init());

  ///测试功能模块
  void showFun(context, tag) async{
    switch (tag) {
      case 'showToast':
        SmartDialog.instance.showToast('toast弹窗测试toast弹窗测试toast');
        break;
      case 'showLoading':
        SmartDialog.instance.showLoading();
        await Future.delayed(Duration(seconds: 2));
        SmartDialog.instance.dismiss();
        break;
      case 'bottomDialog':
        SmartDialog.instance.show(
          alignmentTemp: Alignment.bottomCenter,
          clickBgDismissTemp: true,
          widget: _contentWidget(maxHeight: 400),
        );
        break;
      case 'topDialog':
        SmartDialog.instance.show(
          alignmentTemp: Alignment.topCenter,
          clickBgDismissTemp: true,
          widget: _contentWidget(maxHeight: 300),
        );
        break;
      case 'leftDialog':
        SmartDialog.instance.show(
          alignmentTemp: Alignment.centerLeft,
          clickBgDismissTemp: true,
          widget: _contentWidget(maxWidth: 260),
        );
        break;
      case 'rightDialog':
        SmartDialog.instance.show(
          alignmentTemp: Alignment.centerRight,
          clickBgDismissTemp: true,
          widget: _contentWidget(maxWidth: 260),
        );
        break;
      case 'penetrateDialog':
        SmartDialog.instance.show(
          alignmentTemp: Alignment.bottomCenter,
          clickBgDismissTemp: true,
          isPenetrateTemp: true,
          widget: _contentWidget(maxHeight: 400),
        );
        break;
    }
  }

  Widget _contentWidget({
    double maxWidth = double.infinity,
    double maxHeight = double.infinity,
  }) {
    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight, maxWidth: maxWidth),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 20, spreadRadius: 10)
        ],
      ),
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              //内容
              ListTile(
                leading: Icon(Icons.bubble_chart),
                title: Text('标题---------------$index'),
              ),

              //分割线
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
