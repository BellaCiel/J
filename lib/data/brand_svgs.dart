/// 브랜드 로고 + 하단 탭 아이콘 SVG (flutter_svg의 SvgPicture.string으로 렌더).
/// 로고는 사용자가 제공한 jeju-j-icon.svg(현무암 j + 감귤), 배경 rect만 제거해 투명 처리.
/// 탭 아이콘은 jeju_pay 프로토타입 svgs.dart 이식.
library;

/// 앱 로고 (현무암 j + 감귤). 상단바·로그인 화면 공용.
const String kBrandLogoSvg = '''
<svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
  <path d="M 545 330 C 545 305, 585 300, 630 300 C 700 300, 770 305, 770 335 C 772 430, 768 560, 762 690 C 756 810, 700 918, 545 940 C 400 960, 235 940, 150 855 C 95 800, 110 700, 155 645 C 195 598, 265 585, 300 610 C 330 632, 322 690, 322 730 C 322 772, 355 800, 405 800 C 470 800, 512 762, 522 700 C 535 560, 540 440, 545 330 Z" fill="#4d4d4d" stroke="#333333" stroke-width="16" stroke-linejoin="round" stroke-linecap="round"/>
  <g fill="#a8a8a8">
    <ellipse cx="585" cy="360" rx="9" ry="13"/><ellipse cx="620" cy="398" rx="6" ry="9"/>
    <ellipse cx="600" cy="430" rx="5" ry="7"/><ellipse cx="640" cy="375" rx="4" ry="6"/>
    <ellipse cx="240" cy="645" rx="10" ry="14"/><ellipse cx="275" cy="665" rx="6" ry="9"/>
    <ellipse cx="248" cy="695" rx="6" ry="8"/><ellipse cx="288" cy="660" rx="5" ry="7"/>
    <ellipse cx="700" cy="700" rx="10" ry="15"/><ellipse cx="720" cy="745" rx="12" ry="16"/>
    <ellipse cx="705" cy="790" rx="13" ry="17"/><ellipse cx="640" cy="830" rx="11" ry="14"/>
    <ellipse cx="555" cy="870" rx="10" ry="13"/><ellipse cx="505" cy="880" rx="8" ry="11"/>
    <ellipse cx="560" cy="900" rx="9" ry="12"/>
  </g>
  <g transform="translate(0 -55)">
    <g transform="rotate(-3 650 190)">
      <path d="M 500 195 C 500 130, 570 95, 655 95 C 745 95, 805 135, 802 195 C 800 258, 740 300, 650 302 C 560 304, 500 260, 500 195 Z" fill="#F5A623" stroke="#CE7A0E" stroke-width="13" stroke-linejoin="round"/>
      <g fill="#CE7A0E"><circle cx="765" cy="222" r="5.5"/><circle cx="728" cy="238" r="6"/><circle cx="710" cy="258" r="5"/><circle cx="728" cy="264" r="5.5"/></g>
    </g>
    <path d="M 566 104 L 588 70 L 612 92 L 632 64 L 656 88 L 682 70 L 700 96 L 690 118 L 656 126 L 620 122 L 588 126 Z" fill="#1b7a3e" stroke="#0f5132" stroke-width="9" stroke-linejoin="round" stroke-linecap="round"/>
  </g>
</svg>
''';

// ---------- 하단 탭 아이콘 (jeju_pay 이식) ----------

const String kTabHomeSvg = '''
<svg viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg">
  <rect x="9" y="18" width="22" height="17" rx="2" fill="#fdf0d5" stroke="#3a3226" stroke-width="2"/>
  <path d="M7 19 L20 8 L33 19 Z" fill="#c9d4d0" stroke="#3a3226" stroke-width="2" stroke-linejoin="round"/>
  <circle cx="20" cy="27" r="6" fill="#f5a623" stroke="#d98324" stroke-width="1.5"/>
  <path d="M20 21 Q23 18 25 20 Q22 21 21 23 Z" fill="#3f7d4f"/>
  <circle cx="18" cy="27" r="1" fill="#3a3226"/><circle cx="22" cy="27" r="1" fill="#3a3226"/>
  <path d="M18 29 Q20 31 22 29" stroke="#3a3226" stroke-width="1.2" fill="none" stroke-linecap="round"/>
</svg>
''';

