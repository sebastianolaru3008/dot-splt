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
  static const _accountIconFilled = '${_imageFolder}account_filled.svg';
  static const _leftArrowIcon = '${_imageFolder}left_arrow.svg';
  static const _profileAppearanceIcon = '${_imageFolder}profile_appearance.svg';
  static const _profileNotificationIcon = '${_imageFolder}profile_notification.svg';
  static const _profilePrivacyIcon = '${_imageFolder}profile_privacy.svg';
  static const _profileWalkthroughIcon = '${_imageFolder}profile_walkthrough.svg';
  static const _profilePhoneIcon = '${_imageFolder}profile_phone.svg';
  static const _profileInfoIcon = '${_imageFolder}profile_info.svg';

  //endregion

  //region Common image sizes
  static const _tabBarIconSize = 24.0;
  static const _topAppBarIconSize = 32.0;

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

  static SvgPicture accountIcon({required bool isFilled}) => SvgPicture.asset(
        isFilled ? _accountIconFilled : _accountIconOutline,
        height: _tabBarIconSize,
        width: _tabBarIconSize,
      );

  static SvgPicture leftArrowIcon({Color? color}) => SvgPicture.asset(
        _leftArrowIcon,
        height: _topAppBarIconSize,
        width: _topAppBarIconSize,
        color: color ?? CustomColor.blue3(),
      );

  static SvgPicture profileAppearanceIcon({Color? color}) => SvgPicture.asset(
        _profileAppearanceIcon,
        height: _profileIconSize,
        width: _profileIconSize,
        color: color ?? CustomColor.blue3(),
      );

  static SvgPicture profileNotificationIcon({Color? color}) => SvgPicture.asset(
        _profileNotificationIcon,
        height: _profileIconSize,
        width: _profileIconSize,
        color: color ?? CustomColor.blue3(),
      );

  static SvgPicture profilePrivacyIcon({Color? color}) => SvgPicture.asset(
        _profilePrivacyIcon,
        height: _profileIconSize,
        width: _profileIconSize,
        color: color ?? CustomColor.white(),
      );

  static SvgPicture profileWalkthroughIcon({Color? color}) => SvgPicture.asset(
        _profileWalkthroughIcon,
        height: _profileIconSize,
        width: _profileIconSize,
        color: color ?? CustomColor.blue3(),
      );

  static SvgPicture profilePhoneIcon({Color? color}) => SvgPicture.asset(
        _profilePhoneIcon,
        height: _profileIconSize,
        width: _profileIconSize,
        color: color ?? CustomColor.blue3(),
      );

  static SvgPicture profileInfoIcon({Color? color}) => SvgPicture.asset(
        _profileInfoIcon,
        height: _profileIconSize,
        width: _profileIconSize,
        color: color ?? CustomColor.blue3(),
      );
}
