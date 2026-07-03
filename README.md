# 제이 (제주 이주민 · Jeju Migrant Workers)

**제주 이주노동자를 위한 임금체불 대응·근무기록 앱** — Flutter로 만든 다국어(한국어·English·Tiếng Việt·Bahasa Indonesia) 모바일/웹 앱입니다.
계약서가 없어도 **GPS 출퇴근 기록**이 증거가 되고, 임금체불 시 **진정서 초안 자동 생성**·**커뮤니티 상담**·**긴급 도움 창구**로 이어집니다.

> ⚠️ 이 앱이 제공하는 진정서·법령 안내는 이해를 돕기 위한 **참고용**이며 법률 자문이 아닙니다. 실제 신청 전 고용노동부(1350)·제주외국인노동자지원센터(064-712-1141)에서 확인하세요.

---

## ✨ 주요 기능

| 탭 | 기능 |
|---|---|
| 🏠 **홈** | 프로필(아바타 커스터마이징)·매일 출석 체크(포인트)·제주 임금체불 통계·국적별 현황·프로필 편집·친구 초대 |
| 📋 **기록** | GPS 출퇴근 체크인/아웃, 주간 근무 요약(근무일·시간·연속기록), 출퇴근 알림 설정, 증거함, **진정서 초안 생성(AI)** |
| 🏢 **사업장** | 제주 채용 사업장 목록(급여·고용형태·신고 이력), 검색, 2단계 임금문제 대응(비공개 리마인더 → 신고) |
| 💬 **커뮤니티** | 질문·경험 공유, 댓글, **AI 자동번역**(글을 내 언어로), 좋아요, 글쓰기(+포인트) |
| 🆘 **SOS** | 상황별 대응 안내, 정부 지원제도, 무료 상담 창구 |

- **다국어**: 시스템 언어 자동 감지 + 앱 내 전환(ko/en/vi/id). 로그인 전에도 전환 가능.
- **온보딩**: 첫 실행 시 3단계 튜토리얼 → 회원가입(계정 → 사업지 등록).
- **아바타**: 피부색·옷·모자·소품을 골라 프로필 캐릭터 꾸미기(SVG 합성).
- **친구 초대**: 초대 코드 공유 → 코드 입력 시 초대자·입력자 모두 포인트.

---

## 🧱 기술 스택