const String kTabRecordSvg = '''
<svg viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg">
  <rect x="11" y="7" width="20" height="26" rx="2" fill="#fff" stroke="#3a3226" stroke-width="2" transform="rotate(-5 20 20)"/>
  <line x1="15" y1="13" x2="27" y2="12" stroke="#3a3226" stroke-width="1.5" stroke-linecap="round"/>
  <line x1="15" y1="17" x2="27" y2="16" stroke="#3a3226" stroke-width="1.5" stroke-linecap="round"/>
  <circle cx="19" cy="26" r="5" fill="#f5a623" stroke="#d98324" stroke-width="1.3"/>
  <path d="M19 21 Q21 19 23 20 Q21 21 20 23 Z" fill="#3f7d4f"/>
  <path d="M25 24 l5 -4 2 2 -5 4 z" fill="#f5d020" stroke="#3a3226" stroke-width="1.2" stroke-linejoin="round"/>
</svg>
''';

const String kTabWorkSvg = '''
<svg viewBox="0 0 44 40" xmlns="http://www.w3.org/2000/svg">
  <rect x="4" y="12" width="20" height="26" rx="1.5" fill="#8ec5e8" stroke="#3a3226" stroke-width="1.6"/>
  <rect x="7" y="16" width="4.5" height="4.5" fill="#fff" stroke="#3a3226" stroke-width="1"/>
  <rect x="14" y="16" width="4.5" height="4.5" fill="#fff" stroke="#3a3226" stroke-width="1"/>
  <rect x="7" y="23" width="4.5" height="4.5" fill="#fff" stroke="#3a3226" stroke-width="1"/>
  <rect x="14" y="23" width="4.5" height="4.5" fill="#fff" stroke="#3a3226" stroke-width="1"/>
  <rect x="10" y="30" width="8" height="8" fill="#2b6cb0" stroke="#3a3226" stroke-width="1.2"/>
  <path d="M28 16 Q35 9 42 16 Q42 18.5 35 18.5 Q28 18.5 28 16 Z" fill="#8a8580" stroke="#5f5a54" stroke-width="1.3"/>
  <ellipse cx="35" cy="16" rx="7.5" ry="2" fill="#9a958f" stroke="#5f5a54" stroke-width="1.1"/>
  <path d="M28 18.5 Q28 38 35 38 Q42 38 42 18.5 Q35 21 28 18.5 Z" fill="#a8a39c" stroke="#5f5a54" stroke-width="1.3"/>
  <circle cx="32" cy="23" r="2.2" fill="#c4bfb8" stroke="#5f5a54" stroke-width="1"/>
  <circle cx="38" cy="23" r="2.2" fill="#c4bfb8" stroke="#5f5a54" stroke-width="1"/>
  <circle cx="32" cy="23.3" r="1" fill="#4a4540"/>
  <circle cx="38" cy="23.3" r="1" fill="#4a4540"/>
  <path d="M33.5 26 Q35 30 36.5 26 Q35 27.5 33.5 26 Z" fill="#8a8580" stroke="#5f5a54" stroke-width="0.9"/>
</svg>
''';

const String kTabCommSvg = '''
<svg viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg">
  <path d="M6 10 h18 a2 2 0 0 1 2 2 v8 a2 2 0 0 1 -2 2 h-11 l-5 4 v-4 h-2 a2 2 0 0 1 -2 -2 v-8 a2 2 0 0 1 2 -2 z" fill="#fff" stroke="#3a3226" stroke-width="2" stroke-linejoin="round"/>
  <circle cx="30" cy="27" r="6.5" fill="#f5a623" stroke="#d98324" stroke-width="1.5"/>
  <path d="M30 20.5 Q33 18 35 20 Q32 21 31 23 Z" fill="#3f7d4f"/>
  <circle cx="28" cy="27" r="1" fill="#3a3226"/><circle cx="32" cy="27" r="1" fill="#3a3226"/>
  <ellipse cx="30" cy="30" rx="1.6" ry="1" fill="#b5654a"/>
</svg>
''';

const String kTabSosSvg = '''
<svg viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg">
  <text x="20" y="16" text-anchor="middle" font-size="11" font-weight="900" fill="#e05a4a" font-family="Arial">SOS</text>
  <circle cx="20" cy="28" r="7" fill="#f5a623" stroke="#d98324" stroke-width="1.5"/>
  <path d="M20 21 Q23 18.5 25 20.5 Q22 21.5 21 23.5 Z" fill="#3f7d4f"/>
  <path d="M17 27 L19 28 M23 27 L21 28" stroke="#3a3226" stroke-width="1.3" stroke-linecap="round"/>
  <path d="M17 31 Q20 29 23 31" stroke="#3a3226" stroke-width="1.3" fill="none" stroke-linecap="round"/>
  <ellipse cx="26" cy="27" rx="1.5" ry="2.2" fill="#7fc4d9"/>
</svg>
''';

/// 탭 인덱스 순서(홈/기록/사업장/커뮤니티/SOS)에 맞춘 아이콘 목록.
const List<String> kTabSvgs = [
  kTabHomeSvg, kTabRecordSvg, kTabWorkSvg, kTabCommSvg, kTabSosSvg,
];
