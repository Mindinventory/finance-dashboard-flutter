import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finance_dashboard/constant/constant_public.dart';
import 'package:get/get.dart';

class CustomAlert {
  static void showAlert(String message, {
    String? title,
    String? btnFirst = 'Ok',
    String? btnSecond,
    void Function(int)? handler,
  }) {
    Get.generalDialog(
      barrierDismissible: false,
      barrierLabel: 'barrierLabel',
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Material(
          color: Colors.transparent,
          child: SafeArea(
            child: Center(
              child: Container(
                width: Get.width / 1.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            _titleWidget(title: title),
                            _messageWidget(message: message),
                            _buttonWidget(
                              ok: btnFirst,
                              cancel: btnSecond,
                              handler: handler,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _titleWidget({String? title}) {
    return (title == null)
        ? Container(height: 10)
        : Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: AppFontStyle.customAlertTitle,
      ),
    );
  }

  static Widget _messageWidget({String? message}) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: Get.height - 200),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            message ?? '',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  static Widget _buttonWidget({String? ok, String? cancel, Function? handler}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          (cancel == null)
              ? Container()
              : Expanded(
            child: InkWell(
              onTap: () {
                if (handler != null) {
                  handler(1);
                }

                Navigator.pop(Get.context!);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  // borderRadius: BorderRadius.all(Radius.circular(2)),
                  border: Border(
                    top: BorderSide(
                        color: Colors.grey.shade500, width: 0.5),
                    // right: BorderSide(
                    //     color: Colors.grey.shade500, width: 0.5),
                  )
                  ,),
                child: Center(
                  child: Text(
                    cancel,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                if (handler != null) {
                  handler(0);
                }

                Navigator.pop(Get.context!);
              },
              splashColor: AppColors.theme,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    // borderRadius: BorderRadius.all(Radius.circular(2)),
                    border: Border(
                        top:
                        BorderSide(color: Colors.grey.shade500, width: 0.5),
                        left: BorderSide(
                            color: Colors.grey.shade500, width: 0.5))),
                child: Center(
                  child: Text(
                    ok ?? '',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}