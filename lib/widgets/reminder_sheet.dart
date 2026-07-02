import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme.dart';
import '../state/app_state.dart';
import '../state/i18n.dart';
import 'common.dart';

/// 💬 비공개 임금 리마인더 (사업장 v21 2단계 플로우 1단계).
/// 신고 이전 단계로, 앱이 사업주에게 정중한 알림을 보내 스스로 해결할 기회를 준다.
void showReminderSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.paper,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    builder: (_) => const _ReminderSheet(),
  );
}

class _ReminderSheet extends StatelessWidget {
  const _ReminderSheet();

  @override
  Widget build(BuildContext context) {
    final app = context.read<AppState>();
    final lang = app.lang;
    final nameCtrl = TextEditingController(text: app.workplace ?? tr(lang, 'p_site_v'));
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: .72,
      maxChildSize: .95,
      builder: (_, ctrl) => SingleChildScrollView(
        controller: ctrl,
        padding: EdgeInsets.fromLTRB(
            18, 12, 18, 26 + MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Container(
                    width: 42,
                    height: 5,
                    decoration: BoxDecoration(
                        color: AppColors.line, borderRadius: BorderRadius.circular(99)))),
            const SizedBox(height: 14),
            Text(tr(lang, 'rm_title'),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Text(tr(lang, 'rm_sub'),
                style: const TextStyle(fontSize: 12.5, color: AppColors.inkSoft, height: 1.45)),
            const SizedBox(height: 16),
            _label(tr(lang, 'rm_name_l')),
            TextField(controller: nameCtrl, decoration: _dec()),
            const SizedBox(height: 12),
            _label(tr(lang, 'rm_amt_l')),
            TextField(decoration: _dec(hint: tr(lang, 'rm_amt_ph'))),
            const SizedBox(height: 16),
            // 사업주에게 전달되는 미리보기
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: AppColors.seaSoft,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.line),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(tr(lang, 'rm_from'),
                    style: const TextStyle(
                        fontSize: 11.5, fontWeight: FontWeight.w800, color: AppColors.seaDeep)),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.line),
                  ),
                  child: Text(tr(lang, 'rm_bubble'),
                      style: const TextStyle(fontSize: 12.5, height: 1.55, color: AppColors.ink)),
                ),
                const SizedBox(height: 8),
                Text(tr(lang, 'rm_tone'),
                    style: const TextStyle(fontSize: 11, color: AppColors.inkSoft)),
              ]),
            ),
            const SizedBox(height: 16),
            BigButton(tr(lang, 'rm_send'), () {
              Navigator.of(context).pop();
              toast(context, tr(lang, 'toast_reminder'));
            }, color: AppColors.navy),
            const SizedBox(height: 4),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(tr(lang, 'rm_later'),
                  style: const TextStyle(fontSize: 13, color: AppColors.inkSoft)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(text,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.inkSoft)),
      );

  InputDecoration _dec({String? hint}) => InputDecoration(
        hintText: hint,
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(color: AppColors.line)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(color: AppColors.line)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(color: AppColors.sea, width: 1.5)),
      );
}