- **프론트엔드**: Flutter (Dart) — 모바일(iOS/Android) + 웹
- **상태관리**: `provider`
- **백엔드(DB·인증)**: [Supabase](https://supabase.com) (PostgreSQL + Auth + RLS) — 앱에서 직접 연결
- **백엔드(AI)**: NestJS 서버 — 진정서 초안 생성·커뮤니티 번역 (Google Gemini / Anthropic Claude)
- **주요 패키지**: `supabase_flutter`, `flutter_svg`, `shared_preferences`, `geolocator`, `pdf`, `printing`, `http`, `intl`

---

## 📁 폴더 구조 — 무엇을 커밋(저장)해야 하나요?

Git에 **커밋해야 하는(필수)** 폴더/파일과, **커밋하지 않는(자동 생성)** 것을 구분하세요.

```
J/
├── lib/                      ✅ 앱 소스코드 (핵심 — 반드시 저장)
│   ├── main.dart             앱 진입점 · 로그인 게이트
│   ├── theme.dart            색상·테마
│   ├── screens/              화면: home/record/workplace/community/sos, auth, tutorial, main_shell
│   ├── widgets/              시트·공통 위젯: 상점·페이월·진정서·리마인더·초대·프로필편집·시간선택 등
│   ├── services/             Supabase·진정서·번역 API 연동
│   ├── state/                app_state(전역상태) · i18n(다국어 문자열)
│   └── data/                 사업장 모델 · 아바타/브랜드 SVG
├── supabase/
│   └── schema.sql            ✅ DB 스키마 + RLS + 시드 (Supabase에서 실행)
├── pubspec.yaml              ✅ 의존성 정의 (필수)
├── pubspec.lock              ✅ 의존성 잠금 (권장 저장)
├── analysis_options.yaml     ✅ 린트 설정
├── android/ ios/ web/        ✅ 플랫폼 실행 파일 (빌드에 필요 — 저장)
│   windows/ linux/ macos/
├── .gitignore                ✅ 저장
├── README.md                 ✅ 저장
│
├── build/                    ❌ 커밋 금지 (빌드 산출물 — 자동 생성)
└── .dart_tool/ .idea/        ❌ 커밋 금지 (도구 캐시 — 자동 생성)
```

> 핵심만 말하면: **`lib/`, `pubspec.yaml`, `pubspec.lock`, `supabase/`, `android`~`macos/`, 설정 파일**만 있으면 누구나 `flutter pub get` 후 실행할 수 있습니다. `build/`·`.dart_tool/`은 `.gitignore`로 자동 제외됩니다.

---

## ▶️ 실행 (프론트엔드)

```bash
git clone https://github.com/BellaCiel/J.git
cd J
flutter pub get
flutter run -d chrome     # 웹으로 실행 (또는 -d <기기>)
```

웹 배포용 빌드:
```bash
flutter build web         # 결과물: build/web  (GitHub Pages 등에 배포)
```

> 백엔드가 없어도 앱은 죽지 않고 폴백(빈 목록·로컬 값)으로 화면이 뜹니다. 로그인·DB·AI 기능을 쓰려면 아래 백엔드 설정이 필요합니다.

---

## 🔧 백엔드 구현 방법

백엔드는 **① Supabase(DB·인증)** 와 **② NestJS 서버(AI: 진정서·번역)** 두 축입니다.

### ① Supabase — DB·인증 (필수)

1. [supabase.com](https://supabase.com)에서 새 프로젝트 생성.
2. **SQL Editor**에 [`supabase/schema.sql`](supabase/schema.sql) 전체를 붙여넣고 **Run**.
   - `profiles`(프로필·아바타·초대코드·근속) / `workplaces`(사업장 시드 30곳) / `community_posts`·`community_comments`(커뮤니티 시드) / `post_translations`(번역 캐시) / `post_likes`(좋아요) 테이블 + RLS 정책 + 가입 트리거 + `redeem_invite`·`toggle_like` 함수가 생성됩니다. (멱등 — 여러 번 실행해도 안전)
3. **Authentication → Providers → Email** 활성화, **Confirm email**은 데모라면 **OFF**(가입 즉시 로그인).
4. 프로젝트의 **URL**과 **publishable(anon) 키**를 [`lib/services/supabase_service.dart`](lib/services/supabase_service.dart) 상단에 반영:
   ```dart
   const kSupabaseUrl = 'https://<YOUR-PROJECT>.supabase.co';
   const kSupabaseKey = 'sb_publishable_xxx'; // 클라이언트용 공개 키(RLS로 보호)
   ```
   > publishable 키는 공개돼도 되는 키이며 보안은 RLS로 처리됩니다. **service_role 키는 앱에 절대 넣지 마세요.**

### ② NestJS 서버 — AI 진정서·번역 (선택)

진정서 초안 생성과 커뮤니티 자동번역은 별도 NestJS 서버가 담당합니다. (없으면 해당 기능만 폴백)

- 엔드포인트: `POST /api/complaint`(진정서), `POST /api/translate`(번역), `GET /api/health`
- LLM: Google Gemini(`gemini-2.5-flash`) 또는 Anthropic Claude — 키 없으면 샘플 폴백
- 실행 예:
  ```bash
  npm install
  cp .env.example .env        # GEMINI_API_KEY 또는 ANTHROPIC_API_KEY, PORT=8080
  npm run start               # http://localhost:8080
  ```
- 앱에서의 서버 주소는 [`lib/services/complaint_service.dart`](lib/services/complaint_service.dart) / [`translate_service.dart`](lib/services/translate_service.dart)의 base URL에서 조정합니다(기본: 웹·iOS `localhost:8080`, Android 에뮬 `10.0.2.2:8080`). 배포 시 실제 서버 도메인으로 교체하세요.

> 서버 코드는 별도 저장소의 NestJS 구조를 참고하세요. 핵심은 위 3개 엔드포인트를 Gemini/Claude로 구현하고, 키가 없을 때 샘플을 반환하는 폴백입니다.

---

## 🌐 다국어

- 문자열은 [`lib/state/i18n.dart`](lib/state/i18n.dart)의 `kI18n`(ko/en/vi/id)에 모아 관리합니다.
- 화면은 `tr(lang, 'key')`로 조회하며, 키가 없으면 한국어로 폴백합니다.

---

## 📄 라이선스 / 면책

- 데모/프로토타입 목적의 프로젝트입니다.
- 진정서·법령·지원제도 안내는 참고용이며 법률 자문이 아닙니다. 제출·신청 전 반드시 고용노동부(1350) 또는 제주외국인노동자지원센터(064-712-1141)에서 최신 내용을 확인하세요.
