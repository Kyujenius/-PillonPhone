import 'dart:ui';

import 'package:pill_on_phone/config/color_system.dart';

enum EBuy {
  buyComplete(
    koName: '구매 완료',
    enName: 'buyComplete',
    color: ColorSystem.error,
  ),
  manufacturing(
    koName: '제조 중',
    enName: 'manufacturing',
    color: ColorSystem.secondary,
  ),
  visitWaiting(
    koName: '방문 대기',
    enName: 'visitWaiting',
    color: ColorSystem.primary,
  ),
  visitComplete(
    koName: '방문 완료',
    enName: 'visitComplete',
    color: ColorSystem.neutral,
  ),
  ;

  final String koName;
  final String enName;
  final Color color;

  const EBuy({
    required this.koName,
    required this.enName,
    required this.color,
  });
}
