import 'package:flutter/material.dart';

abstract final class AppFonts {
  AppFonts._();

  static const fontFamilyInter = 'inter';

  static const TextStyle _baseStyleInter = TextStyle(
    fontFamily: fontFamilyInter,
    letterSpacing: 0.5,
  );

  static TextStyle _styleInter({
    required double fontSize,
    required FontWeight fontWeight,
    double height = 1,
    FontStyle? fontStyle,
  }) {
    return _baseStyleInter.copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: height,
    );
  }

  // Inter variants (all weights)
  static final b3s34lightInter = _styleInter(
    fontSize: 34,
    fontWeight: FontWeight.w300,
    height: 40 / 34,
  );
  static final b4s34regularInter = _styleInter(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    height: 40 / 34,
  );
  static final b5s34mediumInter = _styleInter(
    fontSize: 34,
    fontWeight: FontWeight.w500,
    height: 40 / 34,
  );
  static final b6s34semiBoldInter = _styleInter(
    fontSize: 34,
    fontWeight: FontWeight.w600,
    height: 40 / 34,
  );
  static final b7s34boldInter = _styleInter(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    height: 40 / 34,
  );
  static final b8s34extraBoldInter = _styleInter(
    fontSize: 34,
    fontWeight: FontWeight.w800,
    height: 40 / 34,
  );
  static final b9s34blackInter = _styleInter(
    fontSize: 34,
    fontWeight: FontWeight.w900,
    height: 40 / 34,
  );

  static final b3s30lightInter = _styleInter(
    fontSize: 30,
    fontWeight: FontWeight.w300,
    height: 36 / 30,
  );
  static final b4s30regularInter = _styleInter(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    height: 36 / 30,
  );
  static final b5s30mediumInter = _styleInter(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    height: 36 / 30,
  );
  static final b6s30semiBoldInter = _styleInter(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    height: 36 / 30,
  );
  static final b7s30boldInter = _styleInter(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    height: 36 / 30,
  );
  static final b8s30extraBoldInter = _styleInter(
    fontSize: 30,
    fontWeight: FontWeight.w800,
    height: 36 / 30,
  );
  static final b9s30blackInter = _styleInter(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    height: 36 / 30,
  );

  static final b3s26lightInter = _styleInter(
    fontSize: 26,
    fontWeight: FontWeight.w300,
    height: 32 / 26,
  );
  static final b4s26regularInter = _styleInter(
    fontSize: 26,
    fontWeight: FontWeight.w400,
    height: 32 / 26,
  );
  static final b5s26mediumInter = _styleInter(
    fontSize: 26,
    fontWeight: FontWeight.w500,
    height: 32 / 26,
  );
  static final b6s26semiBoldInter = _styleInter(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    height: 32 / 26,
  );
  static final b7s26boldInter = _styleInter(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    height: 32 / 26,
  );
  static final b8s26extraBoldInter = _styleInter(
    fontSize: 26,
    fontWeight: FontWeight.w800,
    height: 32 / 26,
  );
  static final b9s26blackInter = _styleInter(
    fontSize: 26,
    fontWeight: FontWeight.w900,
    height: 32 / 26,
  );

  static final b3s24lightInter = _styleInter(
    fontSize: 24,
    fontWeight: FontWeight.w300,
    height: 32 / 24,
  );
  static final b4s24regularInter = _styleInter(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 32 / 24,
  );
  static final b5s24mediumInter = _styleInter(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 32 / 24,
  );
  static final b6s24semiBoldInter = _styleInter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
  );
  static final b7s24boldInter = _styleInter(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
  );
  static final b8s24extraBoldInter = _styleInter(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    height: 32 / 24,
  );
  static final b9s24blackInter = _styleInter(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    height: 32 / 24,
  );

  static final b3s22lightInter = _styleInter(
    fontSize: 22,
    fontWeight: FontWeight.w300,
    height: 28 / 22,
  );
  static final b4s22regularInter = _styleInter(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    height: 28 / 22,
  );
  static final b5s22mediumInter = _styleInter(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 28 / 22,
  );
  static final b6s22semiBoldInter = _styleInter(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 28 / 22,
  );
  static final b7s22boldInter = _styleInter(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 28 / 22,
  );
  static final b8s22extraBoldInter = _styleInter(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    height: 28 / 22,
  );
  static final b9s22blackInter = _styleInter(
    fontSize: 22,
    fontWeight: FontWeight.w900,
    height: 28 / 22,
  );

  static final b3s20lightInter = _styleInter(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    height: 28 / 20,
  );
  static final b4s20regularInter = _styleInter(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 28 / 20,
  );
  static final b5s20mediumInter = _styleInter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 28 / 20,
  );
  static final b6s20semiBoldInter = _styleInter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 28 / 20,
  );
  static final b7s20boldInter = _styleInter(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 28 / 20,
  );
  static final b8s20extraBoldInter = _styleInter(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    height: 28 / 20,
  );
  static final b9s20blackInter = _styleInter(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    height: 28 / 20,
  );

  static final b3s18lightInter = _styleInter(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    height: 26 / 18,
  );
  static final b4s18regularInter = _styleInter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 26 / 18,
  );
  static final b5s18mediumInter = _styleInter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 26 / 18,
  );
  static final b6s18semiBoldInter = _styleInter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 26 / 18,
  );
  static final b7s18boldInter = _styleInter(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 26 / 18,
  );
  static final b8s18extraBoldInter = _styleInter(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    height: 26 / 18,
  );
  static final b9s18blackInter = _styleInter(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    height: 26 / 18,
  );

  static final b3s16lightInter = _styleInter(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    height: 24 / 16,
  );
  static final b4s16regularInter = _styleInter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
  );
  static final b5s16mediumInter = _styleInter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
  );
  static final b6s16semiBoldInter = _styleInter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
  );
  static final b7s16boldInter = _styleInter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 24 / 16,
  );
  static final b8s16extraBoldInter = _styleInter(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    height: 24 / 16,
  );
  static final b9s16blackInter = _styleInter(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    height: 24 / 16,
  );

  static final b3s14lightInter = _styleInter(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 20 / 14,
  );
  static final b4s14regularInter = _styleInter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
  );
  static final b5s14mediumInter = _styleInter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
  );
  static final b6s14semiBoldInter = _styleInter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
  );
  static final b7s14boldInter = _styleInter(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 20 / 14,
  );
  static final b8s14extraBoldInter = _styleInter(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    height: 20 / 14,
  );
  static final b9s14blackInter = _styleInter(
    fontSize: 14,
    fontWeight: FontWeight.w900,
    height: 20 / 14,
  );

  static final b3s12lightInter = _styleInter(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    height: 16 / 12,
  );
  static final b4s12regularInter = _styleInter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
  );
  static final b5s12mediumInter = _styleInter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
  );
  static final b6s12semiBoldInter = _styleInter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
  );
  static final b7s12boldInter = _styleInter(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 16 / 12,
  );
  static final b8s12extraBoldInter = _styleInter(
    fontSize: 12,
    fontWeight: FontWeight.w800,
    height: 16 / 12,
  );
  static final b9s12blackInter = _styleInter(
    fontSize: 12,
    fontWeight: FontWeight.w900,
    height: 16 / 12,
  );

  static final b3s10lightInter = _styleInter(
    fontSize: 10,
    fontWeight: FontWeight.w300,
    height: 12 / 10,
  );
  static final b4s10regularInter = _styleInter(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 12 / 10,
  );
  static final b5s10mediumInter = _styleInter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 12 / 10,
  );
  static final b6s10semiBoldInter = _styleInter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 12 / 10,
  );
  static final b7s10boldInter = _styleInter(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    height: 12 / 10,
  );
  static final b8s10extraBoldInter = _styleInter(
    fontSize: 10,
    fontWeight: FontWeight.w800,
    height: 12 / 10,
  );
  static final b9s10blackInter = _styleInter(
    fontSize: 10,
    fontWeight: FontWeight.w900,
    height: 12 / 10,
  );

  // Italic variants Inter (size 16)
  static final b3s16lightItalicInter = _styleInter(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
    height: 24 / 16,
  );
  static final b4s16italicInter = _styleInter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 24 / 16,
  );
  static final b5s16mediumItalicInter = _styleInter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    height: 24 / 16,
  );
  static final b6s16semiBoldItalicInter = _styleInter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    height: 24 / 16,
  );
  static final b7s16boldItalicInter = _styleInter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    height: 24 / 16,
  );
  static final b8s16extraBoldItalicInter = _styleInter(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.italic,
    height: 24 / 16,
  );
  static final b9s16blackItalicInter = _styleInter(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    height: 24 / 16,
  );
}
