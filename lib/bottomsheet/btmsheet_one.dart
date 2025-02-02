import 'package:flutter/material.dart';

class BtmsheetOne extends StatelessWidget {
  const BtmsheetOne({super.key});

  @override
  Widget build(BuildContext context) {
    void openModelBottomSheet() {
      showModalBottomSheet(
          scrollControlDisabledMaxHeightRatio: 20,
          //todo 1 : know about anchorPoint, Offset,
          // anchorPoint: const Offset(0.5, 0.6),
          // shape: Border.all(color: Colors.red),
          // constraints: const BoxConstraints(
          //   minHeight: 200,
          //   maxHeight: 400,
          // ),
          // elevation: 2,
          sheetAnimationStyle:
              //  AnimationStyle.noAnimation,
              AnimationStyle(
            curve: Curves.bounceInOut,
            duration: const Duration(milliseconds: 500),
          ),
          // backgroundColor: Colors.amber,
          useSafeArea: true,
          isScrollControlled: true,
          barrierLabel: 'bottomsheet',
          // barrierColor: Colors.transparent,
          showDragHandle: true,
          context: context,
          builder: (context) {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: openModelBottomSheet,
            child: const Text('Open model bottom sheet'))
      ],
    ));
  }
}
