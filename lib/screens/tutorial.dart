import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme.dart';
import '../state/app_state.dart';
import '../state/i18n.dart';
import '../widgets/common.dart';

/// 첫 실행 온보딩 튜토리얼 (3슬라이드). 건너뛰기 없음 — 모두 본 뒤 시작.
class TutorialScreen extends StatefulWidget {
  final VoidCallback onDone;
  const TutorialScreen({super.key, required this.onDone});
  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    final lang = app.lang;
    final slides = [
      (emoji: '📍', title: tr(lang, 'tut1_t'), desc: tr(lang, 'tut1_d'), hint: tr(lang, 'tut1_hint')),
      (emoji: '📅', title: tr(lang, 'tut2_t'), desc: tr(lang, 'tut2_d'), hint: tr(lang, 'tut2_hint')),
      (emoji: '👥', title: tr(lang, 'tut3_t'), desc: tr(lang, 'tut3_d'), hint: ''),
    ];
    final s = slides[idx];
    final isLast = idx == slides.length - 1;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFDF6C9), Color(0xFFFDE3C0)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(26, 24, 26, 26),
            child: Column(
              children: [
                // 언어 전환 (튜토리얼에서도 모국어로)
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => context.read<AppState>().cycleLang(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.line, width: 1.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text('🌐 ${AppState.langLabels[lang]}',
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.seaDeep)),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(s.emoji, style: const TextStyle(fontSize: 54)),
                      const SizedBox(height: 15),
                      Text(s.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              height: 1.35,
                              color: AppColors.ink)),
                      const SizedBox(height: 15),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 320),
                        child: Text(s.desc,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 13.5, color: AppColors.inkSoft, height: 1.7)),
                      ),
                      if (s.hint.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                          decoration: BoxDecoration(
                              color: AppColors.seaSoft, borderRadius: BorderRadius.circular(20)),
                          child: Text(s.hint,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.seaDeep)),
                        ),
                      ],
                    ],
                  ),
                ),
                // 점 인디케이터
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < slides.length; i++)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 3.5),
                        width: i == idx ? 22 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: i == idx ? AppColors.sea : const Color(0xFFE5DCC0),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                BigButton(tr(lang, isLast ? 'tut_start' : 'tut_next'), () {
                  if (isLast) {
                    widget.onDone();
                  } else {
                    setState(() => idx++);
                  }
                }),
                // 건너뛰기 버튼 없음 — 3슬라이드를 모두 본 뒤 시작.
              ],
            ),
          ),
        ),
      ),
    );
  }
}
