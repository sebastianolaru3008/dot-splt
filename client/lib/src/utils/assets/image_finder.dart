import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

abstract class ImageFinder {
  static const _imageFolder = 'assets/images/';

  //region Image paths
  static const _info = '${_imageFolder}info_circle_icon.svg';

  //endregion

  //region Common image sizes
  static const _statusIconSize = 24.0;

  //endregion

  static SvgPicture get infoIcon => SvgPicture.asset(
        _info,
        key: const Key('infoIcon'),
        height: _statusIconSize,
        width: _statusIconSize,
        color: Colors.blue,
      );
}
