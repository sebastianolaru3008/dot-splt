import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:split/src/theme/colors.dart';

abstract class ImageFinder {
  static const _imageFolder = 'assets/images/';

  //region Image paths
  static const _info = '${_imageFolder}profile_info.svg';
  static const _notificationsIconOutline = '${_imageFolder}notifications_outline.svg';
  static const _notificationsIconFilled = '${_imageFolder}notifications_filled.svg';
  static const _productsIconOutline = '${_imageFolder}products_outline.svg';
  static const _productsIconFilled = '${_imageFolder}products_filled.svg';
  static const _accountIconOutline = '${_imageFolder}account_outline.svg';
  static const _leftArrowIcon = '${_imageFolder}left_arrow.svg';
  static const _groceriesIcon = '${_imageFolder}groceries.svg';
  static const _wholeProductIcon = '${_imageFolder}whole_product.svg';
  static const _uploadIcon = '${_imageFolder}upload.svg';
  static const _joinIcon = '${_imageFolder}join.svg';

  //endregion

  //region Common image sizes
  static const _tabBarIconSize = 24.0;
  static const _topAppBarIconSize = 32.0;
  static const _bigIcon = 128.0;

  //endregion

  //region Profile icon sizes
  static const _profileIconSize = 20.0;
  //endregion

  static SvgPicture infoIcon({Color? color}) => SvgPicture.asset(
        _info,
        height: _tabBarIconSize,
        width: _tabBarIconSize,
        color: color ?? Colors.black,
      );

  static SvgPicture groceriesIcon({Color? color}) => SvgPicture.asset(
        _groceriesIcon,
        height: _tabBarIconSize,
        width: _tabBarIconSize,
        color: color ?? Colors.black,
      );

  static SvgPicture wholeProductIcon({Color? color}) => SvgPicture.asset(
        _wholeProductIcon,
        height: _tabBarIconSize,
        width: _tabBarIconSize,
        color: color ?? Colors.black,
      );

  static SvgPicture uploadIcon({Color? color}) => SvgPicture.asset(
        _uploadIcon,
        height: _bigIcon,
        width: _bigIcon,
        color: color ?? Colors.blueAccent,
      );

  static SvgPicture loginIcon({Color? color}) => SvgPicture.asset(
        _accountIconOutline,
        height: _bigIcon,
        width: _bigIcon,
        color: color ?? Colors.blueAccent,
      );

  static SvgPicture joinIcon({Color? color}) => SvgPicture.asset(
        _joinIcon,
        height: _bigIcon,
        width: _bigIcon,
        color: color ?? Colors.blueAccent,
      );

  static SvgPicture productsIcon({required bool isFilled, Color? color}) => SvgPicture.asset(
        isFilled ? _productsIconFilled : _productsIconOutline,
        height: _tabBarIconSize,
        width: _tabBarIconSize,
        color: color ?? CustomColor.white(),
      );

  static SvgPicture notificationsIcon({required bool isFilled, Color? color}) => SvgPicture.asset(
        isFilled ? _notificationsIconFilled : _notificationsIconOutline,
        height: _tabBarIconSize,
        width: _tabBarIconSize,
        color: color ?? CustomColor.white(),
      );

  static SvgPicture leftArrowIcon({Color? color}) => SvgPicture.asset(
        _leftArrowIcon,
        height: _topAppBarIconSize,
        width: _topAppBarIconSize,
        color: color ?? CustomColor.blue3(),
      );
}
