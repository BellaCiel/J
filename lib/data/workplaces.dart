/// jobploy.kr 제주 채용 공고 기반 사업장 데이터.
/// 출처: https://www.jobploy.kr/ko/recruit/category/jeju (제주 이주노동자 채용)
library;

class Workplace {
  const Workplace({
    required this.name,
    required this.job,
    required this.industry,
    required this.region,
    required this.pay,
    this.reports = 0,
    required this.workers,
    this.lastReport,
    this.rating,
  });

  final String name; // 사업장 이름
  final String job; // 직무
  final String industry; // 업종 분류 (아이콘 매핑용)
  final String region; // 근무 지역
  final String pay; // 급여
  final int reports; // 임금체불 신고 누적 건수 (0 = 신고 없음)
  final int workers; // 이 앱을 쓰는 노동자 수 (데모)
  final String? lastReport; // 최근 신고 연도
  final double? rating; // 근로 평가 (신고 없을 때만)

  bool get flagged => reports > 0;

  /// 업종 → 이모지 아이콘.
  String get icon {
    switch (industry) {
      case '어업':
      case '양식':
        return '🐟';
      case '축산':
        return '🐄';
      case '농업':
        return '🍊';
      case '청소/미화':
        return '♻️';
      case '식료품 제조':
      case '제조':
        return '🏭';
      default:
        return '🏢';
    }
  }
}

/// 사용자 본인 사업장 (온보딩에서 등록한 곳).
const Workplace kMyWorkplace = Workplace(
  name: '한라양식',
  job: '양식장 단순노무',
  industry: '양식',
  region: '서귀포시 성산읍',
  reports: 0,
  workers: 6,
  pay: '시급 10,320원',
);

/// jobploy 제주 채용 공고 30곳. 일부는 신고 이력이 있어 마스킹 대상.
const List<Workplace> kWorkplaces = [
  Workplace(name: '첼린저팜', job: '말목장 관리사', industry: '축산', region: '제주시', pay: '시급 10,320원', workers: 4, rating: 4.3),
  Workplace(name: '친환경제주귀한농부영농조합', job: '농업 및 분류업무', industry: '축산', region: '서귀포시', pay: '시급 10,320원', workers: 7, reports: 2, lastReport: '2025'),
  Workplace(name: '효돈화훼농원', job: '농업 단순 종사원', industry: '농업', region: '서귀포시', pay: '시급 10,320원', workers: 5, rating: 4.5),
  Workplace(name: '한라이엔지(주)', job: '재활용품 분리수거·폐기물 선별', industry: '청소/미화', region: '서귀포시', pay: '월급 2,156,880원', workers: 9, rating: 3.9),
  Workplace(name: '에스에이치수산', job: '양식장 단순노무직', industry: '양식', region: '서귀포시', pay: '시급 10,320원', workers: 8, reports: 3, lastReport: '2025'),
  Workplace(name: '207부광호', job: '연근해 갑판원', industry: '어업', region: '제주시', pay: '시급 10,320원', workers: 3, rating: 4.0),
  Workplace(name: '안성호', job: '연근해 갑판원', industry: '어업', region: '제주시', pay: '시급 10,320원', workers: 4, rating: 4.1),
  Workplace(name: '해주축산', job: '육가공 제조(생산직)', industry: '제조', region: '제주시', pay: '월급 2,156,880원', workers: 11, rating: 4.2),
  Workplace(name: '대명호', job: '연근해 갑판원', industry: '어업', region: '서귀포시', pay: '시급 10,320원', workers: 2, reports: 1, lastReport: '2024'),
  Workplace(name: '대정양돈', job: '축산업 단순 노무직', industry: '축산', region: '서귀포시', pay: '시급 10,320원', workers: 6, rating: 4.0),
  Workplace(name: '(주)산내들환경', job: '제조 단순 종사원', industry: '제조', region: '제주시', pay: '월급 2,700,000원', workers: 10, rating: 4.4),
  Workplace(name: '(주)대주환경자원', job: '제조 관련 단순 종사원', industry: '제조', region: '제주시', pay: '월급 3,500,000원', workers: 8, rating: 4.6),
  Workplace(name: '한라골드영농조합', job: '축산 직원', industry: '축산', region: '제주시', pay: '월급 2,200,000원', workers: 5, rating: 4.1),
  Workplace(name: '무드내', job: '제조/생산 직원', industry: '제조', region: '제주시', pay: '시급 10,320원', workers: 7, rating: 4.0),
  Workplace(name: '금하순대', job: '순대 공장 직원', industry: '식료품 제조', region: '제주시', pay: '시급 10,320원', workers: 6, reports: 2, lastReport: '2025'),
  Workplace(name: '성은호', job: '선원', industry: '어업', region: '서귀포시', pay: '시급 10,320원', workers: 3, rating: 3.8),
  Workplace(name: '제2015대양호', job: '선원', industry: '어업', region: '서귀포시', pay: '시급 10,320원', workers: 2, rating: 4.0),
  Workplace(name: '제주스치로폴(주)', job: '스티로폼 박스 생산', industry: '제조', region: '서귀포시', pay: '월급 2,156,880원', workers: 9, rating: 4.2),
  Workplace(name: '제주올레바당(어업회사법인)', job: '수산물 진공포장 제조', industry: '제조', region: '제주시', pay: '월급 2,156,880원', workers: 12, rating: 4.3),
  Workplace(name: '해성호', job: '선원', industry: '어업', region: '서귀포시', pay: '시급 10,320원', workers: 3, rating: 3.9),
  Workplace(name: '만성호', job: '연근해 갑판원', industry: '어업', region: '서귀포시', pay: '시급 10,320원', workers: 2, rating: 4.0),
  Workplace(name: '포인트호', job: '선원', industry: '어업', region: '제주시', pay: '시급 10,320원', workers: 4, rating: 4.1),
  Workplace(name: '(주)대한에프앤비', job: '제조 단순노무자', industry: '식료품 제조', region: '제주시', pay: '연봉 2,880만원', workers: 14, rating: 4.5),
  Workplace(name: '한도래영어조합', job: '양식장', industry: '양식', region: '서귀포시', pay: '시급 10,320원', workers: 7, rating: 4.2),
  Workplace(name: '제주웰빙수산', job: '생산직', industry: '식료품 제조', region: '제주시', pay: '월급 2,500,000원', workers: 8, rating: 4.3),
  Workplace(name: '(주)한라지엔씨', job: '현장/생산직', industry: '제조', region: '제주시', pay: '연봉 2,700만원', workers: 10, rating: 4.4),
  Workplace(name: '이도에코제주(주)', job: '제조업 단순 종사자', industry: '제조', region: '제주시', pay: '월급 2,156,900원', workers: 9, rating: 4.1),
  Workplace(name: '제주영주수산영어조합', job: '단순노무 직원', industry: '제조', region: '서귀포시', pay: '시급 12,000원', workers: 6, rating: 4.5),
  Workplace(name: '(주)녹원목장(농업회사법인)', job: '가축(말) 사육 종사원', industry: '축산', region: '제주시', pay: '시급 15,000원', workers: 5, rating: 4.7),
  Workplace(name: '제주농장영농조합', job: '식품제조 단순 종사자', industry: '제조', region: '제주시', pay: '월급 2,156,880원', workers: 8, rating: 4.2),
];
