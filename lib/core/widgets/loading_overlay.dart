import 'package:dr_purple/app/app_management/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingOverlay {
  BuildContext _context;

  void hide() => Navigator.pop(_context);

  void show() => showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const _FullScreenLoader();
        },
      );

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) =>
      LoadingOverlay._create(context);
}

class _FullScreenLoader extends StatefulWidget {
  const _FullScreenLoader({Key? key}) : super(key: key);

  @override
  State<_FullScreenLoader> createState() => _FullScreenLoaderState();
}

class _FullScreenLoaderState extends State<_FullScreenLoader> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        color: Colors.white.withAlpha(15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinKitSpinningLines(
              size: 100,
              color: ColorManager.darkPrimary,
              lineWidth: 4,
            ),
          ],
        ),
      ),
    );
  }
}
