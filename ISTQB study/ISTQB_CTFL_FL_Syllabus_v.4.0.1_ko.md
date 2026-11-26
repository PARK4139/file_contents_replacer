_______________________________________________________________
>def STEN_신청():
  # 신청시작시간: 2026년 11월 26일(목) 당일 오전 9시 30분 
  # https://www.sten.or.kr/home/kor/main.do
  # 시험명 # ISTQB Foundation CTFL 한글6차 정기(12/10) 4시
  당일결제(): # 응시료 완납하지 않으면 접수가 자동 취소됩 # 응시료: 198,000원 (VAT 포함)
  접수 및 결제: STEN 로그인 후 [education/시험] > [시험일정]에서 신청 및 응시료 결제
  수험표 확인: 시험일 며칠 전 STEN [마이페이지]에서 수험표 출력 (신분증과 함께 고사장 지참)
  응시언어 한글 
  # 선착순 마감 
  Card

>def 시험당일준비물 챙기기():
  # 실물 신분증
  # 검은색 볼펜 | 컴퓨터용 사인펜

>def ISTQB_FL_시험응시():
  # ㄴ 시험일시: 2026년 12월 10일 (목) 16:00 ~ 17:30 / 19:30 ~ 21:00 (차수별 time 상이)
  # ㄴ 시험장소: 스페이스쉐어 삼성역센터

>def ISTQB_FL_certificate취득():
  STEN_가입(): # 여권상 영문 이름과 생년월일
  STEN_로그인():
  STEN_신청():  
  
  ISTQB_FL_시험공부():
  시험일휴가상신(): #  2026년 12월 10일 (목) 오후반차
  ISTQB_FL_시험전유의사항확인():  # STEN 시험일정 페이지 또는 KSTQB 정기 시험 일정 공지확인
  ISTQB_FL_시험당일준비물 챙기기():
  ISTQB_FL_시험응시(): 
  ISTQB_FL_합격조회(): # 시험응시 약 2~3주 대기 > STEN > [마이페이지] > 합격 여부 확인
  ISTQB_FL_certificate_발급(): 합격발표 > STEN > [마이페이지] > [certificate 발급] > 전자 certificate(PDF) 

>def 시험공부():
  **단기 합격 핵심 요약**
  ISTQB CTFL(Ver 4.0 기준) 단기 합격을 위해서는 출제 비중이 가장 높은 4장(test 분석 및 설계)과 1~3장의 핵심 개념을 집중적으로 공략해야 합니다.
  총 40문항 중 26문항(65%) 이상만 맞히면 합격하므로, 아래 챕터별 핵심 포인트와 기출 유형만 완벽히 익혀도 충분히 합격권에 들 수 있습니다.

  1. 챕터별 출제 비중 및 핵심 요약 (Ver 4.0 기준)
  챕터	주요 출제 개념 (꼭 외워야 할 포인트)	예상 문항 수
  1장. testing의 기초	• testing의 7대 원리 (특히 살충제 패러독스, sw_defect/fault 집중, 완벽한 testing은 불가능 구분)
  • Error → sw_defect/fault(Defect/Bug) → failure/malfunction(Failure) 인과관계
  • testing vs debugging (testing은 sw_defect/fault 발견, debugging은 개발자가 원인을 찾아 수정)
  • test_process 7단계 순서 및 각 단계별 산출물	약 8문항
  2장. SDLC 전반의 testing	• 시프트 레프트(shift_left) (초기 단계부터 test를 시작해 비용 절감)
  • testing_level 4단계 (컴포넌트 → 통합 → 시스템 → acceptance_testing) 각각의 목적과 대상
  • test_type 4가지 (기능, 비기능, black_box, white_box)
  • 확인 testing(재testing) vs 리그레션 testing (수정한 sw_defect/fault 확인 vs 수정으로 인한 부작용 확인)	약 6문항
  3장. 정적 testing	• 정적 testing vs 동적 testing (코드를 실행하지 않음 vs 실행함)
  • review process 5단계 (계획 → review 착수 → 개별 review → issue 커뮤니케이션 및 분석 → 수정 및 보고)
  • review 유형 4가지 (informal review, walkthrough, technical_review, inspection - 가장 공식적)	약 4문항
  4장. test 분석 및 설계 ⭐	• black_box 방식 (계산 문제 필수 출제):
    - EP: Valid/무효 파티션 나누기
    - boundary_value_analysis(BVA): 2-값(경계와 바로 옆 값) vs 3-값(경계, -1, +1) 구분
    - decision_table: 조건 combination에 따른 result 도출
    - state transition testing: Valid/무효 transition 및 state transition도 계산
  • white_box 방식: statement_coverage(100% 달성 시 branch_coverage 보장 안 됨) vs branch_coverage
  • experience_based 방식: error_guessing, exploratory_testing(test charter 활용), 체크리스트 기반	약 11문항 (최다 출제)
  5장. test 활동 관리	• 리스크 기반 testing: risk_level = 발생 가능성 × 영향도
  • test_pyramid (단위 > 통합 > UI 순으로 비중 배치) 및 testing_quadrants(Q1~Q4)
  • 형상 관리 및 defect/fault_report 필수 포함 항목 (재현 절차, expected_result, actual_result 등)	약 9문항
  6장. test_tool	• test_자동화의 잠재적 이점과 리스크 (비현실적 기대, 유지보수 비용 증가 등)
  • 활동별 tool 분류 (관리, 정적, 설계, 실행, 성능 측정 tool 등)	약 2문항
  
  
    2. 단기 합격 3단계 공부 전략 (1~2주 완성)

  1. 용어 익숙해지기 (3일). KSTQB 자료실에서 CTFL Ver 4.0 실라버스를 다운로드해 1~3장을 가볍게 1회독하며 한국어 번역 투(용어집 기준)에 익숙해집니다.
  2. 4장 계산 문제 마스터 (4일). EP, boundary_value_analysis(2-값/3-값), decision_table, state transition, statement/branch_coverage 문제는 매 시험 100% 출제되므로 공식과 풀이법을 확실히 익힙니다.
  3. 샘플 문제 풀이 및 오답 정리 (나머지 기간). KSTQB 홈페이지에 공개된 샘플 문제(Sample Exam Set A, B 등)를 시간을 재고 풀면서, 틀린 문제의 해설을 실라버스 본문과 대조해 암기합니다.
_______________________________________________________________ 
>index
- [Acknowledgement]
- [서론]
- [Fundamentals of Testing]
 - [overview_of_testing]
 - [necessity_of_testing]
 - [principles_of_testing]
 - [testing_activity, testware, testing_role]
 - [testing의 필수 기술 및 모범 사례]
- [SDLC와 testing]
- [perform_static_testing():]
- [analyze_test_basis과 design]
- [testing_activity management]
- [testing_tool]
- [References]
_______________________________________________________________ 
>SDLC
plan():# 일반적인 계획
design(): # 구조·아키텍처 설계
define_requirements():	# 요구사항 도출 및 명세
create_development_plan():	 # 개발 범위·일정·목표 수립
plan_development():	개발 계획 수립	개발 수행 전략 및 절차 수립
_______________________________________________________________ 
>sw_testing에 관련된 모든 사람
tester, analyze_test_basis가, testing engineer, testing 컨설턴트, testing_admin, AC tester 및 developer
Core Advanced Level
TA: analyze_test_basis가, 
TTA테크니컬 analyze_test_basis가
TMtesting 매니저
Expert Level(TM manage_testing(): 또는 ITPtest_process_improving)


>sw_testing에 cowork자
PO, PM, quality_admin, development_admin, business_analysis가, IT director
경영 컨설턴트



>PM activity
estimate():result는 PM activity에 사용되며, SDLC 다음 단계로 넘어가는 것이 좋을지 (예: release를 하는 것이 적합한지) 판단 기여


>Career Path for Testers
CTFL certificate 상위 level의 sw_testing certificate 취득의 자격
ISTQB Advanced Level
ISTQB Expert Level 
도메인 특화 스페셜리스트 모듈


>"PIA(개인정보 영향평가)"
PIA(개인정보 영향평가) target이, 공공기관 사스템에 의무, 민간기업 권장 
공공기관에서 수주받는 업체는 메리트

>"ISMS-P 인증"

> IDEAL Test Engineer Career Path Plan
testingengineering을 현업에서 실천하는 Test Engineer 전문가들은 보통 다음과 같이 분류됩니다.
• QA engineer (Quality Assurance Engineer): 앞서 언급한 'process'와 '예방'에 초점을 맞추어 전반적인 품질 sys을 management합니다.
• STE (Software Test Engineer): testing 이론과 방식을 바탕으로 시나리오를 design하고 실제 sw_defect/fault을 찾아내는 데 집중합니다.
• SET / SDET (Software Engineer in Test): developer level의 코딩 실력을 갖추고, testing_automation 프레임워크를 devemopment하거나 CICD release_pipeline에 testing를 심는 기술 중심의 engineer입니다.


> ACTUAL Test Engineer Career Path Plan
ㄴ>AI Agent 사용률 증가
 ㄴ>Vibe coding 증가
  ㄴ>소스code생산 증가
   ㄴ>소스code생산 증가
    ㄴ>해킹 증가
ISTQB CTFL & SQLD > 정보security산업기사 > 정보security기사 > s/wsecurity약점 진단원  
S/Wsecurity약점 진단원
소스code 진단원
사실 S/W devemopment, 품질 쪽 현업에서는 "ISTQB CTFL, SQLD, 정보security산업기사, 정보security기사" 는 사실 있구나 정도의 certificate
agile_sw_development_model에서 testing 실무기술을 development하고자 하는 사람은 agile_technical_tester 또는 Agile Test Leadership at Scale 인증을 고려해볼 수 있다. 
Specialist stream은 특정 testing approach 및 testing_activity(예: testing_automation, AI testing, model 기반 testing, 모바일 앱 testing)을 갖춘 분
특정 testing 영역(예: 성능 testing, 사용성 testing, acceptance_testing, security testing)과 관련된 분야, 또는 특정
산업 분야(예: 자동차 또는 게임)에 대한 testing 지식에 집중하는 분야 등에 대한 심층적인 learning과 연구를
제공한다. 
ISTQB의 인증 tester 체계에 대한 최신 info는 www.istqb.org에서 확인 가능하다.
_______________________________________________________________
>LO: Learning objectives
특정 LO의 지식 level은 각 챕터의 시작 부분에 표시되며 다음과 같이 분류된다:
K1 : 기억(remember)
K2 : 이해(understand)
K3 : 적용(apply)
각 모든 용어의 정의를 기억해야 한다(K1).
FL 의 의도를 설명하는 일반 education_objectives
syllabus 내용은 sw_testing의 전체 지식 영역에 대한 설명이 아니며
syllabus는 적용하는 SDLC와 무관하게 모든 sw_project에 적용할 수 있는 testing 개념과 technique에 중점을 둔다.
_______________________________________________________________
>CTFL test issue 출제test_scope
서론과 부록을 제외한 syllabus의 모든 부분
Standards, 관련 서적 및 다른 ISTQB syllabus 등이 참고문헌으로 포함된다(7장).


>ISO/IEC 25010
# international_Standards
# pursose: estimate_sys_quality(): 
# 기존 ISO/IEC 9126을 대체
_______________________________________________________________ Fundamentals of sw_testing
>sw_testing 부재
올바르게 동작하지 않는 SW는 금전적, time적, business 평판 손실은 물론, 심하게는 부상이나 사망에 이르기까지 다양한 issue를 일으킬 수 있다. 


>necessity_of_testing
qc_activity의 일환으로 testing은 정해진 test_scope, time, quality, 제한된 예산 내에서 
to achive agreed_testing_objectives 도움을 준다.
모든 stakeholder는 자신이 가진 testing_techniques을 활용해 project 성공에 기여가능.
component, sys, 관련 work_product (예: docs)을 target으로 한 testing은 sw_defect/fault을 식별하는 데 도움이 된다.
testing은 defect/fault을 식별하여 잠재적 technical_debt에 의한 cost 절약기여. like simulator
testing은 test_object quality 향상에 간접적기여
testing은 SDLC의 여러 단계에서 test_object quality 을 직접 estimate():할 수 있는 방법을 제공한다.
testing은 project에서 user를 간접적으로 대변한다.
tester는 SDLC 전반에 걸쳐 그들 이 이해하고 있는 user req이 반영되게 된다.
user 대표 집단이 project에 참여가 best 일수도 있지만, cost이 많이 들고 적합한 user의 참여가 쉽지 않아서 어려운 case가 많다.
계약 또는 법적 req을 충족하거나, 규제 Standards 준수를 위해 testing이 필요할 수도 있다.
sw_testing은 SQ 을 estimate():
SW 사용 중, failure/malfunction의 risk 감소
sw_testing은 defect/fault을 식별하고 sw_work_product 의 quality 을 estimate():하는 일련의 activity이다. 
test_object # 시험target # product
testing_work_product
testing_objectives
SW를 실행하고 result를 확인하는 do_dynamic_testing():의 test_execution에 국한된다고 오해하는 case가 많다.
sw_testing은 다양한 activity을 포함하며, 이런 activity은 SDLC에 따라 달라진다 


>sw_testing = [.. + verification + validation + ..]
# verification: sys이 주어진 req을 충족하는지 확인하는 등의 
# validation : sys이 운영 env에서 user 또는 기타 stakeholder가 필요한 바를 만족하는지 확인
# sw_testing에 대한 또 다른 오해는 testing이 test_object의 verification에만 초점을 맞춘다는 것이다.

>sw_testing = [.. + perform_static_testing(): + do_dynamic_testing(): + ..]


>sw_testing 적절한 planning/management/추정/모니터링/제어도 필요하다(5장 참조).
ISO/IEC/IEEE 29119-1 Standards은 sw_testing의 개념을 상세히 설명하고 있다.


>purpose of sw_testing
- estimate_work_product
- failure/malfunction 유발 및 defect/fault 식별 (discover issue, open issue)
- test_object에 대해 req된 coverage 보장
- SQ 부족으로 인한 risk level의 완화
- 정의된 req의 충족 여부를 확인하는 verification
- test_object의 계약, 법률, 규제 req 준수 여부를 확인하는 verification
- stakeholder가 info에 입각한 Decision을 내리는데 필요한 info 제공
- test_object quality 에 대한 자신감 획득
- test_object의 완성 여부와 stakeholder의 기대 충족 여부를 확인하는 validation
# testing의 purpose은 정황에 따라 달라질 수 있다.
# 정황에는 test_object work_product , testing_level, risk, 사용하는 SDLC, 그리고 기업 구조, # 경쟁사 구도, 시장 출시 시기 등의 business 정황 이 포함된다.

>sw_developing = [
 perform_static_testing(): + 
 do_dynamic_testing(): + 
 raise_issue + 
 debugging + 
 confirmation_testing + 
 regression_testing + # optional
]

>perform_static_testing(): 
sw_defect/fault(sw_defect/fault)으로 인한 failure/malfunction(failure/malfunction)를 유발하거나 test_object에 있는 
정책서, 기획서 에서 defect/fault을 식별
# perform_static_testing(): == static_review

>do_dynamic_testing():
failure/malfunction를 유발했을 때 
- failure/malfunction 재현

>debugging = [
 failure/malfunction 재현 + 
 analysis(defect/fault 찾기) + 
 defect/fault 수정 + 
]
# failure/malfunction의 원인(defect/fault)을 찾고, 그 root_cause(bug)을 analysis하고 removing.
# 이때 일반적인 debugging process는 다음과 같다:
# debugging == removing bug
# debugging == removing defect/fault # developer by reffering planning book


>confirmation_testing
issue가 제대로 수정됐는지 확인한다.
raise_issue 한 사람이 confirmation_testing을 수행권장

>regression_testing
수정 사항이 test_object의 다른 부분에 failure/malfunction를 일으키지 않았는지 확인하기 위해 
수정된 function의 연동function에 대해서 side_effect를 확인하기 위해서 regression_testing을 선택적 추가수행
weekly_regression_testing
nightly_regression_testing


>developing = [
 qa + 
 qc + 
]
# qa 과 testing은 다르다.
# qa 과 testing은 혼용하는 case가 종종있음


>qa(Quality Assurance)
 ㄴ>review_requirements():
 ㄴ>define_quality_goals():
# Preventive activity # 여기서 preventive는 code구현 전 이라는 의미이다. release가 아니다. 
# qa은 process의 구현과 개선에 초점을 맞춘 process 중심의 예방 approach이다.
# 좋은 process 를 올바르게 준수하면 좋은 product이 만들어진다는 가정을 기반으로 한다.
# qa은 development 및 test_process 모두에 적용되며, project에 참여하는 모두의 responsibility이다.


>qc = [
 testing + 
]
# testing은 qc의 주요 activity
정형 technique(model 확인 및 정확성의 증명), 시뮬레이션, 프로토타이핑도 qc에 속한다.
product 지향적이고, 적합한 level의 quality 달성을 지원하는 activity에 초점을 맞춘 corrective approach이다.

> testing result_feedback
qa과 testing 모두에 사용된다.
testing에서 testing_result는 defect/fault을 수정하는 데 사용하며
qa에서는 development 및 test_process가 잘 동작하고 있는지 확인하기 위한 feedback으로 사용한다.
 

>root cause
root cause은 issue 발생의 근본적인 이유(예: error로 이어지는 상황)를 말한다.
root cause은 root cause analysis(root cause analysis)을 통해 찾게 된다.
root cause analysis은 보통 failure/malfunction가 발생하거나, defect/fault을 식별한 case 수행한다.
root cause을 처리(ex>, 제거)하면 유사한 failure/malfunction와 defect/fault을 예방하거나,그 빈도를 줄일 수 있다.


>error 
ㄴ>defect/fault
ISTQB 표준에서, error는 "사람(developer, service_Planner, tester 등)이 저지른 실수나 착각"을 의미
사람은 error(mistake)를 저지르며 이에 따라 defect/fault(결점, bug)이 발생


>defect/fault
ㄴ>failure/malfunction 
# 이는 failure/malfunction로 이어질 수 있다.
# 사람은 time적인 압박, work_product 의 복잡성, process, 인프라, interaction 등 다양한 이유로, 또 # 단순히 피로하거나 훈련이 부족해서 error를 범가능.
# SDLC 초기에 만든 work_product 의 defect/fault을 발견하지 못할 case, 이는 종종 LC 후반의 work_product 의 defect/fault으로 이어지는 case가 많다.
# defect/fault은 SRS나 testing_script와 같은 docs, code, 또는 build 파일과 같은 지원 work_product(supporting work product)에서 나올 수 있다.


>failure/malfunction 
code에 있는 defect/fault이 실행되면 sys이 수행해야 할 function을 수행하지 못하거나, 수행하지 않아야 할 function을 수행해 failure/malfunction를 일으킬 수 있다.
실행될 case 항상 failure/malfunction를 일으키는 defect/fault도 있지만, 특정 상황에서 만 failure/malfunction를 일으키거나 failure/malfunction로 이어지지 않는 defect/fault도 있다.
failure/malfunction의 원인이 error와 defect/fault만 있는 것은 아니다.
방사선이나 전자기장이 펌웨어에 issue가 생기게 하는
case처럼 env condition으로 발생하는 것도 있다.

>principles_of_testing
# syllabus는 7가지를 소개하고 있다.
1. testing은 defect/fault의 존재를 밝히는 activity
1. defect/fault이 없음을 증명하지는 않는다.
testing은 test_object에 defect/fault이 있음을 보여줄 수 있지만, 
>1. defect/fault이 없다는 것을 증명할 수는 없다 > 완벽한 sw는 없다. 
1. testing으로 test_object에 defect/fault이 잔존해 있을 확률을 줄일 수 있지만, 
1. if c(defect/fault) != 0:
  defect/fault 없음
2. 완벽한 testing은 불가능하다.
 모든 것을 testing한다는 것은 매우 간단한 SW를 제외하고는 불가능하다
 따라서 완벽하게 testing하려고 하기보다 testing_technique, tc 우선순위 지정, risk 기반 testing을 사용해 testing 노력을 집중해야 한다.
>2. 무결 sw는 없다
ㄴ proof: 수학적으로, 로그인 항목 10개 있는 양식만으로 설명요청 # 약 105만 개 case의수 > "Test Engineering technique"(페어와이즈, boundary_value_analysis) > 약 20 ~ 30개 combination으로 압축 > 외부 env(브라우저 3종, 기기 3종, network 3종)까지 페어와이즈 계산기에 집어넣어 전체 combination을 짜도, 최종 tc는 50개 안팎으로 끝납니다.
# sw_engineering 'sw_defect/fault이 전혀 없는 SW'를 만드는 것은 불가능
# objectives_of_sw_engineering
# user가 치명적인 error를 겪지 않도록 통제하는 것
 ㄴ> RISK가 높은 핵심 function을 집중적으로 검증
  ㄴ> Risk Matrix 
>3. 조기 testing merits
process 초기에 발견해 제거한 defect/fault은 연관된 다른 work_product 의 
후속 defect/fault으로 이어지지 않는다.
3. prevention of Defect Propagation(sw_defect/fault 전파)
>shift_left_testing 미도입
ㄴ>issue: #defect
 ㄴ>Planning: 아이디 글자 수 제한 planning누락
  ㄴ>dev: developer가 아이디 글자 수 제한 로직누락
   ㄴ>DB 단계: 100자가 넘는 아이디가 들어와 서버가 터집니다
>shift_left_testing 도입
ㄴ>issue: #defect
 ㄴ>Planning: 아이디 글자 수 제한 planning누락
  ㄴ>perform_static_testing():, do_dynamic_testing(): 최대한 이른 시점에 시작
   ㄴ>defect/fault을 조기식별
    ㄴ> Defect Propagation 감소
     ㄴ>SDLC 후반에 발생하는 failure/malfunction 감소
      ㄴ> technical_debt 감소
       ㄴ> CoQ(Cost of qaulity) 감소 
         ㄴ> debugging/confirmation_testing 인건비 감소
          ㄴ> bug가 터져서 수습하느라 쓰는 cost 감소
3. 수정 cost 통계
# bug는 늦게 발견할수록 수정 cost이 기하급수적으로 비싸집니다 (이를 IBM, 이안 소머빌 등 학계에서는 단계별로 10배~100배씩 뛴다고 증명했습니다).
>4. Defect Clustering
보통 대부분의 defect/fault은 소수의 sys component에 집중되어 발생하는 trend을 보이며, 운영 failure/malfunction의 대부분 역시 소수의 component에서 발생한다(Enders 1975).
복잡한 계산이 들어가거나 여러 function이 얽혀 있는 특정 메뉴나 모듈(20%)에 전체 bug의 80%가 몰려 있습니다.
# Pareto principle(80/20 법칙)
예상 defect/fault 집중 영역과 실제로 testing나 운영 중 관측한 defect/fault 집중 영역은 risk 기반 testing에서 중요하게 고려된다(5.2 참조).
사고 다발 구역: 운전 시, 보면 사고가 전국의 모든 도로에서 골고루 나지 않습니다. 유독 신호가 복잡하거나 급커브가 있는 특정 교차로(20%)에서 전체 사고의 대부분(80%)이 일어납니다.
# ㄴ> Risk Matrix
 # 발생 가능성도 높고, 터지면 회사 망하는 곳(영향도 높음)으로 분류된 레드 존(Red Zone)
 # ㄴ> Risk-based Testing Analysis Criteria
  # ㄴ> 위험한 구역 선정기준
   # ㄴ> Complexity(Code/Calculation), Business Criticality, Change Frequency, Human Factor
   # ㄴ> Human Factor
    # ㄴ> 신입 developer나 해당 prj에 새로 합류한 Assignee가 처음 코딩한 영역
    # ㄴ> 마감 직전에 촉박한 일정에 쫓겨 야근하며 날림으로 짜인 function
>5. testing 효과는 줄어든다.
만일 같은 testing를 계속해서 반복하면, 결국 해당 testing의 신규 defect/fault 식별 효과는 점점 줄어들게 된다(Beizer 1990).
이런 현상을 극복하기 위해 기존 tc 및 testing_data의 수정과 새로운 testing의 작성이 필요가능.
그러나 자동 regression_testing 처럼 같은 testing를 반복하는 것이 유익한 case도 있다(2.2.3 참조).
>6. testing은 정황에 의존적이다.
모든 상황에 적용할 수 있는 하나의 testing approach은 없다.
testing
은 정황에 따라 다르게 진행해야 한다(Kaner 2011).
>7. defect/fault-부재는 궤변이다.
SW verification이 sys의 성공을 보장할 것이라고 기대하는 것은 잘못된 생각이다.
정의한 모든 req을 철저히 testing하고, 발견한 모든 defect/fault을 수정하더라도 user의 req나 기대에 못 미치거나, 고객의 business objectives 달성에 도움이 되지 않고 경쟁 sys에 비해 부족한 sys이 만들어질 수도 있다.
따라서 verification과 함께 밸리데 이션도 수행해야 한다(Boehm 1981).


>test_process [
 testing_activities
]
# testing은 정황에 의존적이다.
# testing_purpose을 달성하기 위한 보편적인 testing activity들이 있다.
# 이런 testing_activity이 test_process를 구성하게 된다.
# test_process는 여러 요인을 기반으로 주어진 상황에 맞게 조정될 수 있다.
# test_process에 포함될 testing_activity과 그러한 activity의 구체적인 수행 방법과 시기는 보통 해당 상황에 필요한 test_planning을 짤 때 Decision한다.
# ISO/IEC/IEEE 29119-2 Standards은 test_process에 대한 상세 info를 제공한다.
>testing_activity과 업무
이런 activity 중 대부분은 순차적으로 수행되 는 것처럼 보일 수 있으나, 실제로는 반복적 또는 병렬로 구현되는 case가 많다.
testing_activity은 일반적 으로 sys과 project에 맞게 조정한다.


>testing_trigger
Modification / Change
 Improvement(성능/품질 개선사항)
 Optimization(최적화)
 Enhancement(고도화)
 Migration
 Retirement
 hotfix
 Requirement Change
 add_new_feature():
 
 
 >test_planning
>testware: test_planning, Risk Matrix
1. define_testing_purpose
2. 전반적인 상황에 따른 제약 condition 내에서 purpose 을 가장 잘 달성할 수 있는 approach을 선택

>Test_monitoring
>testware:
지속적으로 모든 testing_activity을 점검하고, 실제 진행 상황을 planning과 비교하는 activity이다.

>test_control
>testware:
testing_purpose을 달성하는 데 필요한 조치를 하는 activity이다.


> test_basis
> Input
process에 들어가는 모든 재료를 뜻하는 포괄적인 개념이고, test_basis는 그중에서도 'test의 정답과 기준이 되는 원천 문서'만을 가리키는 좁은 개념입니다.

>analyze_test_basis
>testware: test_basis, test_condition, tc
analyze_test_basis은 “무엇을 testing할 것인가?”라는 질문에 측정 가능한 coverage condition으로 답을 제공한다.
test_basis를 analysis해 testing 가능한 function을 식별한다.
test_basis와 test_object 또한 그 안에 있을 수 있는 defect/fault을 식별하고, 
관련된 testing_condition은 연관된 risk와 risk level을 고려해 정의하고, 우선순위를 매긴다 
testing 용이성을 estimate():하기 위해 함께 analysis된다.
analyze_test_basis을 지원하기 위해 testing_technique을 사용하는 case가 많다

>test_design
>testware: tc, testing_charter ..
testing_condition을 tc와 기타 testware(예: tc, testing_charter)로 구체화하는 function을 포함한다.
이 activity은 tc 입력값을 구체화하는 데 도움이 되는 coverage 항목 의 식별을 포함하는 case가 많다.
이 activity을 지원하기 위해 testing_technique을 활용가능.
test_design는 또한 testing_data req 정의, testing_env design 및 필요한 인프라와 tool 식별을 포 함한다.
test_design는 “어떻게 testing할 것인가?”라는 질문에 답을 제공한다.

>test_implementation
>testware: test_procedure, testing_script, testing_data
test_execution에 필요한 testware를 만들거나 획득하는 function을 포함한다.
tc는 test_procedure로 묶을 수 있으며, test_suite로 combination하는 case도 많다.
효율적인 test_execution을 위해 우선순위를 반영한 test_execution 일정으로 test_procedure를 정리한다
testing_env 을 구축하고 올바르게 설정되었는지 확인한다.


>test_execution
>testware: testing_result
test_execution 일정에 따라 testing를 수행하는 것(testing_run)을 포함한다.
testing는 수동이나 자동으로 실행가능.
test_execution은 지속적 testing(continuous testing), 페어 testing 세션(pair testing sessions) 등 다양한 형태로 이루어질 수 있다.
실제 testing_result는 expected_result와 비교한다.
anomaly을 analysis해 가능한 원인을 파악한다.
이런 analysis을 통해 관찰 한 failure/malfunction를 기반으로 anomaly을 보고(raise_issue)가능. 
 

>test_completion
>testware: test_completion_report
(예: release, 반복 주기 완료, testing_level 완료)에서 수행된다.
유용할 수 있는 testware를 식별해서 보관하거나 적절한 팀에 인계한다.
testing_env은 + state로 파악한다
test_completion_report를 작성해 stakeholder에게 전달

>testing_activity
testing # macro
testing_activity 는 testing의 세분화된 방식 # Micro
testing_activity은 조직에서 수행하는 development process의 필수적인 부분 이다.

>testing cost
stakeholder가 부담하게 되며


>testing objectives
stakeholder의 business objectives 달성을 지원하는 것이다.
- stakeholder(필요, 기대, req, 협력 의지 등)
- team_member(기술, 지식, 경험 level, 가용성, 훈련 필요성 등)
- business 도메인(test_object의 중요도, 식별된 risk, 시장 req, 구체적인 법적 규제 등)
- 기술적 요인(SW type, product 아키텍처, 사용된 기술 등)
- project 제약 condition(test_scope, time, 예산, 자원 등)
- 조직적 요인(조직 구조, 기존 정책, 적용한 practice 등)
- SDLC(engineering적 practice, development Methodology(방법론) 등)
- tool(가용성, 사용성, 규정 준수 등)
이런 요소는 testing 전략, 적용된 testing_technique, 
testing_automation level, 필요 coverage level, 
testware의 상세화 level, testing 보고 등 많은 testing 관련 issue에 영향을 미친다.


>test_planning 
>work_product: test_planning, testing 일정, risk_management 대장(risk register), 시작 및 완료 condition
risk_management 대장은 risk 발생 가능성, risk 영향도, risk 완화 info가 들어있는 risk 목록이다
testing 일정, risk_management 대장, 시작 및 완료 condition은 종종 test_planning서에 포함된다.

>Test_monitoring과 test_control 
>work_product: testing 진행 상황 report, 제어 지침 docs, risk info

>analyze_test_basis 
>work_product: (우선순위가 지정된) testing_condition, AC

>test_design 
>work_product: (우선순위가 지정된) tc, testing_charter,
coverage 항목, testing_data req, testing_env req

>test_implementation 
>work_product: test_procedure, 수동 및 자동 testing_script, test_suite, testing_data, test_execution 일정, testing_env 요소.
testing_env 요소의 예로는 stubs, 드라이버, 시뮬레이터, 서비스 가상화 등이 있다.

>test_execution 
>work_product: testing 로그, defect/fault report 

>test_completion 
>work_product: test_completion_report, 향후 project 또는 반복 주기 때 개선할 실천 항목, docs로 기록한 교훈, 변경 요청서(예: product backlog 항목)

>testing에서의 R&R
이 두 role에 할당되는 activity과 업무는 project 및 product의 정황, role Assignee의 기술 level, 조직 상황 등 요소에 따라 달라진다.

>manage_testing(): role
manage_testing(): role은 test_process, sqa_team 그리고 testing_activity leader십에 대한 전반적인 responsibility을 진다.

>manage_testing():
주요 관심 영역은 test_planning, Test_monitoring, test_control 그리고 testing 완료 activity이다.
manage_testing():의 수행 방식은 정황에 따라 agile_sw_develompent에서 manage_testing(): 업무의 일부를 agile_team이 처리가능.
여러 팀 또는 조직 전체의 cowork이 필요 한 과업은 dev_team 외부의 testing_admin가 수행할 수도 있다.

>testing_role
testing_role은 testing의 engineering(기술적인) 측면에 대한 전반적인 responsibility을 진다.
testing_role은 주로 analyze_test_basis, test_design, test_implementation, test_execution activity에 초점을 둔다.
상황에 따라 manage_testing(): role은 팀 leader, testing_admin, development_admin 등이 수행가능.
또한, 한 사람이 testing과 manage_testing(): role을 동시에 수행하는 case도 있다.

>skill
어떤 일을 잘 해내는 ability으로 그 사람이 가진 지식, 경험, 적성에서 비롯된다.

>우수한 tester 자질
1. teamplayer
1. 다양한 level의 Independence에서 testing을 수행할 수 있어야 한다.
 우수한 의사소통 기술, 경청하는 자세, 팀플레이(모든 stakeholder와 효과적으로 interaction하고,
 다른 사람에게 info를 전달하고, 상대의 이해를 구하고, defect/fault을 보고하고 논의하기 위해)

1. 기술 지식(testing 효과를 높이기 위해, 예: 적절한 testing_tool 사용을 통해)
1. analysis적 사고, 비판적 사고, 창의성(testing 효과를 높이기 위해)
1. testing_technique 활용을 통해 철저함, 신중함, 호기심, 세부사항에 대한 주의력, 체계적인 접근(defect/fault, 특히 찾기 어려운 defect/fault 식별을 위해)
1. 도메인 지식(최종 user/business 대표자를 이해하고 그들과의 소통을 위해)

1. 의사소통 기술을 가져야합니다.
testing_result의 전달을 product이나 작성자에 대한 비판으로 오해할 소지가 있다. 건설적인 방법으로 전달해야 한다.
1. 확증 편향(confirmation bias)적 사고를 잘 핸들링 해야한다. 

>whole_team_approach(전체팀approach)
1. tester에게 중요한 기술 중 하나는 팀 env에서 효과적으로 일하고, 팀 objectives에 positive으로 기여하는 ability이다.
1. extream_programming에서 시작된 whole_team_approach은 이런 ability 을 기반으로 한다.
1. whole_team_approach에서는 필요 지식과 기술을 갖춘 team_member이라면 누구나 어떤 function이라도 수행할 수 있고, 모든 team_member이 quality 에 대한 responsibility을 진다.
1. 같은 공간을 사용하는 것(co-location)은 의사소통과 interaction을 용이하게 하므로 team_member들은 (물리적 또는 가상의) function 공간을 공유하게 된다.
1. whole_team_approach은 팀의 활 력을 높이고 팀 내 의사소통과 cowork을 강화하며, project의 성공을 위해 팀이 가진 다양한 기술을 활 용해 시너지를 창출한다.
1. tester는 필요한 level의 quality 달성을 위해 다른 team_member과 긴밀히 협력하게 된다.
여기에는 business Assignee와 협력해 적절한 acceptance_testing를 작성하고, developer와 협력해 testing 전략을 협의하고 testing_automation approach을 Decision하는 것도 포함된다.
따라서 tester는 testing 지식을 다른 team_member과 공유하게 되며, product devemopment에 영향을 주게 된다.
정황에 따라 whole_team_approach이 적절하지 않을 수도 있다.
ex>, safty이 치명적인 case에는 높은 level의 testing Independence이 필요가.

> cognitive_biases(인지편향)의 대표 예
1. 확증 편향 — Confirmation bias
자신의 기존 생각을 뒷받침하는 증거를 더 찾고, 반대되는 증거는 가볍게 받아들이는 trend이다. CSRA
- 기존 생각: “이 function은 정상적으로 구현되었다.”
- 행동: 정상 입력에서 성공하는지만 반복 확인하고, 실패 result는 충분히 조사하지 않은 채 env 문제로 판단한다.
1. 앵커링 편향 — Anchoring bias
처음 접한 정보나 특정 판단을 기준점으로 삼아, 새로운 정보가 나와도 판단을 충분히 수정하지 못하는 trend이다. Ethics Unwrapped
- 최초 설명: “network 문제 때문에 앱이 종료되는 것 같다.”
- 행동: 이후 저장공간 부족 로그가 발견되어도 network만 계속 조사한다.
1. 과신 편향 — Overconfidence bias
자신의 지식·능력·판단의 정확성을 실제보다 높게 평가하는 trend이다. dictionary.apa.org
- 기존 생각: “이 function은 내가 충분히 알고 있다.”
- 행동: spec와 checklist를 확인하지 않고 기억만으로 testing하여 예외 조건을 누락한다.
확증 편향: 기존 생각을 뒷받침하는 증거를 선택적으로 받아들이는 trend.
앵커링 편향: 처음 접한 정보나 특정 기준에 판단이 고정되는 trend.
과신 편향: 자신의 능력이나 판단의 정확성을 과대평가하는 trend.

>necessity of Independence of testing
tc Author와 Tc test runner 를 달리한다.
cognitive_biases는 testing의 객관성을 해한다
A certain degree of independence은 Author와 tester의 cognitive_biases diff로 tester가 defect/fault을 더 효과적 으로 식별할 수 있도록 한다(Salman 1995).

>testing의 낮은 level Independence 마련
cognitive_biases 를 예방하기 위해 testing Author가 testing 하지않도록 한다.
이가 testing 의 Independence을 마련하는 것이다. 
Author의 같은 팀 동료가 testing하거나, 

>testing의 높은 level Independence 마련
높은 Independence
Author의 팀 외부에 있지만 조직 내에 있는 tester가 testing하거나(높은 Independence), 조직 외부의 tester가 testing가능. (매우 높은 Independence).
대부분의 project는 여러 level의 Independence으로 testing을 수행하는 것이 가장 좋다(예: developer가 component와 integration_testing을 수행하고, sqa_team이 sys과 sys_integration_testing을 수행하며, business Assignee가 acceptance_testing을 수행하는 case).

독립적인 testing의 주요 merits은 독립적인 tester는 배경, 기술적 관점, 편향이 다르기 때문에 developer와

다른 type의 failure/malfunction와 defect/fault을 식별할 가능성이 높다는 점이다.
또한, 독립적인 tester는 sys spec를 작 성하고 구현하는 과정에서 stakeholder가 한 가정을 검증하고 그것에 대한 이의를 제기하거나 반증가능.

>testing의 Independence 마련과 상대적인 설명
developer는 자신이 작성한 code에서 많은 defect/fault을 효율적으로 찾아낼 수 있다.
독립적인 tester는 dev_team과 차단되어 cowork과 의사소통이 어려울 수 있으며, development 팀과 적대적인 관계로 이어질 수 있다.
developer가 quality 에 대한 responsibility감을 잃을 수도 있다.
독립적인 tester가 병목으로 인식되거나, 출시 지연의 원인으로 비난받을 수도 있다.

_______________________________________________________________ 
> SDLC와 testing 


>LO
SDLC에서의 testing
- FL-2.1.1 (K2) SDLC가 또는 선택된 SDLC가 testing 에 미치는 영향을 설명가능. 
FL-2.1.2
(K1) 모든 SDLC에 적용되는 best_testing_practice를 상기할 
- FL-2.1.3     수 있다
FL-2.1.4
- FL-2.1.5 (K1) development에서 testing 우선 approach의 예를 들 수 있다
- FL- (K2) DevOps 가 testing에 미치는 영향을 요약가능. 
(K2) shift_left approach을 설명가능.  (K2) process_improving을 위한 방법으로 Retrospective의 사용을 설명가능. 
_______________________________________________________________ 
>testing_level과 test_type
- FL-2.2.1 (K2) testing_level을 구별가능. 
- FL-2.2.2 (K2) test_type을 구별가능. 
- FL-2.2.3 (K2) confirmation_testing을 regression_testing과 구별가능. 
_______________________________________________________________ 
>maintenance_testing
- FL-2.3.1 (K2) maintenance_testing과 유발요인을 요약가능. 

>SDLC_model == development_model
상위 level에서 development_process를 추상적으로 표현한 것이다.
ㄴ>예측형 (Predictive) SDLC == traditional_development_model
 순차적 development_model(예: waterfall_model, v_model), 
 반복적 development_model(예: 나선형 model, 프로토타이핑), 
 점진적 development_model(예: integration process) 등이 있다.
ㄴ>agile_development_model
 개발 중간에 REQ은 언제든 변가능. 는 가정하에, planning보다는 '변화에 대한 유연한 대응'과 '빠른 feedback'을 중심에 둡니다. 
 ㄴ>Scrum: REQ 수집 및 작성 Issue 흐름(Work in Progress)을 Kanban으로 시각화하여 병목 현상확인, Story, TASK 등은 Issue_type 으로 분류된다. 최소state는 Backlog 
 [ Epic ] (가장 큼: 수개월~수개월 이상): req 는 Story또는 Epic 으로 등재됨
  └── [ Story / Task / Bug ] (중간: 1개 스프린트 내 완료 가능)
     └── [ Sub-task ] (가장 작음: 수time~1~2일 내 완료)
 ㄴ>Scrum: backlog 정제 (Refinement)
 ㄴ>Scrum: Sprint Planning: Sprint동안 팀이 수행할 Issue 목록을 자주 planning
 ㄴ>Scrum: Sprint(스프린트 실행)
 ㄴ>XP(extream_programming): 기술적 실천 방안 강조
  TDD(testing 주도 개발)
  페어 프로그래밍 
 주요 agile 프레임워크 예시
  ㄴ>SAFe (Scaled Agile Framework): 대기업에서 가장 선호하는 프레임워크로, 포트폴리오-프로그램-팀 level을 체계적으로 연결해 대규모 agile 전환을 지원합니다.
  ㄴ>LeSS (Large-Scale Scrum): 기존 Scrum의 규칙과 role을 최소한으로 유지하면서 여러 팀이 하나의 제품을 개발할 수 있도록 확장한 프레임워크입니다.
  ㄴ>Spotify Model: 스쿠와드(Squad), 트라이브(Tribe), 챕터(Chapter), 길드(Guild)라는 자율적·지식공type 매트릭스 조직 구조를 활용하는 방식입니다.
  
  
  >특정회사에서 s/w적 technical_debt 가 많은 제품들이다.
regression_bug 가 폭발적으로 증가한 state이다.


>SQA in agile_dev_model
문서를 읽는 일보다는 'automated_test_coding하고 sys/process를 구축하는 일'을 훨씬 많이 합니다.
code 읽기/작성 & CICD 연동
SRS와 전통적 Testware가 없는데 SQA가 뭘 검증하나요?
실행 가능한 기준과 code가 SRS와 Testware를 대체합니다. 
SQA는 이를 기반으로 품질을 보증합니다.
user_story의 AC & DoR/DoD: 
ㄴ>user_story에 적힌 AC가 명확한지, 개발 exit_criteria인 DoD(Definition of Done)를 준수했는지 SQA가 process 측면에서 검증합니다.
ㄴ>automated_testing code & BDD 시나리오:엑셀 TC 문서 대신 TDD나 BDD 방식의 testing code가 Testware role을 합니다.
SQA는 이 automated_testing의 coverage와 Valid성을 management합니다.
testing 부채(Test Debt)를 잘 management해야합니다.
testing maintenance성(Test Maintainability)
automated_test_code를 무작정 많이 만드는 것보다 "UI가 바뀌어도 최소한만 수정해도 되도록 구조화(POM)하고, 변경에 민감한 UI testing는 최소화하는 것"이 애자일 SQA의 핵심 역량입니다.
>automated_testing + manual_testing 


>Double-Loop TDD
[ 외곽 사이클 (Outer Loop): BDD ]
 └─ user의 비즈니스 시나리오(Given-When-Then) 작성 및 전체 function 검증
    │
    └─ [ 내부 사이클 (Inner Loop): TDD ]
      └─ 해당 function을 구현하기 위한 함수/클래스 단위 개발 (Red-Green-Refactor)
Outer Loop (BDD): PO, QA, developer가 비즈니스 req사항 > BDD 시나리오 로 전환
Inner Loop (TDD): developer가 그 시나리오를 만족하는 code를 구현하기 위해 함수 단위로 TDD 사이클(Red-Green-Refactor)을 돌며 단단한 coding합니다.


>만능 PM
PM + PO + service_planner


>BDD : PO, service_planner, QA, developer
BDD (macro level / 인수 testing):
"user 관점에서 이 function이 제대로 동작하는가?"를 검증합니다. (sys 전체의 흐름)
BDD가 TDD를 완전히 대체할 수는 없습니다.
user의 행동(Behavior)과 비즈니스 req사항을 중심으로 testing를 작성하는 방식입니다.
developer뿐만 아니라 제품 책임자(PO), QA, service_Planner가 모두 이해할 수 있는 일반 언어(Domain Language)로 시나리오를 작성한 뒤, 이를 실행 가능한 testing code로 전환합니다.
BDD의 시나리오 작성 양식 
ㄴ>(Given-When-Then)


>TDD
TDD (micro level / unit_testing):
"code 내부의 함수와 클래스가 정확하게 design되고 동작하는가?"를 검증합니다. (개별 component의 조립)


>규제 준수가 필수적인 특수 분야에서는 agile 프레임워크를 사용하더라도 RTM을 함께 운용합니다.
의료기기 소프트웨어, 금융, 항공/방산 등 규제 산업: ISO 13485, FDA, DO-178C 등 법적/규제적 표준 부합을 증적해야 하므로 'Live RTM' 형태(Jira 등의 data를 기반으로 자동 생성되는 추적 문서)를 활용합니다.


>SDLC_model
development process의 여러 단계와 activity type이 논리적, time상으로 서로 어떻게 연관되는지 정의한다.
sw_development_process 내 일부 activity을 구체적인 development 방법과 agile practice로 설명하 기도 한다.
for example, ATDD, BDD, 도메인 주도 design(DDD), XP, function 주도 development(FDD), Kanban, 린(lean) IT, Scrum, TDD (TDD) 등이 여기에 해당한다.


>SDLC_model 선택이 testing에 미치는 영향
- testing_activity test_scope 및 시기(예: testing_level 및 test_type)
- testing docs 상세화 level
- testing_technique 및 testing approach 선택
- testing_automation test_scope
- tester의 R&R
일반적으로 순차적 development_model에서 tester는 초기 단계에서 req review, analyze_test_basis과 design에 참여 한다.
실행 가능한 code는 보통 SDLC 후반에 생성되므로, do_dynamic_testing():은 SDLC 초기 에 수행하기 어려운 case가 많다.
일부 반복적 development_model과 점진적 development_model에서는, 각 반복 주기마다 동작하는 프로토타입이나 product 증분이 만들어진다고 가정한다.
이는 반복 주기마다 모든 testing_level에서 perform_static_testing():과 do_dynamic_testing():을 수행할 수 있음을 의미한다.
증분을 자주 전달하려면 빠른 feedback과 광test_scope한 regression_testing이 필요 하다.
agile_sw_development_model에서는 project의 어느 시점에도 변화가 생길 수 있다고 가정한다.
따라서 agile_project는 regression_testing을 수월하게 하는 가벼운 work_product 과 testing_automation를 선호하게 된다.

>best_testing_전략
shift_left_testing

>best_testing_practice
다음은 선택한 SDLC_model에 상관없이 Valid하다.
- 모든 development_activity에 상응하는 testing_activity을 두어, 모든 development_activity이 qc의 target이 되게 한다.
- testing_level(2.2.1 참조)마다 구체적이면서 독립적인 testing_purpose을 설정해, 중복은 피하고, 적절하면서 포괄적인 testing이 가능하게 한다.
- 특정 testing_level을 위한 analyze_test_basis과 design를 SDLC의 상응하는 각 development
단계에서 시작해 (testing Principle 중) 조기 testing(1.3 참조) 원칙을 준수할 수 있게 한다.
- tester가 이들 work_product 의 docs 초안이 가용한 즉시 work_product review에 참여하도록 해서 이 조기 testing과 defect/fault 발견이 shift_left_testing 전략을 지원할 수 있도록 한다

>DDT(developer_driven_testing)
driven에 대한 내 해석: 개발자가 주도한다, 개발자가 이끈다. 개발자가 우선한다
QA 조직에만 testing_activity을 의존하지 않고, developer가 직접 주도하여 코드 작성 단계부터 testing_activity을 주체적으로 수행하는 문화이자 approach입니다.
TDD, ATDD, BDD은 서로 유사한 development approach으로 development 방향 Decision을 위한 수단으로 testing를 정의한다.
이런 각 approach은 coding 전에 testing를 정의하므로, shift_left_testing을 따르게 한다.
반복적 development_model을 지원하며, 다음과 같은 특징을 가진다:

>TDD
- (광test_scope한 sw_design 대신) tc를 통해 코딩 주도(Beck 2003)
- testing를 먼저 작성하고 이를 충족하도록 coding한다음, testing와 code를 refactoring
수행은 TDD 먼저이고, 기획은 BDD 가 먼저이다.

>ATDD 
- sys design process 중 인수 condition에서 testing 도출(Gärtner 2011)
- testing는 해당 testing를 만족해야 할 APP 영역을 development하기 전에 작성

>BDD
- APP의 기대 동작을 stakeholder가 이해하기 쉽도록, 간단한 자연어로 작성해 testing
케이스로 표현 - 일반적으로 Given/When/Then 형태를 사용(Chelimsky 2010)
- 이후 tc는 자동으로 실행 가능한 testing로 변환

위의 모든 approach에서 testing는 향후 구현/refactoring 시 code_quality 보장을 위해 automation testing로 유지가능.
_______________________________________________________________ 
>DevOps
1. 높은 level의 testing_automation
1. DevOps team(organization)으로 운영
1. 팀의 자율 성, 빠른 feedback, integration된 tool 체인, CICD와 같은 기술 practice를 장려한다.
1. devops_release_pipeline을 통해 높은 quality 의 code를 더 빠르게 build/testing/release 가능. 


>DevOps merits
1. code_quality , 그리고 변경사항이 기존 code에 악영향을 미치는지 여부에 대한 빠른 feedback을 제
공한다.
- CI은 developer가 unit_testing 및 static_analysis과 함께 높은 quality 의 code를 제출하도록
장려함으로써 shift_left approach(2.1.5 참조)을 장려한다.
- 안static인 testing_env 구축을 촉진하는 CICD와 같은 automation 프로세
스를 장려한다.
- non_function quality 특성(예: 성능 효율성, trust성)에 대한 가시성이 향상된다.
- release_pipeline을 통한 automation로 반복적인 manual_testing의 필요성을 줄여준다.
- 자동 regression_testing의 규모와 test_scope가 늘어나 regression 발생 risk가 최소화된다.


>DevOps risk와 어려움을 가진다:
- devops_release_pipeline을 정의하고 설정해야 한다.
- CICD tool를 도입하고 maintenance해야 한다.
- testing_automation를 위한 추가 자원이 필요하며, 그것을 설정 및 maintenance하기가 어려울 수 있다.
- DevOps 만으로는 manual_testing 완전대체 불가 manual_testing는 여전히 필요하다.


>devops_release_pipeline
1. CICD 
1. automated_testing

>DevTestOps
Testing 

>DevSecOps
Security
_______________________________________________________________ 
>shift_left approach(shift_left_testing)
testing를 SDLC 초기에 수행하도록 하는 approach
shift_left_testing는 기본적으로 testing를 더 일찍 수행해야 한다는 것을 의미하지만
(예: code가 구현되거나 component가 integration될 때까지 기다리지 않고), 
그렇다고 SDLC 후반의 testing를 무시해도 된다는 의미는 아니다.


>shift_left_testing best_practice
- review_spec(): 
이런 review_activity을 통해 모호성, 불완전성, 불일치 등 잠재적인 defect/fault을 발견하는 case가 많다.
- write_tc(): before coding, 
- execute_code(): in testing_harness in coding 
- execute automated_static_analysis, before do_dynamic_testing(): 

- 빠른 feedback을 제공하고, code 저장소에 code를 저장 시, 자동 unit_testing를 함께
제출하도록 하는 CI, 가능하다면 지속적인 release까지 적용한다.
- 가능한 초기에, non_functional_testing 
non_functional_testing는 완성 sys과 실제 env을 대변하는 testing_env이 가용한 SDLC 후반에 수행하는 trend이 있으므로 이는 일종의 shift_left_testing가 된다.
- process 초기에 훈련, 공수, cost이 추가로 들지만, process 후반의 공수와 비 용의 절감을 기대가능. 따라서 shift_left approach을 위해서는 stakeholder들이 개념을 이해하고 받아들이는 것이 중요하다.

>Retrospective(회고) 및 process_improving
특정 기간(스프린트, prj, failure/malfunction 발생 후) 동안 "우리가 일한 방식(Way of Working)을 돌아보는 정기적인 회의 및 활동"
Retrospective가 '진단'이라면 
process_improving은 '치료 및 체질 개선'


>KPT Retrospective
"다음엔 잘하자"라는 다짐을 분석하여 실질적으로 planning함. 
Keep
Problem(Issue)
Try
- 무엇이 성공적이었고, 유지해야 할 것은 무엇인가?
- 무엇이 부족했고, 개선할 수 있는 점은 무엇인가?
- 향후 개선 사항을 도입하고 성공 요소를 유지하려면 어떻게 해야 하는가?


>Retrospective의 시기
스프린트 마다, 필요시 진행가능.


>KPT Retrospective meeting
이 회의에서 참가자(tester/developer/designer/PO/business_analysis가 등)는 다음에 대해 논의한다:
Retrospective의 시기와 구성은 사용 중인 SDLC_model에 따라 달라진다.
result는 test_completion_report(참조)에 포함하는 case가 많다.
성공적 지속적인 개선, 권장된 모든Improvement에 대한 후속조치가
testing 관점에서 일반적인 merits은 다음과 같다:
- testing 효과성/효율성 향상(예: process_improving 권고 사항 구현을 통해)
- testware quality 향상(예: test_process를 함께 검토함으로써)
- 팀의 결속 및 learning 향상(예: issue를 제기하고, 개선점을 제안할 기회를 제공함으로써)
- test_basis quality 개선(예: req의 test_scope나 quality 에서 부족한 점을 발견하고 수정함으로써)
- development과 testing 간의 cowork 개선(예: 정기적으로 cowork 과정을 검토하고 최적화함으로써)


>testing_level
함께 구성하고 management하는 testing_activity set이다.
각 testing_level은 특정 development 단계의 sw와 관련해 수행하는 test_process의 instance이다.
단계에 따라 SW는 개별 component부터 완성된 sys에 이를 수 있으며, case에 따라서는 sys의 sys일 수도 있다.

testing_level은 SDLC 내의 다른 activity과 연관성을 가진다.
순차적 SDLC_model에서는
한 level의 완료 condition이 다음 level의 시작 condition에 포함되도록 testing_level을 정의하는 case가 많다.

반복적 model에서는
development_activity이 여러 testing_level에 걸쳐 진행되고, time 이 지나면서 testing_level이 서로 겹치기도 한다.

test_type은 특정 quality 특성 관련된 testing_activity의 set으로, 이런 testing_activity은 대부분 모든 testing level에서 수행가능.

>testing_level
5 testing_level
- unit_testing
- integration_testing
- sys_testing은 전
- sys_integration_testing
- acceptance_testing은 validation

>testing_level type ? 
- test_object
- testing_purpose
- test_basis
- defect/fault과 failure/malfunction
- approach과 role


> unit_testing == component_testing
- unit_testing은 component를 개별적으로 testing
unit_testing 프레임워크 #pytest
testing_harness for unit_testing
일반적으로 developer가 자신의 development env에서 수행한다.

>component_integration_testing 
integration_testing 로 부르기도 하나봄.
component 간의 interface와 상호 작용을 testing
integration_testing은 상향식, 하향식, 빅뱅 등 integration 전략에 따라 크게 달라진다.

>sys_testing
전체 sys 또는 product의 전반적인 동작과 function에 중점을 두며, end_to_end 동작에 대한 functional_testing과 quality 특성에 대한 non_functional_testing을 포함하는 case가 많다.
실제 env을 대변하는 testing_env에서 완성된 sys으로 testing하는 것을 선호하는 non_function quality 특성도 있다(예: 사용성).
서브-sys에 대한 시뮬레이션을 사용하기도 한다.
sys_testing은 독립된 sqa_team이 수행할 수 있으며, sys의 spec와 관련이 있다.

>sys_integration_testing
다른 sys 또는 외부 서비스와 test_object sys의 interface를 testing
sys_integration_testing은 가급적 운영 env과 유사한 적절한 testing_env을 사용한다.

>acceptance_testing
validation과 release할 준비, 즉 sys이 user의 business에 필요한 사항을 충족확인
acceptance_testing은 실제 user가 수행하는 것이 이상적이다.


>acceptance_testing type
- user_acceptance_testing(UAT)
- 운영 acceptance_testing
- 계약 acceptance_testing
- 규제 acceptance_testing
- 알파 testing
- 베타 testing 


>functional_testing
component 또는 sys의 function을 estimate():한다.
# function은 test_object이 ‘무엇을’ 해야 하는지를 의미한다.

>functional_testing의 주요 purpose
function 성숙도(완전성), function 정확성, function 타당성(적합성)을 확인하는 것이다.

>non_functional_testing
component 또는 sys의 function 특성 이외의 속성을 estimate():한다.
# non_functional_testing은 “sys 이 얼마나 잘 동작하는지” testing하는 것이다.
Security 가 대표적 예시이다. 
ISO/IEC 25010 Standards은 non_function quality 특성을 다음과 같이 분류한다.
- 수행 효율성(Performance efficiency)
- 호환성(Compatibility)
- 유용성(Usability) – interaction ability(interaction capability)
- trust도(Reliability)
- security(Security)
- 유지 가능성(유지 management성)(Maintainability)
- 이동성(Portability) – 유연성(flexibility)
- safty성(Safety)

>non_functional_testing의 주요 purpose
non_function quality 특성을 확인하는 것이다.


>non_functional_testing 시기
SDLC 초기(예: review나 unit_testing 중)에 시작 바람직
functional_testing에서 non_functional_testing를 도출하는 case도 많다.
이때 functional_testing에서 기능이 수행되는 동안 non_function 제약 condition의 충족 여부를 확인하게 된다(예: 특정 time 내에 function이 수행되 는지 확인하거나, function이 새로운 플랫폼으로 이식될 수 있는지 확인).
non_function defect/fault을 늦게 발견하면 prj의 성공에 심각한 위협이 될 수 있다.
non_functional_testing은 매우 특수한 testing_env이 필요한 case 도 있다.
ex>, 유용성 testing에 유용성 랩(usability lab)이 필요가.


>black_box_testing
spec와 비교해 sys의 동작을 확인
spec를 기반으로 하며, test_object의 내부 구조와 관련 없는 docs로부터 testing를 도출한다.


>white_box_testing
구조 기반이며, sys의 구현 또는 내부 구조(예: code, 아키텍처, work_flow, data_flow)에서 testing를 도출한다.
white_box_testing의 주요 purpose은 testing를 통해 내부 구 조를 인수에 필요한 level까지 충분히 커버하는 것이다.
위에서 언급한 네 가지 test_type은 모든 testing_level에 사용할 수 있지만, level마다 관심의 target은 다를 수 있다.
언급한 test_type 모두 testing_condition과 tc를 도출하기 위해 다양한 testing technique을 사용가능.


>debug():
remove_defect():
remove_fault():
remove_bug():
fix_bug():
add_feature():
change_component():
change_sys():


>new_feature_testing():


>open_issue():
reproduce_failure():
reproduce_malfunction():
add_tc(): # issue based tc


>confirmation_testing():
run_tc(): # 기존 tc 수행이 일반적이며, failure/malfunction가 다시 발생하지 않는지만 확인하는 level으로 확인하기도 한다.

>regression_testing():
check_side_effect(): # negative_effect
test_scope를 파악하기 위해 먼저 impact_analysis을 수행하는 것이 좋다.
impact_analysis은 SW의 어느 부분이 영향을 받 을 수 있는지 보여준다.
regression_testing 스위트는 반복적으로 실행되며, 반복 주기 또는 release 때마다 regression_testing case 수가 늘어나게 되므로, 
# Targeted Regression | Smoke & Sanity Test | Full Regression 
# target, target~ target 주변, full 
# Full Regression automation 되어있고 time이 얼마 안걸린다면 이거하는게 젤이득
이런 testing의 automation는 project 초기에 시작해야 한다.
DevOps(2.1.4 참조)와 같이 CI을 사용하는 case, 자동 regression_testing를 포함하는 것이 best_practice이다.
상황에 따라 여러 testing_level의 regression testing가 포함될 수 있다.
어떤 testing_level이라도 해당 level에서 defect/fault을 수정하거나 변경을 적용한 case, test_object에 대한 확 인 testing과 regression_testing이 필요하다.


> def automate_testing():
# testing_automation
regression_testing는 automation하기 매우 적합한 target이 된다.
test_pyramid 하층(unit test , integration test, api test)은 는 초기도입에 긍적적 도입을 해야한다. 
test_pyramid 상층(e2e test, ui test)은 초기도입에 조심해야한다
AI 덕분에 가능한 세상이 와서 충분히 가능하다. Testing 코드 작성 자동화로 .



>flaky_testing
자동화에서 고쳐야할 test이다.


>maintenance_testing
issue를 수정하기 위한 maintenance
env 변화에 적응위한 maintenance
성능 개선위한 maintenance
maintenance성(자세한 내용은 ISO/IEC 14764 참조) 개선위한 maintenance

>maintenance_testing
planned_release 또는 unplanned_release(hotfix) 모두와 연관돼 있다.

>maintenance_testing
변경 전에 impact_analysis을 수행해 sys의 다른 영역에 미칠 잠재적 영향을 변경사항 Decision에 참고가능.
impact_analysis + confirmation_testing + regression_testing

>confirmation_testing 
변경역역을 target한 testing

>regression_testing 
비변경역역을 target한 testing


>test_scope of maintenance_testing
일반적으로 다음에 따라 달라진다
- 변경의 risk level
- 기존 sys의 크기
- 변경사항의 크기


>maintenance_testing(): trigger
- planned Improvement(즉, release 기반), 수정을 위한 변경, hotfix와 같은 수정사항 때문인
case
- 운영 env의 업그레이드나 마이그레이션(예: 한 플랫폼에서 다른 플랫폼으로)으로 인한 case.
변 경된 sw_뿐만 아니라 새로운 env 관련 testing가 필요할 수 있으며, 다른 애플리케이 션의 data를 maintenance 중인 sys으로 마이그레이션 시,, data 변환 testing가 필요가능.

 APP의 수명이 다하는 등의 단종으로 인한 case.
sys을 단종 시, data 보존 기간이 길면 data 보관(archiving) testing이 필요가능.
보관 기간 중 data가 필요한 case를 대비해, 보관 이후 복원 및 복구 절차 testing이 필요가능.
_______________________________________________________________ 
>제 3 장 
>perform_static_testing():

>LO
- FL-3.1.1 (K1) perform_static_testing():으로 검토할 수 있는 work_product_type을 인식가능. 
- FL-3.1.2 (K2) perform_static_testing():의 가치를 설명가능. 
- FL-3.1.3 (K2) perform_static_testing():과 do_dynamic_testing():을 비교하고 대조가능. 
- FL-3.2.1 (K1) stakeholder feedback을 조기에 자주 받을 때의 merits을 식별가능. 
- FL-3.2.2 (K2) review_process():에서 수행하는 activity을 요약가능. 
- FL-3.2.3 (K1) review를 수행 시, 주요 role별로 어떤 responsibility이 부여되는지 상기가능. 
- FL-3.2.4 (K2) 다양한 review_type을 비교하고 대조가능. 
- FL-3.2.5 (K1) 성공적인 review에 기여하는 요소를 상기가능. 


>perform_static_testing():
test_object SW를 실행하지 않아도 된다.
code, process spec, sys 아키텍처 spec, 기타 work_product을 수동으로(예: review) 또는 
tool를 사용해 estimate():한다(예: static analysis).
testing_objectives는 quality 개선, defect/fault 식별, 또한 가독성/완전성/정확성/testing 용이성/일관성과 같은 특성을 estimate():하는 것이다.
perform_static_testing():은 verification과 validation 모두에 적용가능.

예제 매핑, user_story 공동 작성, backlog 개선 function 시 tester, business Assignee(PO, 비즈니 스 analysis가 등) 및 developer 모두 같이 cowork해 user_story와 관련된 work_product 이 정의된 기준(예: ‘준 비’의 정의)을 충족하는지 확인한다 (5.1.3 참조).
user_story가 완전하고 이해하기 쉬우며, testing 가 능한 인수 condition을 가지고 있는지 확인하기 위해 review technique을 적용가능.
적절한 질문을 통해 tester는 제안된 user_story를 탐색하고, issue를 제기하며 개선하는 데 도움을 준다.

>def do_static_analysis_codebase(): 
  # ruff
  # 올인원 린터 겸 포매터

  # Bandit (Security Analyzer)
  #   설명: 하드코딩된 비밀번호, SQL 인젝션, 위험한 함수 사용 등 파이썬 코드의 security 취약점을 탐지하기 위해 설계된 tool입니다.

  # Pysa (Python Static Analyzer, Security Analyzer)
  #   설명: 메타(페이스북)가 공개한 오픈소스 tool로, 인스타그램 등 대규모 파이썬 코드베이스에서 데이터 흐름을 추적해 security 취약점(XSS, SQL 인젝션 등)을 찾아냅니다

  # codebase formatter
  # Black 

>def do_static_analysis_by_human():
  # perform_static_testing(): input
  읽고 이해할 수 있는 모든 work_product 은 perform_static_testing():_target이 될 수 있다.
  ex> SRS, codebase, test_planning서, tc, product backlog 항목, testing_charter, project docs, 계약서, model

  # perform_static_testing(): ref
  검토할 수 있는 기준이 되는 어떤 구조가 필요하다
  (예: model, 공식 문법이 정해진 codebase나 텍스트).
  PEP8 
  
  
  >def do_static_analysis(): 
  # purpose
  1. do_dynamic_testing(): 으로 식별할 수 없는 defect/fault을 찾을 수도 있다.
  (예: 도달 불가능한 code, 원하는 대로 구현되지 않은 design 패턴, 비-실행 work_product 의 defect/fault)

  1. SDLC 초기 단계에서 defect/fault을 식별

  1. work_product 의 quality 을 estimate():하고 trust를 쌓을 방법을 제공한다.
  또한, docs화된 req 을 확인함으로써 stakeholder는 req이 실제로 자기가 필요한 것을 묘사하고 있는지 확인가능.

  1. SDLC 초기에 수행할 수 있으므로 관련된 stakeholder 간 공통된 이해를 형성가능.
  관련된 stakeholder 간의 의사소통도 개선된다.
  
  1. perform_static_testing():에 다양한 stakeholder가 참여하는 것이 권장된다.

  1. review cost는 증가하지만, 
  project 후반에 defect/fault을 수정하는 time과 노력이 줄어들어 
  대부분의 경우, 전체 project cost는 줄어든다.

  
  # perform_static_testing(): 금지
  기계어나 바이너리 파일은 역공학(디컴파일) tool나 바이너리 분석 tool를 돌리면 static_analysis을 할 수도 있습니다. 
  하지만 법적·라이선스·보안상의 이유로 tool를 돌려 내부 구조를 뜯어보는 행위 자체가 금지된 산출물은 static_analysis을 해서는 안 됩니다.
  구체적인 예시:
	• 타사 상용 소프트웨어(3rd-party 라이브러리, SDK 등)의 실행 파일: 대부분 계약서(EULA)나 저작권법에 의해 역공학(Reverse Engineering)이나 코드 분석이 법적으로 금지되어 있습니다.
	• 외부에서 제공받은 black_box 형태의 API 바이너리 모듈.
  static_analysis에서 tc는 test target 이다.

  # static_analysis을 CI 프레임워크에 integration 하는 case가 많다
  cicd 에 unit test 전에 ruff를 넣어야 겠다. 
  python 코드에는 ruff(linter+formatter)를 도입
  rust 코드에는 cargo 의 Clippy(linter) , rustfmt(formatter) 를 도입

  # 주로 구체적인 code defect/fault을 식별하는 데 사용하지만
  # maintanence_ability과 estimate():하는 데도 사용한다.
  # security을 estimate():하는 데도 사용한다.

  # 맞춤법 검사기나 가독성 tool도 static_analysis tool의 예라고 가능.
  do_static_analysis_codebase(): 

>def perform_static_testing(): 
  # perform_static_testing(): == do_static_review():

  # tested by tool
  do_static_analysis(): 
    
  # tested by human
  do_static_analysis_by_human(): 
  
  
  >Defect==Bug==Fault 
# ISTQB에서 formal 동의어로 취급
Root_cause > Error > sw_defect/fault(Defect) > failure/malfunction(Failure)의 인과관계로 용어를 엄격히 구분

>Root_cause
촉박한 출시 일정으로 인한 피로 누적

>Error==Mistake 
# ISTQB 공식 용어집에서는 Error와 Mistake를 100% 동일한 뜻의 동의어
코딩실수행위, req사항작성실수 행위 
  
>Failure
# expected_result != actual_result
기대된 동작이나 result와 actual_result 사이에 관찰 가능한 편차(Observable deviation)

>malfunction
# expected_result != actual_result
# ISTQB 공식 용어로 Failure만 사용하며, Malfunction이라는 용어는 별도로 정의하지 않습니다.
# 자동차·임베디드·하드웨어 (ISO 26262 등)
# 제어 sys의 Functional Safety 분야 Failure와 Malfunction을 구분
자동차 브레이크 sys이 sw_defect/fault(Fault)으로 인해 expected_result != actual_result 이면
을 Malfunction(오작동) 또는 Malfunctioning behavior 라고 부릅니다.


>perform_static_testing():과 do_dynamic_testing():의 diff
# perform_static_testing():과 do_dynamic_testing():은 서로를 보완한다.
두 activity은 work_product defect/fault의 식별을 지원하는 등 비 슷한 purpose을 가지고 있지만(1.1.1 참조), 다음과 같은 diff도 있다:
- perform_static_testing():과 do_dynamic_testing()(failure/malfunction analysis을 통해) 모두 defect/fault을 식별한다는 것은 같지만, perform_static_testing():이나 do_dynamic_testing(): 중 한 가지로만 식별할 수 있는 defect/fault type도 있다.
>perform_static_testing():
# defect/fault을 직접 식별

>perform_static_testing():
# unreachable_code, dead_code를 쉽게 찾는다. 

>perform_static_testing():
# code 실행에 의존하지 않는 quality 특성(예: maintenance성)을 측정하는 데 사용


>do_dynamic_testing():
# failure/malfunction를 일으킨 후 연관된 defect/fault을 후속 analysis을 통해 찾아낸다.

>do_dynamic_testing():
# code 실행에 의존적인 quality 특성(예: 성능 효율성)을 측정하는 데 사 용가능.

>perform_static_testing():
더 쉽게 적은 cost으로 식별할 수 있는 대표적인 defect/fault은 다음과 같다:
- req defect/fault(예: 불일치, 모호성, 모순, 누락, 부정확성, 중복)
- design defect/fault(예: 비효율적인 db 구조, 모듈화 불량)
- 특정 type의 코딩 defect/fault(예: 정의되지 않은 값을 가진 변수, 선언되지 않은 변수,unrechable_code ,duplicated_code, 과도한 code 복잡성)
- Standards 위반(예: 코딩 Standards 명명 규칙을 준수하지 않는 case)
- 잘못된 interface spec(예: 매개변수의 개수, type, 순서 불일치)
- 특정 type의 security 취약성(예: 버퍼 overflow)
- test_basis coverage의 diff 또는 부정확성(예: 인수 condition 하나에 대한 testing 누락)


>stakeholder feedback을 조기에 자주 받을 때의 merits
잠재적인 quality issue를 조기에 파악가능.
SDLC 동안 stakeholder의 참여가 적으면 development 중인 product이 stakeholder의 초기 및 현재 req를 충족하지 못가능.
stakeholder가 원하는 것을 전달하지 못하면 큰 cost이 드는 재function, 납기일 지연, 서로 간의 비 난 등이 발생할 수 있으며, worst_case project가 완전히 실패할 수도 있다.
SDLC 전반에 걸쳐 stakeholder의 feedback을 자주 받으면 req에 대한 오해를 방지하고 req_change을 조기에 이해하고 구현가능.
이를 통해 dev_team은 구현 중인 product에 대한 이해도를 높일 수 있다.
그리고 stakeholder에게 가장 중요하고, 식별한 risk에 가장 positive인 영향을 미치는 function에 집중가능.


>def change_request():
- Change Request (CR): 변경 요청
req_change


>def review_process()(): 
  ISO/IEC 20246 Standards은 체계적이면서 유연한 프레임 워크를 제공하는 보편적인 review_process()를 정의한다.
  필요한 review가 공식적일수록 각 activity에 대해 설 명된 function 중 수행할 것이 더 많아지게 된다.

  work_product 이 너무 커서 한 번의 review로 다룰 수 없는 case도 많다.
  전체 work_product 의 review를 끝내 기 위해 review_process()를 여러 번 수행가능.

  review_process():에 포함되는 activity은 다음과 같다:
>def plan():
  # purpose, review target work_product , estimate():할 quality 특성, 집중할 영역, 
  # 완료 condition
  # 적용 Standards과 같은 추가 info
  # 공수
  # review 일정 
  # review의 test_scope를 정의해야 한다.

>review technique
(예: checklist 기반 review, 시나리오 기반 review)

review 착수의 objectives는 관련된 모든 사람과 사항이 review를 시작할 준비가 되었는지 확 인하는 것이다.
여기에는 모든 Participants가 review 중인 work_product 에 접근할 수 있는지, 자신의 r&r을 이해하고 있는지, review를 수행하는 데 필요한 것들을 받았는지 확인하는 과정이 포함된다.
>개별 review.
모든 reviewer는 하나 이상의 review technique을 적용해 review 중인 work_product 의 quality 을 estimate():하고, anomaly, recommandations, questions을 식별하기 위해 개별 review를 수행한다.
ISO/IEC 20246 Standards은 여러 review technique에 대한 보다 심층적인 내용을 제공한다.
reviewer는 식별한 모든 anomaly, recommandations, questions을 기록한다.

>논의 및 analysis.
review 중에 확인한 anomaly이 반드시 defect/fault은 아니므로 모든 anomaly에 대해 analysis하고 논의할 필요가 있다.
각 anomaly의 state, Assignee, 필요 조치를 판단해야 한다.
이는 일반적으로 review 회의에서 이루어지며, 회의에서 참가자들은 review한 work_product 의 quality level 과 필요한 후속 조치도 Decision한다.
조치를 완료하기 위해 후속 review가 필요가능.

>수정 및 보고.
모든 defect/fault에 대한 defect/fault report를 작성해 후속 조치가 추적 가능하도록 한다.
완 료 condition을 충족하면 function result물을 Acknowledgement가능.
review result를 보고한다.


>review(): 에서의 R&R
# 세부적인 role은 ISO/IEC 20246 Standards에서 설명하고 있다.
review에는 다양한 stakeholder가 참여하며, 한 명이 여러 role을 동시에 맡을 수도 있다.
주요 r&r은 다음과 같다:

- admin - review할 내용을 Decision하고, review에 필요한 사람과 time 등 자원을 제공한다.
- Author - review target work_product 을 작성하고 수정한다.
- Facilitator(중재자, 퍼실리테이터, Moderator) - 중재, time management, 모든 사람이 자유롭게 발언할 수 있는 safty # review_leader 의 role 인듯
한 review env 조성 등 review 회의의 효과적인 운영을 담당한다.
- 서기(기록자) - reviewer로부터 anomaly을 수집하고, Decision 사항이나 review 회의 중에 발
견한 새로운 anomaly 등 review info를 기록한다.
- reviewer - review를 수행한다.
reviewer는 project에 참여하는 사람 또는 주제 전문가, 기타 stakeholder가 될 수 있다.
- review leader - review에 참여할 사람을 Decision하고, review time과 장소를 협의하는 등 review에 대한 전반적인 responsibility을 진다.


>def classify_review_type():
  # 사용 중인 SDLC, development process의 성숙도, review target work_product 의 중요도와 복잡성, 법적 또는 규제 req, 감사용 기록의 필요성 등에 따라 달라진다.
  state = 
  if state == "TBD":
    review_type = "formal_review"
  if state == "TBD":
    review_type = "informal_review" 
  return review_type

  # 처음에는 informal_review하고 나중에 보다 formal_review하는 등, 같은 work_product 도 여러 형태로 review가능.
  
  
  >review purpose
purpose 외에도 project req, 가용 자원, work_product_type과 risk, business 영역, 사내 문화와 같은 요소도 선택에 반영된다.
slow


>informal_review
주요 목적 빠른 Error 발견: 문서화나 절차에 에너지를 쏟기보다, 작성자가 놓친 오타, 논리적 Error, 요구사항 누락 같은 sw_defect/fault(Anomaly)을 빠르고 저렴한 비용으로 찾아내는 데 집중합니다.
동료들과 가볍게 작업물을 훑어보며 실수나 sw_defect/fault을 빠르게 찾아내는 실용적인 검토 방식
  (Main purpose is to detect anomalies)
정의된 process를 따르지 않으며, formal result docs도 req하지 않는다.
주요 purpose은 anomaly을 식별하는 것이다.


>walkthrough vs inspection vs technical_review


>technical_review
# 공식적이다.
# 관리자 미참석
Facilitator가 leader
technical_review는 기술적인 자격을 갖춘 reviewer가 수행하고, 
technical_review의 purpose은 기술 issue에 대한 Consensus를 도출하고 Decision을 내리는 것뿐만 아 니라, anomaly 식별, estimate_quality(): 및 work_product 에 대한 trust 구축, 새로운 idea 창출, 저 자가 개선할 수 있도록 동기를 부여하고 지원하는 것이다.
# 문제 지문에 **"Consensus(합의)"**나 **"대안 평가"**라는 키워드가 나오면 **technical_review**가 정답


>walkthrough (static_testing_type 중의 1개)
# 공식적이다.# 유하다.
# static_testing_type 중의 1개
Author가 leader
estimate_quality(): 및 work_product 에 대한 trust 구축, reviewer education, Consensus 도출, 새로운 idea 창출, Author가 개선할 수 있도록 동기 부여 및 지원, anomaly 발견 등 여러 가지 purpose을 달성가능.
reviewer는 walkthrough 전에 개별 review를 수행할 수도 있지만, 반드시 해야 하는 것은 아니다.



>inspection
# 주요 purpose은 anomaly을 최대한 많이 찾는 것이다.
# most_formal_review 이다.
# 6단계 절차, checklist, metrics 수집
# static_testing_type 중의 1개
# most_formal_review "엄격한 규칙/절차"
# "metrics 수집", **"process 개선"**이 강조
# inspection은 가장 formal review_type이다
# 보편적 inspection process(3.2.2 참조) 를 철저히 따라야한다.
# 기타 purpose으로 quality estimate():, work_product 에 대한 trust 구축, Author가 개선할 수 있도록 동기 부여 및 지원을 들 수 있다.
# metrics을 수집해 review_process()를 포함한 전체 SDLC를 개선 하는 데 사용한다.
# inspection에서는 Author가 review leader나 서기가 될 수 없다.

>collect_metrics():
  # purpose
  1. process 개선: "checklist를 바꿨더니 시간당 sw_defect/fault 발견율이 20% 올랐네?"처럼 review 방식이 효과적인지 판단할 수 있습니다.
  2. 비용 및 일정 예측: 다음 프로젝트에서 비슷한 분량의 문서를 review할 때 시간과 인력이 얼마나 들지 정확히 예측할 수 있습니다.
  3. 품질 기준(exit_criteria) 확인: "페이지당 sw_defect/fault이 0.5개 미만일 때 review를 통과시킨다" 같은 객관적인 종료 조건(Exit Criteria)으로 활용합니다.

>review_Participants r&r
역할 (Role)	핵심 책임 및 시험 키워드
관리자 (Manager)	# review 실행 여부 Decision (무엇을 review할지 Decision)
# review에 필요한 자원(시간, 인력, 예산) 할당
# review result를 바탕으로 목표 달성 여부 모니터링
작성자 (Author)	# 검토 대상이 되는 작업 산출물 생성
# review에서 발견된 sw_defect/fault 수정(Fix)
review 리더 (Review Leader)	# review에 대한 전반적인 책임(Overall responsibility)
# 언제, 어디서 review할지 Decision 및 참여자 선정
퍼실리테이터 (Facilitator)
# (구 모더레이터)	# 실제 review 회의 진행 및 시간 관리
# 참가자 간 중재(Mediation) 및 safty한 분위기 조성
review어 (Reviewer)
# (검토자)	# 산출물을 검토하여 이상 징후(Anomaly/sw_defect/fault) 식별
# 주제 전문가(SME), tester, 사용자 등 다양한 관점에서 참여
서기 (Scribe / Recorder)	# review 회의에서 발견된 모든 이상 징후(sw_defect/fault) 기록
# 회의에서 내린 Decision 사항 및 액션 아이템 문서화
돈·시간(자원)을 대주는 사람 → 관리자(Manager)
판 깔아주고 사람 모으는 사람 → review 리더(Review Leader)
회의 마이크 잡고 진행하는 사람 → 퍼실리테이터(Facilitator)
sw_defect/fault 찾아내는 사람 → review어(Reviewer)
찾아낸 sw_defect/fault 받아 적는 사람 → 서기(Scribe)
문서 만들고 나중에 고치는 사람 → 작성자(Author)


>def review(): 
  # review_leader. : 
  개별 review 또는 review 회의(개최 시)에서 집중력을 잃지 않도록 작은 단위로 review를 진행한다.
  # 회의에 facilitation을 적용한다. # facilitation(회의 진행 및 조율)
  # 참가자가 review를 준비할 수 있는 충분한 time을 제공한다.
  review_leader.decide_Participants():
  전반적인 책임(Overall responsibility)", "참가자 선정(Decides who will be involved)", "일정 및 장소 Decision(Organizes when and where)"이라는 키워드가 나오면 review 리더(Review Leader)

  review_Participants(): # 
  # stakeholder와 Author에게 review feedback을 제공해 product 및 activity을 개선할 수 있게 한다

  참가자의 estimate():가 purpose이 되어서는 절대 안 된다.
  # 주어진 objectives를 달성할 수 있으면서 work_product_type, review_Participants():, project req 및 정황에 맞는 review_type을 선택한다.
  # review_process()를 management층이 지원한다.
  # learning 및 process_improving 촉진을 위해 review가 조직 문화의 일부가 되도록 한다.
  # 모든 참가자가 자신의 role을 어떻게 충족해야 하는지 알 수 있도록 적절한 education을 제공한다.
  
  return result # 명확한 objectives와 측정 가능한 완료 condition을 정의한다.
_______________________________________________________________ 
>제 4 장 
> def analyze_test_basis(): #
   # static analysis
   # perform_static_tests
   # perform_test_analysis
   
> def design_tests():
  # perform_test_design
  # testing_technique 를 활용하여 design_tests() 를 수행한다.

_______________________________________________________________
>testing_technique overview
# testing_technique활용하여 test_basis 분석하여 tc를 도출
black_box_testing_technique
white_box_testing_technique
experience_based_testing_technique을 구별가능. 
_______________________________________________________________
>black_box_testing_technique
- FL-4.2.1 (K3) EP을 사용해 tc를 도출가능. 
- FL-4.2.2 (K3) BVA을 사용해 tc를 도출가능. 
- FL-4.2.3 (K3) decision_table_testing을 사용해 tc를 도출가능. 
- FL-4.2.4 (K3) state transition testing을 사용해 tc를 도출가능. 
_______________________________________________________________
>white_box_testing_technique
- FL-4.3.1 (K2) statement_testing
- FL-4.3.2 (K2) branch_testing
- FL-4.3.3 (K2) white_box_testing의 가치를 설명가능. 
# test_basis 가 더 풍부하기 때문에, 더 넓은 범위에서 testing 설계가 가능하며, blackbox testing 과 상호 보완적
_______________________________________________________________
>experience_based_testing_technique
- FL-4.4.1 (K2) error_guessing(Error추정)
- FL-4.4.2 (K2) exploratory_testing
- FL-4.4.3 (K2) checklist_기반_testing
_______________________________________________________________
>collaboration_based_testing approach
- FL-4.5.1 (K2) developer 및 업무 대표자와 cowork해 user_story를 작성하는 방법을 설명가능. 
- FL-4.5.2 (K2) 인수 condition을 작성하는 여러가지 방법을 분류가능. 
- FL-4.5.3 (K3) ATDD을 사용해 tc를 도출가능. 
 

>testing_technique
# black_box_testing_technique
# white_box_testing_technique
# experience_based_testing_technique
tester의 analyze_test_basis(무엇을 testing할지)과 test_design(어떻게 testing할지) function을 지원한다.
testing_technique은 적은 수이지만, 
충분한 tc를 체계적인 방식으로 development할 수 있도록 해 준다.
또한, 
tester가 design에서 analyze_test_basis을 가지고 testing_condition을 정의하고, 
coverage 항목 과 testing_data를 식별하는 데 도움을 준다.
testing_technique에 관한 보다 자세한 info는 ISO/IEC/IEEE 29119-4 Standards과 Beizer 1990, Craig 2002, Copeland 2004, Koomen 2006, Jorgensen 2014, Ammann 2016, Forgács 2019를 참조가능.

_______________________________________________________________
>black_box_testing_technique(spec 기반 technique이)
내부 구조를 참조하지 않고, test_object의 명시된 동작에 대한 analysis을 기반으로 한다.
따라서 tc는 sw_구현 방식에 의존하지 않는다.
결국 구현이 바뀌더라도 필요한 동작이 동일하다면, tc는 여전히 Valid하게 된다.
- EP
- BVA
- decision_table_testing
- state transition testing

>EP
test_object이 하나의 partition(EP이)에 포함된 모든 요소를 동일한 방식 으로 처리할 것이라는 가정하에 data를 partition 단위로 나눈다.
이 technique의 근거 이론은 EP에 속 한 특정 값을 testing하는 tc로 defect/fault을 식별가능. 면, 같은 EP의 다른 어떤 값을 testing하는 tc라도 해당 defect/fault을 식별할 수 있어야 한다는 것이다.
따라서 각 partition에 대해 하나의 testing만 수행하면 충분하다.
EP은 입력, 출력, 형상 항목, 내부 값, time 관련 값, interface 매개변수 등 test_object과 관련 된 모든 data 요소에 대해 식별가능.
partition은 연속적이거나, 연속적이지 않을 수도 있으며, 정렬돼 있거나, 유한 또는 무한일 수도 있다.
partition은 서로 겹치지 않아야 한다, Disjoint(공set), 값이 없는 공set(교set이 비어있는 set)

단순한 testing_항목의 case, EP을 적용하기가 쉬울 수 있지만, 실제로는 test_object이 다양한 값을 어떻게 처리하는지 이해하기 어려울 때가 많다.
따라서 partition 식별은 신중하게 해야 한다.


>Valid partition


>invalid partition
# Valid한 값과 invalid 값의 정의는 팀과 조직마다 다를 수 있다...
ex> test_object이 처리해야 하는 값 또는 spec에 처리가 정의된 값을 Valid 값으로 해석가능.
invalid 값은 test_object이 무시하거나 거부해야 하는 값, 또는 test_object spec에 처리방법이 정의되어 있지 않은 값으로 해석가능.

EP에서 coverage 항목은 각 partition이 된다.
이 testing_technique으로 100% coverage를 달성하려면 tc로 각 partition을 최소 한 번씩 다뤄서 식별한 모든 partition(invalid partition 포함)이 실행되도록 해야 한다.
>EP coverage == 
하나 이상의 tc로 실행한 partition 수 / 식별한 총 partition 수 백분율

많은 testing_항목이 다수의 partition set(예: 입력 변수가 2개 이상인 test_object)을 가지고 있기 때문에 하나의 tc는 여러 partition set에 속한 partition을 다루게 된다.


>each_choice_coverage
partition set이 다수인 case, simplest coverage 기준을 each_choice_coverage라고 한다
tc가 모든 partition set의 각 partition을 최소 한 번은 실행할 것을 req한다.
each_choice_coverage에서는 partition의 combination을 고려하지 않는다.
_______________________________________________________________
>BVA
EP의 경계 실행을 기반으로 하는 testing_technique이다.
따라서 BVA은 정 렬된 partition에만 사용가능.
partition의 최솟값과 최댓값이 경계값이 된다.
BVA에서 두 값이 같 은 partition에 속하는 case, 둘 사이의 모든 값도 해당 partition에 속해야 한다.

developer가 partition의 경계에 있는 값을 다룰 때 error를 범할 가능성이 높기 때문에 
BVA은 partition의 경계에 있는 값에 초점을 두게 된다.
BVA으로 많이 찾는 defect/fault은 구현된 경계가 의도한 위치보다 위나 아래에 잘못 배치됐거나 아예 누락된 defect/fault이다.

>def 2_value_bva(list = 구간[x1:x2]):
  # 경계값과 인접 partition에 속한 가장 가까운 값이 coverage 항목이다.
  # 2_value_bva에서 100% coverage를 달성하려면, tc로 모든 coverage 항목, 즉 식별한 모든 경계값을 실행해야 한다.
  return [y1, y2, y3]

>def 3_value_bva(list = 구간[x1:x2]):
  # 2_value_bva보다 더 엄격
  # 2_value_bva으로 발견하지 못한 defect/fault을 식별할 수
  # 3_value_bva은 각 경계값에 대해 3의 coverage 항목을 도출한다.
  # 경계값과 이웃한 양쪽의 값 모두가 coverage 항목이다.
  # 따라서 3_value_bva에서는 경계값이 아닌 coverage 항목도 있을 수 있다.
  # 3_value_bva에서 100% coverage를 달성하려면, tc로 모든 coverage 항목, 즉 식별한 경계값과 그 이웃 값을 실행해야 한다.
  # ex>,"if (x≤10) .."이라는 Decision statement이 "if (x=10) .."
  # 으로 잘못 구현된 case, 2_value_bva으로 도출한 testing_data(x=10, x=11)는 defect/fault을 식별 불가.
  # 그러나 3_value_bva으로 도출한 x=9는 이를 식별할 가능성이 크다.
  return [x1-1, x1, x1+1, x2-1, x2, x2+1]

>def 2_value_bva_coverage():
  return (실행한 경계값의 수 / 식별한 경계값의 총수) *100 

>def 3_value_bva_coverage():
  return 실행한 경계값과 이웃한 값의 수 / 식별한 경계값과 이웃 값의 총수 *100
_______________________________________________________________
>decision_table_testing
decision_table은 서로 다른 condition combination으로 달라지는 result를 나타내는 방식으로 req이 제대로 구현되 었는지를 testing하는 데 사용한다.
decision_table은 business 규칙과 같은 복잡한 논리를 기록하는 효과적인 방법이다.
# 간과했을 수도 있는 combination을 포함한 모든 condition combination을 식별하는 체계적인 방법을 제공한다는 점이다.
또한, 누락되거나 모순되는 req을 찾는 데 도움이 된다.
condition의 수에 따라 규칙의 수는 기하급수적으로 늘어나기 때문에, condition이 많으면 모든 Decision 규칙을 실행하는 데 오랜 time이 걸릴 수 있다.
이런 case, 실행해야 하는 규칙의 수를 줄이기 위해 decision_table을 최소화하거나, 
risk 기반 approach을 사용가능.

decision_table을 만들 때 condition들과 그에 따른 sys의 동작 result를 정의한다.
이것이 table의 행을 구성한다.
열은 각각 하나의 Decision 규칙을 나타내며, 어떤 고유한 condition combination을 연관 동작과 함께 정의한다.

>제한-입력(limited-entry) decision_table
# 조건이나 result가 단순히 'Y/N | T/F'로 나뉠때 사용
모든 condition과 동작 결괏값(관련 없거나 실행 불가능한 값 제외; 아래 참조)을 부울값(Boolean value.
참 또는 거짓)으로 표시한다.

>확장-입력(extended-entry) decision_table
# 조건이나 result가 단순히 '여러 가지 값이나 구간(범위)'로 나뉠때 사용
# "limited_entry_decision_table" 보다 대부분의 경우인 것 같다. 간단하지 않기 때문에. 
그 구체적인 값을 표 안에 직접 적어 넣는 Decision 테이블 방식입니다.
condition 및 동작 결괏값의 일부 또는 전부가 복수의 값(예: 숫자 test_scope, EP, 불연속 값)을 취가능.

>def complete_decision_table():
# 작성 및 해석
"T"(참)는 condition이 충족됨을 의미한다. 
"F"(거짓)는 condition이 충족되지 않았음.
"–"는 해당 condition 값이 result에 영향이 없음을 의미한다. 
"N/A"는 해당 규칙에서 condition이 실행 불가능함을 의미한다.
result 동작은 다음과 같다: "X"는 동작이 발생해야 함을 의미한다.
공백은 동작이 발생하지 않아야 함을 의미한다.
기타 표technique도 사용 가능하다.

>Full decision_table
# 가능한 모든 조건의 조합(경우의 수)을 빠짐없이 전부 나열한 Decision 테이블
모든 condition combination을 포함할 수 있는 충분한 열이 있다.
실현 불가능한 condition combination 열을 삭제해 table을 더 단순화 가능.
일부 condition이 result에 영향을 미치지 않는 열들을 하나로 병합해 table을 최소화할 수도 있다.
decision_table 최소화를 위한 알고리즘은 이 syllabus의 test_scope를 벗어난다.

>partial/collapsed decision_table
# "-" 조건에 대한 행은 decision_table에서 소거한 state, jira에 실무적으로 자주 open_issue(): 하는 형태.

>def decision_table_testing_coverage():
  # 항목은 실현 가능한 condition combination을 가진 열이 된다.
  # 100% coverage를 달성하려면, tc가 이런 열을 모두 실행해야 한다.
  return (실행된 열의 수 / 실행 가능한 열의 총수) * 100
_______________________________________________________________
>state transition testing
여러 가지 coverage 측정 기준이 있다.
이 syllabus는 그 중에서 다음 세 가지를 설명한다:

>state_diagram
가능한 state와 Valid한 state transition를 표시해 sys 동작을 modeling한다.
transition는 하나의 event에 의해 발생하며, 별도의 guard condition이 있을 수 있다.
transition는 즉각적인 것으로 간주되며, 가끔 SW의 어떤 동작으로 연결되기도 한다.

>state_table
state_diagram을 다르게 표현한 model이다.
행(rows)은 state를 나타내고, 열(columns)은 event를 (guard_condition이 있는 case 함께) 나타낸다.
table 항목(셀, cell)은 transition를 나타내며, 정의되어 있는 case에는 objectives state(target state)와 그에 따른 result 동작도 포함한다.
state_transition_diagram 과 달리 state_table은 invalid transition를 빈 셀로 명확하게 보여준다.

state_diagram이나 state_table을 기반으로 하는 tc는 보통 일련의 event 순서와 그 result로 생기는 state 변화로 (그리고 필요하다면 동작으로도) 표현된다.
하나의 tc는 대부분의 case 여러 개의 state transition를 포함한다.


>def All state transition testing_coverage():
  # coverage 항목은 state이다.
  # 100% state coverage를 달성하려면,
  # 모든 state가 실행되도록 tc를 구성해야 한다.
  return 실행된 state 수 / 전체 state 수 * 100 
  
  
  >def valid_transition_coverage():
  # valid_transition_coverage는 가장 널리 사용하는 coverage condition이다.
  # valid_transition_coverage 100%를 달성하면, All state coverage도 달성된다.
  # mission과 safty에 치명적인 SW의 case, 이 것을 충족해야 할 최소 기준으로 삼아야 한다.
  # valid_transition_coverage(0-스위치 coverage)에서는 각 Valid transition가 coverage 항목이 된다.
  # valid_transition_coverage 100%를 달성하려면, tc가 모든 Valid transition를 실행해야 한다.
  return Valid transition 수 / 총 Valid transition 수 *100

> def All transitions coverage(): 
  # best
  # 일반적으로 모든 transition를 실행해야 달성할 수 있기 때문에, All state coverage보다 강하다.
  # All transitions coverage를 100% 달성하면, All state coverage와 valid_transition_coverage도 모두 보장된다.
  # state_table에 표시된 모든 transition들이다.
  # All transitions coverage 100%를 달성하려면 tc로 모든 Valid transition를 실행하고, invalid transition의 실행도 시도해야 한다.
  # 하나의 tc에서 오직 하나의 invalid transition만을 testing하는 것은 defect/fault 마스킹(fault masking)을 방지하는 데 도움이 된다.
  # 즉 하나의 defect/fault이 다른 defect/fault 탐지 를 방해하는 상황을 방지가능.
  return 실행된 tc로 수행하거나, 커버하려고 시도 한 Valid 및 invalid transition 수를 총 Valid 및 invalid transition 수*100

> def All state coverage():
  All state coverage 100% 라고 모든 전이를 커버하는건 아니다. 
_______________________________________________________________
>white_box_testing_technique(구조_기반_technique이)
test_object의 내부 구조와 처리에 대한 analysis을 기반으로 한다.
tc는 sw_design 방식에 의존하기 때문에 test_object의 design나 구현 이 끝난 후에 만들 수 있다.
- statement_testing
- branch_testing

safty이나 mission에 치명적이거나 무결성이 높아야 하는 env에서는 보다 철저한 code_coverage를 달성하기 위해 사용하는 보다 엄격한 white_box_technique이 사용된다.
또한, 상위_testing_level(예: api_testing)에 사용하거나, code와 관련 없는 coverage(예: 신경망 testing에서 뉴런 coverage)를 사용하는 white_box_testing_technique도 있다.
이런 technique은 이 syllabus에서 다루지 않는다.
_______________________________________________________________
>statement_testing
coverage 항목은 실행 가능한 statement이 된다.
purpose은 code_statement을 실행하는 testing case를 design해서 허용할 수 있는 level의 coverage를 달성하는 것이다.

>def statement_testing_coverage():
  # if statement_testing_coverage ==100% 라고 해서 defect/fault이 반드시 식별되는 것은 아니다.
  # if statement_testing_coverage ==100% 모든 Decision 논리를 testing했다고 보장하는 것도 아니다.
  # if statement_testing_coverage ==100% code의 모든 실행 가능한 statement을 적어도 한 번은 실행했다는 것이 보 장된다.
  # 이는 defect/fault이 있는 모든 statement도 실행해 defect/fault 존재를 식별할 수 있는 failure/malfunction가 나타났어야 함을 의미한다고 여길 수 있다.
  return tc가 실행 한 statement 수 / code의 실행 가능한 statement 총수 *100

ex> data에 종속적인 defect/fault(예: 분모를 0으로 설정한 case에만 실패하는 나눗셈)은 식별 하지 못가능.

ex> code의 모든 branch(4.3.2 참조)가 실행되지 않았을 수 있다.
_______________________________________________________________
>branch_testing과 branch_coverage
branch는 제어 흐름 그래프에서 두 노드(nodes) 간 제어의 이동으로 test_object에서 code_statement의 실행 가능 순서를 보여준다.

제어의 이동은 condition 없이(즉, 직선적 code(straight-line code)) 또는 condition에 따라 이루어질 수 있다(즉, Decision문 result).

branch_testing에서 coverage 항목은 branch이며, purpose은 code의 branch를 실행하는 tc를 design해서 허용할 수 있는 level의 coverage를 달성하는 것이다.
coverage는 tc가 실행한 branch 수를 분 기 총수*100

100% branch_coverage를 달성하면 code의 모든 branch(무condition 및 condition_branch)를 tc로 실행하게 된다.

condition_branch는 일반적으로 "if..then" Decision문의 참 또는 거짓 result, 스위치/케이스 statement의 result, 또는 루프(loop)에서 종료 또는 계속 여부의 Decision에 부합한다.

그러나 tc로 branch를 실행한다고 해 서 반드시 defect/fault을 식별할 수 있는 것은 아니다.
ex> code의 특정 경로를 실행해야 하는 defect/fault은 감지하지 못가능.

branch_coverage는 statement_coverage를 포함한다.
즉, 100% branch_coverage를 달성하는 tc set은 100% statement_coverage도 달성하지만, 그 반대의 case는 성립하지 않는다.
_______________________________________________________________
>white_box_testing의 가치
근본적인 강점은 testing 중 전체 sw_구현을 고려하므로 sw_spec가 모호하거나 뒤떨어지고 불완전한 case에도 defect/fault을 쉽게 감지가능. 는 점이다.

반면에 SW가 하나 이상의 req을 구현하지 않는 case
white_box_testing으로 그것이 누락 됐다는 defect/fault을 식별하지 못가능. 는 단점이 있다 

>white_box_testing_technique
perform_static_testing()(예: code 드라이_런 중)에 사용가능.
아직 실행할 준비가 되지 않은 code(Hetzel 1988) 외에도 pseudocode 또는 제어 흐름 그래프로 modeling할 수 있는 기타 상위 level 및 하향식(top-down) 논리를 검토하는 데 적합하다.

>white_box coverage metrics
black_box_testing만 수행해서 얻을 수 없는 실제 code_coverage metrics를 얻을 수 없다.
객관적인 coverage 측정값을 제공하고 이 coverage를 높이기 위해 추가 testing 생성을 위한 info 도 함께 제공함으로써, code trust도를 높일 수 있다. 
_______________________________________________________________
>experience_based_testing_technique
tester의 지식과 경험을 tc의 design 및 구현에 효과적으로 활용하게 한다.
이런 technique의 효과성은 tester의 ability에 따라 크게 달라진다.
# black_box testing_technique과 white_box_testing_technique으로는 식별하지 못할 수 있는 defect/fault을 찾을 수 있게 해준다.
따라서 experience_based_testing_technique은 black_box_testing_technique과 white_box_testing_technique을 보완한다.
- error_guessing
- exploratory_testing
- checklist_기반_testing
_______________________________________________________________
>error_guessing
# 경험적추정|test_carter|checklist 쓴다 이게 차이의 핵심
error_guessing은 과거의 '경험과 직관'을 바탕으로 sw_defect/fault을 예측하는 방식
tester의 지식을 기본으로 error, defect/fault, failure/malfunction 발생을 예측하는 데 사용하는 testing_technique이다.

tester의 지식에는 다음이 포함된다:
- APP의 과거 동작
- developer가 범하기 쉬운 error type과 이런 error로 인해 발생하는 defect/fault type
- 다른 유사 APP에서 발생한 failure/malfunction type

일반적으로 error, defect/fault, failure/malfunction는 입력(예: 올바른 입력을 인식하지 못함, 매개변수 error 또는 누락), 출력 (예: 잘못된 형식, 잘못된 result), 논리(예: 사례 누락, 잘못된 연산자), 계산(예: 잘못된 피연산자, 잘못된 계산), interface(예: 매개변수 불일치, 호환되지 않는 type), data(예: 잘못된 초기화, 잘못된 type)와 관련이 있을 수 있다.

defect/fault 공격은 error_guessing을 구현하는 방법 중 하나이다.
이 testing_technique은 tester가 발생 가능한 error, 결 함, failure/malfunction 목록을 만들거나 획득해서 error와 관련된 defect/fault을 식별 및 노출하거나, failure/malfunction를 유발하는 testing 를 design하도록 한다.
이런 목록은 경험, defect/fault 및 failure/malfunction data 또는 SW에 issue가 생기는 원인에 관한 일반적인 지식을 기반으로 작성가능.

error_guessing과 defect/fault 공격에 대한 자세한 내용은 Whittaker 2002, Whittaker 2003, Andrews 2006을 참조가능.
_______________________________________________________________
>exploratory_testing
쉽게 말하면 test_basis가 부족하거나 불명확함 경우.
'실시간 학습, 설계, 실행을 동시에 진행'하는 접근 방식
exploratory_testing에서는 tester가 test_object에 대해 배워가면서 testing의 design, 실행, estimate()를 동시에 하게 된다.
이 testing은 test_object에 대해 더 배우고, 집중하고 있는 testing는 더 깊이 탐색하고, 
testing 되지 않은 영역에 대한 testing를 만들기 위해 사용된다.

때로 testing을 구조화하기 위해 세션_기반_testing을 사용하기도 한다.
세션_기반_접근법에서는 exploratory_testing을 time을 정해 놓고 수행한다.

>testing_charter
tester가 달성해야 할 구체적인 testing_purpose와 testing_coverage를 정의한 짧은 계획서

>exploratory_testing을 진행할 때 
tester는 testing_charter를 testing 지침으로 사용한다.
일반적으로 testing 세션이 끝나면 보고가 이어진다.
이때 tester와 testing 세션 result에 관심이 있는 stakeholder 간의 토론이 이루어진다.
이 approach에선 testing 목적을 상위 level의 testing_condition으로 취급가능.
coverage 항목은 testing 세션 중에 식별하고 실 행한다.
tester가 수행 절차와 발견 내용을 기록하기 위해 testing 세션 시트를 사용가능.

spec가 부족하거나 부적합할 case, 또 testing에 time적 압박이 심 시, 유용하다.
exploratory_testing은 다른 공식 testing_technique을 보완하기에도 유용하다.
tester가 풍부한 경험과 도메인 지식을 가지고 있고 높은 level의 analysis 기술, 호기심, 창의성 등 필요 기술을 갖춘 case exploratory_testing이 더욱 효과적일 수 있다(1.5.1 참조).

exploratory_testing 중 다른 testing_technique(예: EP)을 사용가능.
exploratory_testing에 대한 자세한 내용은 Kaner 1999, Whittaker 2009, Hendrickson 2013에서 확인가능.
_______________________________________________________________
>checklist_기반_testing
tester는 checklist를 활용해 testing_condition을 확인하는 testing를 design, 구현, 실행한다.
checklist는 경험, user에게 중요한 것이 무엇인지에 대한 지식, 또는 SW가 실패 하는 이유와 방법에 대한 이해를 바탕으로 작성가능.

자동으로 점검할 수 있는 항목, 시작 condition, 종료 condition으로 더 적합한 항목, 너무 일반적인 항목은 checklist에 포함해서는 안 된다. (Brykczynski 1999) checklist 항목을 질문 형식으로 표현하는 case가 많다.

각 항목은 개별적이면서 직접적으로 확인할 수 있어야 한다.
ㄴ test항목간 종속성 없어야 하나봄. 

이런 항목은 req, 그래픽 interface 속성, quality 특성 또는 기타 type의 testing condition일 수 있다.

checklist는 function 및 non_functional_testing를 포함한다양한 test_type을 지원하기 위해 만들 수 있다
time이 지남에 따라 
developer가 같은 error를 범하지 않게 됨으로 
일부 checklist 항목은 점차 효과가 떨 어질 수 있다.

새로 발견한 심각도가 높은 defect/fault으로 인해 새로운 항목을 추가해야 할 수도 있다.
따라서 checklist는 defect/fault analysis을 기반으로 정기적으로 업데이트해야 한다.

하지만 checklist가 너무 길어지지 않도록 주의할 필요가 있다. 

구체적인 tc가 없는 case에 checklist_기반_testing은 testing를 위한 지침과 일정 level의 일관성을 제공가능.

checklist가 상위 level으로 작성된 case 실제 testing는 조금씩 달라질 수 있으며, 
결국 coverage는 높아지지만 재현 가능성은 떨어질 수 있다.

각 testing_technique은 defect/fault 식별과 관련해 특정 objectives를 가진다.

반면 


>collaboration_based approach
tester 혼자 test를 설계·실행하는 게 아니라, 여러 역할의 사람들이 함께 협력해서 test를 정의하고 수행하는 방식
cowork과 커뮤니케이션을 통한 defect/fault 예방에도 초점을 둔다.
개발자·기획자·tester가 같이 모여서 ‘이게 제대로 동작하는지 어떻게 확인할까?’를 논의하고 정하는 접근법”
대표적인 예시
>Three Amigos
기획자(BA) + 개발자 + tester가 모여 요구사항을 같이 이해하고 test 시나리오를 도출
>Example Mapping
규칙을 예시(Example)로 쪼개면서 test_case를 함께 만듦
>ATDD / BDD
Acceptance Test나 Given-When-Then 시나리오를 여러 역할이 같이 작성
>Pair Testing
두 명이 한 컴퓨터로 같이 test (한 명은 실행, 한 명은 관찰/아이디어 제시)
>Mob Testing
여러 명이 한 화면을 보며 함께 test
_______________________________________________________________
>collaboration_based_user_story_작성

>user_story
sys이나 SW의 user 또는 구매자에게 가치를 제공하는 function을 나타낸다.
user_story는 다음 세 가지 중요 요소를 가지고 있으며, 이를 합쳐서 '3C'라고 부른다.
- Card - user_story를 설명하는 매체(예: 인덱스 Card, 전자 게시판 항목)
- Conversation - sw_사용 방법에 대한 설명(docs 또는 구두로)
- 확인(Confirmation) - 인수 condition(4.5.2 참조)

>user_story
가장 일반적인 형식은 "[role]로서 [objectives]를 달성해 [role이 얻게 될 business 가치]를 얻기를 원한다."이며, 이 후 인수 condition이 뒤따르는 형식이다.


>collaboration_based_user_story_작성
브레인스토밍, 마인드 매핑과 같은 technique을 사용한다.
cowork을 통해 team_member 들은 business, development, testing의 세 가지 관점을 고려해 만들어서 전달할 것에 대한 공유된 비전을 얻을 수 있다.

>좋은 user_story (INVEST)
독립적(Independent)이고
협상 가능(Negotiable)하고
가치 있고(Valuable)
추정 가능(Estimable)하고
작고(Small)
testing 가능(Testable)해야 한다.

stakeholder가 user_story 를 testing하는 방법을 모른다면, 그 user_story가 명확하지 않거나 user에게 중요한 내용이 반영 되어 있지 않거나, stakeholder가 testing를 수행하는 데 있어 도움이 필요하다는 것을 의미가능. 
_______________________________________________________________
>TODO.2 인수 condition
user_story의 인수 condition은 user_story 구현 result를 stakeholder가 Acknowledgement하기 위해 충족되어야 하는 condition이다.
이런 관점에서 인수 condition을 testing해야 하는 testing_condition으로 볼 수 있다.
인수 condition은 보 통 3C 중 Conversation를 통해 Decision된다(4.5.1 참조).
인수 condition은 다음을 위해 사용된다:
- user_story test_scope 정의
- stakeholder 간 Consensus 도출
- 긍정과 부정 시나리오 설명
- user_story acceptance_testing의 베이시스 제공(4.5.3 참조)
- 정확한 planning 및 추정

다양한 user_story의 인수 condition 작성법이 있으며, 가장 일반적인 두 가지는 다음과 같다:
- 시나리오 기반(예: BDD에서 사용하는 Given/When/Then 형식, 2.1.3 참조)
- 규칙 기반(예: verification이 필요한 목록 또는 표로 표현된 입력-출력 매핑)

대부분의 인수 condition은 이 두 가지 형식 중 하나로 docs화가능.
그러나 팀이 다른 자체 형식을 사 용하기로 할 수도 있으며, 이때도 인수 condition이 잘 정의되어 모호하지 않아야 한다.
_______________________________________________________________ 
>ATDD
testing 우선 approach이다
# tc는 user_story 구현 전에 만들어진다.

고객, developer, tester 등 서로 다른 관점을 가진 team_member들이 tc를 만든다(Adzic 2009).

tc는 수동 또는 자동으로 실행가능.

첫 번째 단계는 spec 워크숍으로 team_member들은 여기서 user_story와 (아직 정의되지 않은 case) 인수 condition을 analysis하고 토론해서 작성한다.
이 과정에서 user_story의 불완전성, 모호성, defect/fault을 해결하게 된다.
다


음 단계는 tc를 만드는 것이다.
이 function은 팀 전체가 수행하거나 tester가 개별적으로 수행 가능.
tc는 인수 condition을 기반으로 하며, SW가 어떻게 작동하는지에 대한 예제 로 볼 수 있다.
이는 팀이 user_story를 올바르게 구현하는 데 도움을 준다.

여기서 예제와 testing는 같은 의미를 가지기 때문에 혼용해서 사용하기도 한다.
test_design 시 4.2, 4.3, 4.4에서 설명한 testing_technique을 적용가능.

일반적으로 첫 번째 tc는 예외나 error condition 없이 올바른 동작을 확인하고 모든 것이 예상대 로 진행될 case 실행되는 일련의 activity으로 구성된 긍정/Valid tc이다.
Valid tc를 끝내고 나면 팀은 invalid/부정 testing를 수행해야 한다.
마지막으로, 팀은 non_function quality 특성들(예: 성능 효율성, 사용성)도 다루어야 한다.
tc는 stakeholder가 이해할 수 있는 방식으로 표현되어야 한다.
일반적으로 tc는 (있는 case) 필요한 전제 condition, 입력값, 사후 condition을 포함하며 자연어 문장으로 구성한다.

tc는 user_story의 모든 특성을 다뤄야 하며 스토리를 벗어나면 안 된다.
그러나 인수 condition이 user_story가 얘기하는 issue의 일부를 구체적으로 설명할 수도 있다.
또한, 두 개 이상의 tc가 user_story의 같은 특성을 설명해서는 안 된다.

testing_automation 프레임워크가 지원하는 형식으로 작성하면 developer는 user_story에서 설명하는 function을 구현 시, 필요한 coding해 tc를 automation가능.
그러면 acceptance_testing가 실행 가능 한 req이 된다.
_______________________________________________________________ 
>제 5 장 testing_activity management
_______________________________________________________________
>TODO.1 test_planning
- FL-5.1.1 (K2) test_planning서의 purpose과 내용을 ex> 설명가능. 
- FL-5.1.2 (K1) tester가 반복 주기와 release planning에 가치를 더하는 방법을 인식가능. 
- FL-5.1.3 (K2) 시작 condition과 완료 condition을 비교 및 대조가능. 
- FL-5.1.4 (K3) 필요한 testing 노력의 계산을 위해 추정 technique을 활용가능. 
- FL-5.1.5 (K3) tc에 우선순위를 적용가능. 
- FL-5.1.6 (K1) test_pyramid의 개념을 상기가능. 
- FL-5.1.7 (K2) testing 사분면과 그것이 testing_level 및 type과 갖는 관계를 요약가능. 
_______________________________________________________________
>TODO.2 risk_management
- FL-5.2.1 (K1) risk 발생 가능성과 risk 영향도를 활용해 risk level을 식별가능. 
- FL-5.2.2 (K2) project risk와 product risk를 구별가능. 
- FL-5.2.3 (K2) product risk analysis이 철저함과 testing test_scope에 미치는 영향에 대해 설명가능. 
- FL-5.2.4 (K2) analysis한 product risk에 대응해 어떤 조치를 취할 수 있는지 설명가능. 
_______________________________________________________________
>TODO.3 Test_monitoring, test_control, test_completion
- FL-5.3.1 (K1) testing에 사용하는 metrics을 상기가능. 
- FL- (K2) testing_report의 purpose, 내용, target을 요약가능. 
- FL-5.3.3 (K2) testing 상황을 전달하는 방법을 ex> 설명가능. 
_______________________________________________________________
>TODO.4 형상 management
- FL-5.4.1  (K2) 형상 management가 testing을 어떻게 지원하는지 요약가능. 
_______________________________________________________________
>TODO.5 defect/fault management
- FL-5.5.1  (K3) defect/fault report를 작성가능. 
_______________________________________________________________
>TODO.1.1 test_planning서의 purpose과 내용
test_planning서는 testing project의 testing_purpose, 자원, process를 설명한다.
test_planning서는:
- testing_purpose 달성을 위한 방법과 일정을 docs화한다.
- 수행한 testing_activity이 정해진 기준을 충족하는 데 도움을 준다.
- team_member과 기타 stakeholder의 의사소통 수단으로 사용된다.
- testing이 수립한 testing 정책 및 전략을 준수함을 보여준다(또는 testing이 그것을 준수하지 않
는 이유를 설명한다).

test_planning activity은 tester가 risk, 일정, 인력, tool, cost, 노력 등 향후 issue를 고민하도록 한다.
test_planning서를 준비하는 과정은 testing_purpose을 달성하는 데 필요한 노력을 추론하는 유용한 방법이다.
test_planning서는 보통 다음과 같은 내용을 포함한다:
- testing 정황(예: testing test_scope, testing_purpose, test_basis)
- testing project의 가정 및 제약 사항
- stakeholder(예: role, responsibility, testing 관련성, 채용 및 훈련 req)
- 의사소통(예: 의사소통 방법 및 빈도, docs 양식)
- risk 목록(예: product risk, project risk)
- testing approach(예: testing_level, test_type, testing_technique, testing work_product , 시작 condition 및 완료

condition, testing의 Independence, 수집할 metrics, testing_data req, testing_env req, testing 정책과 testing 전략과의 편차)
- 예산 및 일정

test_planning과 세부 내용에 대한 추가적인 info는 ISO/IEC/IEEE 29119-3 Standards에서 확인가능.
_______________________________________________________________
>TODO.1.2 반복 주기와 release planning에 대한 tester의 기여
일반적으로 반복적 SDLC에서 두 가지의 planning, 즉 release planning과 반복 주기 계 획이 이루어진다.

release planning은 product release를 planning하는 단계로 product backlog를 (재)정의하며, 큰 user_story를 작은 user_story들로 세분화하는 function을 포함가능.
또한, 개별 반복 주기의 testing approach과 test_planning을 위한 기반이 된다.
release planning에 참여하는 tester는 testing 가능한 user_story와 인수 condition 이 작성되도록 하고(4.5 참조), project 및 quality risk analysis에 참여하고(5.2 참조), user_story와 관련된 testing 노력을 추정하고(5.1.4 참조), testing approach을 Decision하고, release를 위한 testing을 planning한다.

반복 주기 planning은 개별 반복 주기를 planning하는 것으로 반복 주기 backlog와 관련이 있다.
반복 주기 planning


에 참여하는 tester는 user_story의 구체적인 risk analysis에 참여하고, user_story의 testing 용 이성을 판단하고, user_story를 업무(특히 testing 업무) 단위로 분류하고, 각 testing 업무에 필요한 testing 노력을 추정하고, test_object의 function 및 non_function적 측면을 식별하고 구체화한다.
_______________________________________________________________
>TODO.1.3 시작 condition과 완료 condition
시작 condition은 어떤 activity을 수행하기 위한 전제 condition을 정의한다.
시작 condition을 충족하지 못하면 해당 activity을 수행하는 것이 어려워져 들어가는 time과 cost이 늘어나고 원활하게 진행되지 않을 risk도 높아진 다.
완료 condition은 특정 activity의 종료를 선언하기 위해 달성해야 하는 사항들을 정의한다.
시작 condition과 완 료 condition은 각 testing_level에 대해 정의해야 하며 testing_purpose에 따라 달라진다.

많이 사용하는 시작 condition으로는 자원의 가용성(예: 인력, tool, env, testing_data, 예산, time), testing 웨어 가용성(예: test_basis, testing 가능한 req, user_story, tc), test_object 의 초기 quality level(예: 모든 스모크 testing가 합격함) 등이 있다.

일반적인 test_completion condition에는 다음이 포함된다: testing의 철저함(thoroughness)을 측정하는 지표(예:
달성한 coverage level, 미해결 defect/fault 수, defect/fault 밀도, 실패한 tc 수)와 “예/아니오”로 판단되는 기준(예: planning한 모든 testing가 실행되었는가, perform_static_testing():이 수행되었는가, 발견한 모든 defect/fault이 보고되 었는가, 모든 regression_testing가 automation되었는가).

time 및 예산의 소진도 Valid한 완료 condition으로 볼 수 있다.
이때 stakeholder들이 추가 testing 없이 release 하는 risk를 검토하고 수용했다면, 다른 완료 condition이 충족되지 않더라도 testing를 종료가능.

agile_sw_development_model에서 완료 condition을 완료의 정의(Definition of Done)라고 하는 case가 많으며, 릴리 스 가능 항목에 대한 팀의 objectives metrics을 정의하게 된다.
development 및 testing_activity을 시작하기 위해 user_story가 충족해야 하는 시작 condition을 준비의 정의(Definition of Ready)라고 한다.
_______________________________________________________________
>TODO.1.4 추정 technique
testing 노력 추정은 testing project의 testing_purpose을 달성하는 데 필요한 testing 관련 function량을 예측 하는 것이다.
추정치는 여러 가정을 기반으로 하며, 추정에는 항상 error가 있을 수 있다는 점을 stakeholder가 명확히 이해하도록 하는 것이 중요하다.
보통은 규모가 큰 function보다 작은 function에 대한 추정치가 정확하다.
따라서 큰 function에 대해 추정 시,는 우선 여러 개의 작은 function으로 나눈 다음 추정하게 된다.

이 syllabus는 다음 네 가지 추정 technique을 소개한다.

비율 기반 추정(Estimate(): based on ratios).
metrics 기반 technique으로 조직에서 수행한 이전 project 수 치를 수집해 유사 project를 위한 “Standards” 비율을 도출한다.
보통 조직에서 직접 수행한 project에서 수집한 비율(예: 과거 data에서 가져온)이 추정 과정에 사용하기 가장 좋은 자료이다.
이런 Standards 비율을 가지고 새로운 project에 필요한 testing 노력을 추정가능.
ex>, 이전 project에서 developmet


노력 대 testing 노력의 비율이 3:2였고, 현재 project에서 development 노력을 600MD로 예상한다면, testing 노력은 400MD로 추정가능.

외삽법(Extrapolation).
metrics 기반 technique으로 현재 project에서 data 수집을 위해 가능한 한 빨리 측정을 수행한다.
관찰 result가 충분히 쌓이면 이 data를 가지고 외삽법(보통 수학적 model 사용)을 적 용해 남은 function에 필요한 노력의 근사치를 추정가능.
이 방법은 반복적 SDLC (SDLC)에 매우 적합하다.
ex>, 팀이 지난 세 번의 반복 주기에 들인 평균 노력으로 다음 반복 주 기의 testing 노력을 추정가.

와이드밴드 델파이(Wideband Delphi).
반복적, 전문가 기반 technique으로 전문가의 경험을 기반으로 추정을 한다.
각 전문가는 독립적으로 노력을 추정한다.
result가 수집되고, 전문가의 추정값 중 Consensus된 test_scope를 벗 어난 편차가 있으면 전문가들이 각자의 현재 추정치에 대해 논의한다.
그런 다음 각 전문가에게 논의 result를 바탕으로 다시 한번 새로운 추정치를 제시하도록 한다.
Consensus에 도달 시,까지 이 과정을 반복한다.
플래닝 포커(Planning Poker)는 agile_sw_development_model에서 많이 사용하는 와이드밴드 델파이의 변형 이다.
플래닝 포커는 보통 노력의 규모를 나타내는 숫자가 적힌 Card를 사용해 추정한다.

3점 추정(Three-point estimate():).
전문가 기반 technique으로 전문가가 3의 추정치를 도출한다.
추정치 는 가장 낙관적인 추정치(a), 확률적으로 가장 높은 추정치(m), 가장 비관적인 추정치(b)이다.
최종 추정 치(E)는 이들의 가중 산술 평균이 된다.
가장 널리 사용하는 계산식은 E=(a+4*m+b)/6이다.
이 technique의 장점은 전문가가 측정 error를 계산가능. 는 것이다.
SD(Standards 편차, Standard deviation)=(b-a)/6이 된다.
ex, 추정치(MH)가 a=6, m=9, b=18인 case E=(6+4*9+18)/6=10이고, SD=(18-6)/6=2이므로 최종 추정치는 10±2(즉, 8과 12 사이의 맨아워)가 된다.

이런 technique과 기타 여러 testing 추정 technique에 관한 info는 Kan 2003, Koomen 2006, Westfall 2009를 참조 가능.
_______________________________________________________________
>TODO.1.5 tc 우선순위지정
tc와 test_procedure를 도출해서 testing 스위트로 조립하고 나면 testing 스위트를 testing 일정 으로 구성가능.
testing 일정은 test_execution 순서를 정의한다.
tc의 우선순위를 정 시, 다양한 요소를 고려가능.
많이 사용하는 tc 우선순위지정법은 다음과 같다:
- risk 기반 우선순위지정: risk analysis result에 따라 test_execution 순서를 Decision한다(5.2.3 참조).
가장 중요한 risk를 다루는 tc를 먼저 실행한다.
- coverage 기반 우선순위지정: test_execution 순서를 coverage(예: statement_coverage)에 따라 Decision한다.
가장 높은 coverage를 달성하는 tc를 먼저 실행한다. “추가 coverage 우선순위지정” 이라는 다른 변형에서는, 가장 높은 coverage를 달성하는 tc가 먼저 실행된다; 이후 에 실행되는 각각의 tc는 가장 높은 추가 coverage를 달성하는 것이다.

- req 기반 우선순위지정: test_execution 순서를 해당 tc의 기반이 되는 req
의 우선순위에 따라 Decision한다.
req의 우선순위는 stakeholder가 정의한다.
가장 중요한 요 구사항 관련 tc를 먼저 실행한다.

위에서 언급한 3가지 중 하나, 또는 여러 전략을 사용해 우선순위를 지정해서 tc 실행 순서 를 도출하는 것이 이상적이다.
그러나 tc 또는 test_object function이 종속성을 가진 case 그 렇게 하기 힘들 수 있다.
우선순위 높은 tc가 우선순위 낮은 tc에 종속되는 case, 우선순위가 낮은 tc를 먼저 실행해야 할 수도 있다.
test_execution 순서에서는 자원의 가용성도 고려해야 한다.
ex, 필요한 testing_tool, testing_env, 인력이 가용한 시기가 따로 있을 수 있다.
_______________________________________________________________
>TODO.1.6 test_pyramid
test_pyramid는 testing에 따라 세분화 level(granularity)이 다를 수 있다는 것을 보여주는 model이다.
test_pyramid model은 다양한 testing_objectives가 서로 다른 testing_automation level에 따라 지원된다는 것을 보여줌으로써 팀의 testing_automation와 testing 노력 할당을 지원한다.
피라미드의 각 층은 하나의 testing 그룹을 나타낸다.
층이 높아질수록 testing 세분화 정도는 낮아지고, testing 격리는 낮아지며(즉, sys 의 다른 요소에 대한 의존도), test_execution time은 길어진다.
아래층에 있는 testing는 규모가 작고, 독립 적이며, 빠르고, target이 되는 function이 작기 때문에 적절한 coverage를 달성하기 위해 많은 testing가 필요 한 case가 많다.
높은 층은 복잡하고 상위 level의 엔드-투-엔드 testing를 대변한다.
이런 상위 level testing는 일반적으로 하위층의 testing보다 실행 속도가 느리며, 보통 큰 규모의 function을 확인하기 때문에 적은 수로 적절한 coverage를 달성가능.
층의 수와 각 층의 명칭은 다를 수 있다.
ex, 최초 의 test_pyramid model(Cohn 2009)은 “unit_testing”, “서비스 testing”, “UI testing”라는 3의 층을 정 의했다.
단위(component) testing, integration(component integration) testing, 엔드-투-엔드 testing로 정의하는 model도 많 이 알려져 있다.
또한다른 testing_level 분류(섹션 2.2.1.
참조)를 사용하기도 한다.
_______________________________________________________________
>TODO.1.7 testing 사분면
브라이언 마릭(Brian Marick)(Marick 2003, Crispin 2008)이 정의한 testing 사분면은 agile_sw_develompent에서 testing_level을 적합한 test_type, activity, testing_technique, work_product 과 묶고 있다.
이 model은 이 런 사항들을 시각화해서 testing_admin가 필요한 모든 test_type과 testing_level을 SDLC에 포함하고, testing_level에 따라 test_type 별 연관성이 다르다는 점을 이해하는 데 도 움을 준다.
또한, 이 model은 developer, tester, business Assignee 등 모든 stakeholder에게 test_type을 구 분하고 설명하는 방법을 제공한다.

이 model에서 testing는 business 또는 기술에 대한 testing일 수 있다.
testing는 팀을 지원하거나(즉, devemopment을 위한 지침으로) product을 estimate():할 수도 있다(즉, 기대치 대비 동작 측정).
이 두 가지의 combination에 따라


네 개의 사분면이 Decision된다:
- 1 사분면(기술 측면, 팀 지원).
이 사분면은 unit_testing 및 integration_testing를 포함한다.
이런 testing는 automation해야 하며, CI process에 포함돼야 한다.
- 2 사분면(business 측면, 팀 지원).
이 사분면은 functional_testing, 예제, user_story testing, 사용 자 경험 프로토타입, api_testing, 시뮬레이션 등을 포함한다.
이런 testing는 인수 condition을 확인하 며, 수동으로 실행하거나 automation가능.
- 3 사분면(business 측면, product estimate():).
이 사분면은 exploratory_testing, 사용성 testing, user_acceptance_testing을 포함한다.
이런 testing는 user를 중심으로 이루어지며, 수동으로 실행하는 case가 많다.
 4 사분면(기술 측면, product estimate():).
이 사분면은 스모크 testing와 non_functional_testing(사용성 testing 제외)를 포함한다.
이런 testing는 automation되는 case가 많다.


조직은 objectives의 달성 여부와 시기를 불확실하게 만드는 여러 내부 및 외부 요인에 직면한다(ISO 31000).
risk_management는 조직이 objectives를 달성할 가능성과 product의 quality 을 높이고, stakeholder의 trust와 믿음을 얻 을 수 있게 한다.
주요 risk_management activity은 다음과 같다:
- risk analysis(risk 식별과 risk estimate():로 구성, 5.2.3 참조)
- risk 제어(risk 완화와 risk 모니터링으로 구성, 5.2.4 참조)

risk analysis과 risk 제어를 기반으로 testing_activity을 선택하고 우선순위를 정해 management하는 testing 접근 법을 risk 기반 testing이라고 한다.
_______________________________________________________________
>TODO.2.1 risk의 정의와 risk의 속성
risk는 발생 시 negative_effect을 미칠 수 있는 잠재적인 사건, risk, 위협 또는 상황을 말한다.
risk
는 두 가지 요소로 특징지을 수 있다:
- risk 발생 가능성 - risk 발생 확률(0 보다 크고 1 보다 작음)
- risk 영향(피해) – 발생했을 때 생기게 될 피해

이 두 가지 요소로 risk level을 표현한다.
risk level은 risk를 측정한 값이 된다.
risk level이 높을수록 그에 대한 조치 또한 중요해진다.
_______________________________________________________________
>TODO.2.2 project risk와 product risk
일반적으로 sw_testing에서 두 가지 type의 risk는 project risk나 product risk와 관련이 있다.

project risk는 PM 및 제어와 관련이 있다.
project risk에는 다음이 포함된다:
- 조직 issue(예: work_product 인도 지연, 부정확한 추정, 예산 축소)
- 인력 issue(예: 기술 부족, 갈등, 의사소통 issue, 직원 부족)
- 기술적 issue(예: 협의되지 않은 development test_scope의 점진적 추가, tool 지원 부족)
- 공급업체 issue(예: 제 3 자 인도 실패, 지원 기업의 파산)

project risk가 발생하면 project 일정, 예산, test_scope에 영향을 끼쳐 project의 objectives 달성 ability에 영향을 미칠 수 있다.

product risk는(예: ISO 25010 quality model이 설명하는) product quality 특성과 관련이 있다.
product risk의 예로 누락 또는 잘못된 function, 부정확한 계산, 런타임 error, 열악한 아키텍처, 비효율적인 알고리즘, 부적절한 응답 time, 열악한 UX(user 경험, user experience), security 취약점 등이 있다.
product risk가 발현되면 다 음과 같은 다양한 negative result를 초래가능. :
- user 불만족
- 매출, trust, 평판 손실
- 제 3 자 피해
- 높은 maintenance cost, 고객지원 부서의 과부하
- 형사 처벌
- 극단적인 case 신체적 손상, 부상 또는 사망
_______________________________________________________________
>TODO.2.3 product risk analysis
testing 관점에서 product risk analysis의 objectives는 product risk를 인식함으로써 잔존 product risk level을 최소 화하는 방향으로 testing 노력을 집중할 수 있도록 하는 것이다.
product risk analysis은 SDLC 초기에 시작하는 것이 이상적이다.

product risk analysis은 risk 식별과 risk estimate():로 이루어진다.
risk 식별은 포괄적인 risk 목록을 생성하는 것이다.
stakeholder는 브레인스토밍, 워크숍, 인터뷰, 원인-result diagram 등 다양한 technique과 tool를 사용해 risk를 식별가능.
risk estimate():는 식별한 risk를 분류하고, risk 발생 가능성/ 영향/level을 Decision하고, 우선순위를 정하고, 조치 방법을 제안하는 function을 포함한다.
같은 범주로 분류 된 risk는 유사한 approach으로 완화할 수 있는 case가 많기 때문에 완화 조치를 정하는 데 분류가 도 움이 된다.

risk estimate():는 정량적 또는 정성적 approach을 사용하거나, 이 두 가지를 혼합해 사용가능.
정량적


approach에서 risk level은 risk 발생 가능성과 risk 영향을 곱한 값으로 계산한다.
정성적 approach은 risk 행렬을 사용해 risk level을 판단하기도 한다.

product risk analysis은 testing의 철저함 정도와 testing test_scope에 영향을 미칠 수 있다.
analysis result는 다음과 같이 활용한다:
- 수행할 testing test_scope Decision
- testing_level Decision 및 수행할 test_type 제안
- 사용할 testing_technique과 달성할 coverage Decision
- 업무별 필요 testing 노력 추정
- 중요 defect/fault을 가능한 한 빨리 식별하기 위한 testing 우선순위지정
- risk를 줄이기 위해 testing 외 다른 activity을 할 수 있는지 판단
_______________________________________________________________
>TODO.2.4 product risk 제어
product risk 제어는 식별 및 estimate():된 product risk에 대응해 취하는 모든 조치를 말한다.
product risk 제 어는 risk 완화와 risk 모니터링으로 이루어진다.
risk 완화는 risk estimate(): 때 제안된 조치를 실 행해 risk level을 낮추는 activity을 말한다.
risk 모니터링의 purpose은 risk 완화 조치가 효과적인지 확인하고, 또 risk estimate(): 개선을 위해 추가로 필요한 info를 확보하고, 새롭게 나타난 risk를 식별하 는 것이다.

product risk 제어 측면에서 risk를 analysis하면 거기에 대응하기 위한다양한 완화 방안을 수립할 수 있 다.
ex> testing을 통한 risk 완화, risk 수용, risk 전가, 대안 planning 등이 이루어질 수 있다
(Veenendaal 2012).
testing으로 product risk 완화를 위해 취할 수 있는 조치는 다음과 같다:
- 주어진 risk type에 적절한 경험과 기술을 갖춘 tester 선정
- 적절한 level의 testing Independence 적용
- review 및 static_analysis 수행
- 적절한 testing_technique 및 coverage level 적용
- 영향을 받는 quality 특성을 다루는 적절한 test_type 적용
- regression_testing을 포함한 do_dynamic_testing(): 수행


Test_monitoring은 testing에 대한 info 수집과 관련이 있다.
이 info는 testing 진행 상황을 estimate():하고, product risk, req, AC에 대한 coverage objectives 달성과 같은 완료 condition이나 이 완료 condition과 관련된 testing function이 충족되었는지 측정하는 데 사용된다.


test_control에서는 Test_monitoring에서 얻은 info로 가장 효과적이고 효율적인 testing을 위한 제어 지침/ 지도/필요 수정 조치 등을 제공한다.
제어 지침의 예는 다음과 같다:
- 식별된 risk가 발현될 case testing 우선순위 재지정
- 재function 이후 testing_항목이 시작 condition 및 완료 condition을 충족하는지 재estimate():
- testing_env 인도 지연에 대응하기 위한 testing 일정 조정
- 필요한 지점과 시기에 신규 자원 추가

test_completion는, 끝난 testing_activity에서 data를 수집하여 경험, testware, 기타 관련 info를 수집하는 단계다.
test_completion activity은 어떤 project 마일스톤에 도달했을 때 이루어진다.
testing_level이나 애자 일 반복 주기의 끝, testing project를 완료(또는 취소)한 시점, SW를 release했거나 maintenance 릴리 스를 끝냈을 때 등이 여기에 해당한다.
_______________________________________________________________
>TODO.3.1 testing에 사용하는 metrics
testing metrics은 planning한 testing 일정 및 예산 대비 현재 진행 상황, test_object의 현재 quality , testing_purpose이나 반복 주기 objectives 대비 testing_activity의 효과를 보여주기 위해 수집한다.
Test_monitoring은 testing 제어 및 test_completion activity을 지원하는 다양한 metrics을 수집한다.
많이 사용하는 testing metrics은 다음과 같다:
- project 진행 상황 metrics(예: function 완료율, 자원 사용률, testing 노력 투입률)
- testing 진행 상황 metrics(예: tc 구현 진행률, testing_env 준비 진행률, 실행/미실행

및 합격/불합격 tc 수, test_execution time)
- product quality metrics(예: 가용성, 응답 time, 평균 failure/malfunction time)
- defect/fault metrics(예: 발견/수정한 defect/fault의 수와 우선순위, defect/fault 밀도, defect/fault 발견 비율)
- risk metrics(예: 잔여 risk level)
- coverage metrics(예: req coverage, code_coverage)
- cost metrics(예: testing cost, 조직의 quality cost)
_______________________________________________________________ testing_report의 purpose, 내용, target

testing 보고는 testing 도중과 이후에 testing info를 요약하고 전달하는 activity이다.
testing 진행 상황 report 는 지속적인 test_control를 지원하며, planning에서 벗어나거나 상황이 바뀌어 testing 일정, 자원, test_planning을 수정해야 할 case, 그것을 할 수 있는 충분한 info를 제공해야 한다.
test_completion_report는 특정 testing_activity (예: testing_level, testing 주기, 반복 주기)를 요약하고, 후속 testing을 위한 info를 제공가능.

Test_monitoring 및 제어 과정 중 sqa_team은 stakeholder에게 info를 제공하기 위해 testing 진행 상황 report를 작성한다.
일반적으로 testing 진행 상황 report는 정기적으로(예: 매일, 매주, 또는 기타 주기)


작성하며 다음을 포함한다:
- testing 기간
- testing 진행 상황(예: 예info다 빠르다 또는 늦어지고 있다), 주목할 만한 편차 포함
- testing 진행 방해 요소와 대응 방법
- testing metrics(예시는 5.3.1 참조)
- testing 중 식별한 신규 및 변경된 risk
- 다음 주기에 예정된 testing

test_completion_report는 project, testing_level, test_type이 끝나고, 이상적으로는 완료 condition도 충족된 상황에서 이루어지는 test_completion activity 중 작성한다.
이 report는 testing 진행 상황 report와 기타 데 이터를 기반으로 작성한다.
일반적인 test_completion_report는 다음을 포함한다:
- testing 요약
- 원래 test_planning(즉, testing_purpose과 완료 condition)에 기반한 testing 및 product estimate_quality():
- test_planning과의 편차(예: planning한 testing 일정, 기간, 공수와의 diff)
- testing 방해 요소와 대응 방법
- testing 진행 상황 report를 기반으로 한 testing metrics
- 완화되지 않은 risk, 수정되지 않은 defect/fault
- testing 관련 교훈

보고하는 target에 따라 report에 들어갈 정도가 달라지고, 보고의 형식과 빈도도 달라진다.
같은 팀 구성 원에게 testing 진행 상황을 보고 시,는 빈번하고 informal적인 case가 많지만, test_completion 보고는 정 해진 템플릿을 따르며 한 번만 이뤄지는 것이 일반적이다.

ISO/IEC/IEEE 29119-3 Standards은 testing 진행 상황 report(testing 상황 report라고 함)와 test_completion 보고 서의 양식과 예제를 포함하고 있다.
_______________________________________________________________
>TODO.3.3 testing 상황 전달
testing 상황을 전달하는 가장 좋은 의사소통 방법은 testing_admin의 관심, 조직의 testing 전략, 규제 Standards, 또 자체 조직 팀(self-organizing team)일 case 팀 자체에 따라서도 달라진다(1.5.2 참조).
여기에는 다음과 같은 방법이 있다:
- team_member 및 기타 stakeholder와의 Conversation
- 대시보드(예: ‘CI’/’지속적 전달’ 대시보드, 태스크 보드, 번다운 차트)
- 전자 통신 채널(예: 이메일, 채팅)
- 온라인 docs
- 공식 testing_report(참조)


이런 선택지 중 하나 이상을 사용가능.
물리적 거리나 시차로 인해 직접적인 Conversation가 어려운 분산된 팀은 더욱 formal 의사소통 방법을 사용하는 것이 적합가능.
보통 stakeholder마다 관심을 가지는 info가 다르므로, 그에 따라 의사소통 방식을 조정할 필요가 있다.


testing에서 형상 management(CM, Configuration Management)는 test_planning서, testing 전략서, testing_condition, tc, testing_script, testing resul_, testing 로그, testing_report와 같은 work_product 을 형상 항목으로 식별, 제어, 추적하는 지침을 제공한다.
복잡한 형상 항목(예: testing_env)의 case 형상 management는 구성 항목, 항목 간 관계, 버전 등을 기록한다.
형상 항목이 testing용으로 Acknowledgement되면 베이스라인이 되며, formal 변경 제어 process를 통해서만 수정 가능.
형상 management는 새 베이스라인을 만들 때 변경된 형상 항목에 대한 기록을 유지한다.
이전 베이스라인으로 되돌리면 이전 testing_result를 재현할 수 있게 된다.
testing을 적절히 지원하기 위해 형상 management는 다음을 보장한다:
- testing_항목(test_object의 개별 부분)을 포함한 모든 형상 항목에는 고유한 식별자가 부여되고,
버transition management되며, 변경사항이 있는지 추적되고, 다른 형상 항목과 가지는 연관성이 식별돼 test_process 전체에서 추적성이 유지된다.
- 식별된 모든 docs와 sw_항목은 testware 내에서 명확하게 참조되어야 한다.

CI, 지속적 전달, CD, 그리고 관련된 testing은 일반적으로 automation된 DevOps 파이프 라인으로 구현하며(2.1.4 참조), 여기에 보통 automation된 형상 management가 포함돼 있다.


testing의 주요 purpose 중 하나가 defect/fault 식별이므로 잘 확립된 defect/fault management process가 필요하다.
여기서 ‘defect/fault’ 이라고 부르고 있지만, 보고된 anomaly은 실제로 defect/fault일 수도, 아닐 수도 있다(예: 거짓-양성 result, 변경 요청).
이 issue는 defect/fault report를 처리하는 과정에서 해결된다.
anomaly(anomalies)는 SDLC 모든 단계에서 보고될 수 있으며, 그 양식은 SDLC에 따라 달라진다.
최소한, defect/fault management process에는 개별 defect/fault이나 anomaly을 발견부터 종료까지 처리하는 function 흐름 (workflow)과 분류 기준에 대한 규칙이 포함되어야 한다.
이 function 흐름은 보통, 보고된 anomaly을 기록 하고, analysis 및 분류하고, 수정하거나 유지하기로 하는 등의 적절한 대응책을 Decision하고, 끝으로 defect/fault 보고 를 종료하는 activity으로 구성된다.
이 process는 관련된 모든 stakeholder가 따라야 한다.
perform_static_testing()(특


히, static_analysis)에서 식별한 defect/fault도 비슷한 방식으로 처리하는 것이 좋다.

일반적인 defect/fault report는 다음과 같은 purpose을 가진다:
- defect/fault을 처리 및 해결하는 responsibility을 진 사람에게 issue 해결을 위한 충분한 info 제공
- function result물의 quality 을 추적할 수 있는 수단 제공
- development 및 test_process_improving을 위한 idea 제공

일반적으로 do_dynamic_testing(): 중에 작성하는 defect/fault report는 다음을 포함한다:
- 고유 식별자
- 보고하는 anomaly을 요약하는 제목
- anomaly이 관찰된 날짜, 보고 주체 조직, 작성자(role 포함)
- test_object 및 testing_env 식별 info
- defect/fault의 정황(예: 실행 중인 tc, 수행 중인 testing_activity, SDLC 단

계, 또 사용 중인 testing_technique/checklist/testing_data와 같은 기타 관련 info)
- anomaly을 발견한 절차, 관련 testing 로그, db 덤프, 스크린샷, 또는 녹음 파일 등 장

애의 재현 및 해결에 필요한 info
- expected_result와 actual_result
- defect/fault이 stakeholder의 이익 또는 req에 끼치는 영향의 심각도
- 수정 우선순위
- defect/fault state(예: 신규, 연기, 중복, 수정 대기, confirmation_testing 대기, 재-오픈, 완료, 거부)
- 참조 사항(예: 관련 tc)

이런 data 중 일부는 defect/fault management tool를 사용하면 자동으로 포함된다(예: 식별자, 날짜, 작성자, 초기 state 등).
defect/fault report의 양식과 예시는 ISO/IEC/IEEE 29113-3 Standards에서 찾을 수 있다.
해당 Standards은 defect/fault report를 인시던트 report로 지칭하고 있다.
_______________________________________________________________ 
>제 6 장 testing_tool

_______________________________________________________________
>>>>> TODO >>>>> 6.1 testing_지원_tool
- FL-6.1.1 (K2) 다양한 type의 testing_tool가 어떻게 testing을 지원하는지 설명가능. 
_______________________________________________________________
>>>>> TODO >>>>> 6.2 testing_automation의 효과와 risk
- FL-6.2.1 (K1) testing_automation의 효과와 risk를 상기가능. 


testing_tool는 다양한 testing_activity을 지원하고 촉진한다.
다음은 몇 가지 예이다:
- manage_testing(): tool - SDLC, req, testing, defect/fault, 형상 management를 용이하
게 해서 test_process 효율성을 높인다.
- perform_static_testing():_tool - tester의 review와 static_analysis 수행을 지원한다.
- test_design 및 test_implementation tool - tc, testing_data, test_procedure 생성을 용이하
게 한다.
- test_execution 및 testing_coverage tool – 자동 test_execution 및 coverage 측정을 지원한다.
- non_functional_testing_tool - 수동으로 실행하기 어렵거나 불가능한 non_functional_testing를 tester가 수행할
수 있게 한다.
- DevOps tool - devops_release_pipeline, function 흐름 추적, 자동 build process, CI
및 release 등을 지원한다.
- cowork tool - 원활한 커뮤니케이션을 지원한다.
- 확장성 및 release Standards화 지원 tool(예: 가상_머신, 컨테이너화 tool)
- testing에 도움이 되는 기타 tool(예: testing에 활용하면 스프레드시트도 testing_tool가 된다)


tool를 도입한다고 성공이 보장되는 것은 아니다.
실질적이고 지속적인 효과를 얻기 위해서는 새로운 tool를 도입 시,마다 노력을 들여야 한다(예: tool의 도입, maintenance, education 등을 위해).
또한, analysis과 완 화가 필요한 risk도 있다.

testing_automation가 가져올 수 있는 효과는 다음과 같다:
- 반복적 수function(예: regression_test_execution, 같은 testing_data의 반복 입력, 예상 result와 실제
result의 비교, 코딩 Standards 확인)을 줄여 time 절약
- 일관성 및 재현성 향상으로 사람의 단순 mistake 방지(예: req에서 testing를 일관되게 도출,
testing_data의 체계적 생성, testing를 tool가 같은 주기 및 동일한 순서로 실행)
- 보다 객관적인 estimate()(예: coverage), 그리고 사람이 판단하기 어려운 복잡한 metrics의 제공
- manage_testing(): 및 testing 보고를 지원하기 위한 testing info에 더 쉽게 접근 가능 (예: testing 진

행률, 실패율, test_execution 기간에 대한 통계, 그래프, 집계 data)
- defect/fault 조기 식별, 빠른 feedback, 출시 time 단축을 가능하게 하는 test_execution time 단축
- tester가 새로운, 그리고 더 심층적이며 효과적인 testing를 design할 time 확보
- tool의 효과(function 및 사용 편의성 포함)에 대한 비현실적인 기대

- tool 도입, testing_script 유지 management, 기존 수동 test_process 변경에 필요한 time, cost,
노력에 대한 부정확한 추정
- manual_testing이 더 적합한 곳에 testing_tool 사용
- tool에 지나치게 의존(예: 사람의 비판적 사고의 필요성 무시)
- 폐업, tool 지원 중단, 다른 공급업체로 tool 매각, 열악한 지원(예: 문의, 업그레이드, defect/fault 수정에

대한 대응관련) 등의 issue가 생길 수 있는 tool 공급업체에 대한 종속성
- 지원이 중단되거나(즉, 더는 업데이트되지 않거나), 추가 development을 통해 내부 component를 빈번하게

업데이트해야 할 필요가 있을 수 있는 오픈소스 SW의 사용
- automation tool가 development 플랫폼과 호환되지 않을 수 있음
- 규제 요건이나 safty Standards을 준수하지 않는 부적합한 tool의 선택
_______________________________________________________________ 
>제 7 장 References
sw_engineering
sys_engineering

ISO/IEC/IEEE 29119-1 (2022) sw_and syss engineering – sw_testing – Part 1: General Concepts
ISO/IEC/IEEE 29119-2 (2021) sw_and syss engineering – sw_testing – Part 2: Test_processes
ISO/IEC/IEEE 29119-3 (2021) sw_and syss engineering – sw_testing – Part 3: Test documentation
ISO/IEC/IEEE 29119-4 (2021) sw_and syss engineering – sw_testing – Part 4: Test techniques
ISO/IEC 25010, (2023-11) syss and sw_engineering – syss and SQ Requirements and Evaluation (SQuaRE) 
ISO/IEC 20246 (2017) sw_and syss engineering – Work product reviews
ISO/IEC/IEEE 14764:2022 – sw_engineering – sw_life cycle processes – Maintenance
ISO 31000 (2018) Risk management – Principles and guidelines
_______________________________________________________________ Knowledge
_______________________________________________________________ 지식
The following LOs are defined as applying to this syllabus.
다음 LO는 이 syllabus에 적용되도록 정의되어 있다.
Each topic in the syllabus will be examined according to the LO for it.
syllabus의 각 주제는 해당 LO에 따라 평가된다.
The LOs begin with an action verb corresponding to its cognitive level of knowledge as listed below.
LO는 아래에 나열된 지식의 인지 수준에 해당하는 행동 동사로 시작한다.

Level 1: Remember (K1) – the candidate will remember, recognize and recall a term or concept.
수준 1: 기억(K1) – 응시자는 용어나 개념을 기억하고, 알아보고, 회상가능.
Action verbs: identify, recall, remember, recognize.
행동 동사: 식별하다, 회상하다, 기억하다, 알아보다.
Examples:
예시:
- “Identify typical test_objectives .”
 “일반적인 test_목적을 식별하라.”
- “Recall the concepts of the test_pyramid.”
 “test_pyramid의 개념을 회상하라.”
- “Recognize how a tester adds value to iteration and release planning”
 “tester가 이터레이션 및 릴리스 planning에 어떻게 가치를 더하는지 알아보라.”

Level 2: Understand (K2) – the candidate can select the reasons or explanations for statements related to the topic, and can summarize, compare, classify and give examples for the testing concept.
수준 2: 이해(K2) – 응시자는 주제와 관련된 설명이나 진술의 근거를 선택하고, test 개념을 요약·비교·분류하거나 예를 들 수 있다.
Action verbs: classify, compare, contrast, differentiate, distinguish, exemplify, explain, give examples, interpret, summarize.
행동 동사: 분류하다, 비교하다, 대조하다, diff를 구분하다, 구별하다, 예를 들다, 설명하다, 사례를 제시하다, 해석하다, 요약하다.
Examples:
예시:
- “Classify the different options for writing AC.”
 “AC을 작성하는 여러 방법을 분류하라.”
- “Compare the different roles in testing” (look for similarities, differences or both).
 “test에서 서로 다른 role을 비교하라”(공통점, diff점 또는 둘 다를 살펴본다).
- “Distinguish between project risks and product risks” (allows concepts to be differentiated).
 “project_risk와 product_risk를 구별하라”(개념 간 diff를 구partition 수 있어야 한다).
- “Exemplify the purpose and content of a test plan.”
 “test planning의 목적과 내용을 예를 들어 설명하라.”
- “Explain the impact of context on the test_process.”
 “상황이 test_process에 미치는 영향을 설명하라.”
- “Summarize the activities of the review_process():.”
 “review process의 활동을 요약하라.”

Level 3: Apply (K3) – the candidate can carry out a procedure when confronted with a familiar function, or select the correct procedure and apply it to a given context.
수준 3: 적용(K3) – 응시자는 익숙한 상황에서 절차를 수행하거나, 주어진 상황에 맞는 절차를 선택해 적용가능.
Action verbs: apply, implement, prepare, use.
행동 동사: 적용하다, 구현하다, 준비하다, 사용하다.
Examples:
예시:
- “Apply tc prioritization” (should refer to a procedure, technique, process, algorithm etc.).
 “test_case 우선순위를 적용하라”(절차, 방식, process, 알고리즘 등을 가리켜야 한다).
- “Prepare a defect report.”
 “defect/fault_report를 작성하라.”
- “Use boundary value analysis to derive tcs.”
 “boundary_value_analysis을 사용해 test_case를 도출하라.”

References for the cognitive levels of LOs:
LO의 인지 수준에 대한 참고문헌:
Anderson, L. W.
and Krathwohl, D. R. (eds) (2001) A Taxonomy for Learning, Teaching, and Assessing: A
Revision of Bloom's Taxonomy of Educational objectives, Allyn & Bacon


다음 LO는 이 syllabus에 적용되도록 정의되어 있다.
syllabus의 각 주제는 해당 LO에 따라 평가된다.
LO는 아래에 나열된 지식의 인지 수준에 해당하는 행동 동사로 시작한다.

수준 1: 기억(K1) – 응시자는 용어나 개념을 기억하고, 알아보고, 회상가능.
예시:
- “일반적인 test_목적을 식별하라.”
- “test_pyramid의 개념을 회상하라.”
- “tester가 이터레이션 및 릴리스 planning에 어떻게 가치를 더하는지 알아보라.”

수준 2: 이해(K2) – 응시자는 주제와 관련된 설명이나 진술의 근거를 선택하고, test 개념을 요약·비교·분류하거나 예를 들 수 있다.
행동 동사: 분류하다, 비교하다, 대조하다, diff를 구분하다, 구별하다, 예를 들다, 설명하다, 사례를 제시하다, 해석하다, 요약하다.
예시:
- “AC을 작성하는 여러 방법을 분류하라.”
- “test에서 서로 다른 role을 비교하라”(공통점, diff점 또는 둘 다를 살펴본다).
- “project_risk와 product_risk를 구별하라”(개념 간 diff를 구partition 수 있어야 한다).
- “test planning의 목적과 내용을 예를 들어 설명하라.”
- “상황이 test_process에 미치는 영향을 설명하라.”
- “review process의 활동을 요약하라.”

수준 3: 적용(K3) – 응시자는 익숙한 상황에서 절차를 수행하거나, 주어진 상황에 맞는 절차를 선택해 적용가능.
행동 동사: 적용하다, 구현하다, 준비하다, 사용하다.
예시:
- “test_case 우선순위를 정하라”(절차, 방식, process, 알고리즘 등을 가리켜야 한다).
- “defect/fault_report를 작성하라.”
- “boundary_value_analysis을 사용해 test_case를 도출하라.”

LO의 인지 수준에 대한 참고문헌:
Anderson, L. W.
and Krathwohl, D. R. (eds) (2001) A Taxonomy for Learning, Teaching, and Assessing: A
Revision of Bloom's Taxonomy of Educational objectives, Allyn & Bacon
_______________________________________________________________ etc
> def perform_test_execution():


>security 
security 는 필수이다.
security 도 자동화가 필수인 시대가 올것 같다.


>Status
process의 진행state
ex
jira sw_defect/fault 티켓의 진행 단계
HTTP 응답 코드(200 OK, 404 Not Found)
법적 지위나 자격을 말할 때도 관습적으로 Status를 씁니다. (예: 회원 등급 VIP, 결혼 여부 Single/Married, 계정 활성 여부 Active/Inactive).


>state 
process의 진행state가 아니고 법적지위관습, 자격관습이 아니라면 거의 대부분이 state 이다.
object가 현재 처해 있는 구체적인 조건과 데이터의 set
React/프론트엔드에서의 컴포넌트 state(isLoggedIn = true, cartItems = [..]), network 연결 state(Connected, Disconnected), 자동차 변속기 기어 state(P, R, N, D).


>purpose & objective
purpose: why
goal: 
objective: 
_______________________________________________________________
[file_contents_replacer]
[collaboration_based user_story 작성][collaboration_based_user_story_작성]
[collaboration_based_user_story_작성][collaboration_based_user_story_작성]
[협업 기반 테스트 접근법][collaboration_based_test_approach]
[경험 기반 테스트 방식][experience_based_test_technique]
[인수 테스트 주도 개발][acceptance_test_driven_development]
[Acceptance Test-driven Development][acceptance_test_driven_development]
[acceptance_test_driven_development][ATDD]
[regression test_execution][regression_test_execution]
[regression_test_execution][regression_test_execution]
[Agile Technical Tester][agile_technical_tester]
[agile_technical_tester][agile_technical_tester]
[checklist 기반 testing][checklist_기반_testing]
[checklist_기반_testing][checklist_기반_testing]
[구문_testing coverage][구문_testing_coverage]
[구문_testing_coverage][구문_testing_coverage]
[SW Test Procedure][sw_test_procedure]
[sw_test_procedure][sw_test_procedure]
[상위 testing_level][상위_testing_level]
[상위_testing_level][상위_testing_level]
[구조 기반 technique][구조_기반_technique]
[구조_기반_technique][구조_기반_technique]
[testing 지원 도구][testing_지원_도구]
[testing_지원_도구][testing_지원_도구]
[세션 기반 testing][세션_기반_testing]
[세션_기반_testing][세션_기반_testing]
[SW Test Plan][sw_test_plan]
[sw_test_plan][sw_test_plan]
[체크리스트 기반 테스트][checklist_based_testing]
[화이트박스 테스트 방식][white_box_testing_technique]
[블랙박스 테스트 방식][black_box_testing_technique]
[시프트 레프트 테스트][shift_left_testing]
[결정 테이블 테스트][decision_table_testing]
[리스크 기반 테스트][risk_based_testing]
[시스템 통합 테스트][sys_integration_testing]
[테스트 완료 보고서][test_completion_report]
[테스트 진행 보고서][test_progress_report]
[동적 테스트 수행][do_dynamic_testing]
[상태 전이 테스트][state_transition_testing]
[세션 기반 접근법][세션_기반_접근법]
[세션_기반_접근법][세션_기반_접근법]
[정적 테스트 수행][perform_static_testing]
[acceptance_criteria][AC]
[Exploratory Testing][exploratory_testing]
[exploratory_testing][exploratory_testing]
[learning objective][LO]
[testing automation][testing_automation]
[testing_automation][testing_automation]
[condition branch][condition_branch]
[condition_branch][condition_branch]
[Technical Review][technical_review]
[technical_review][technical_review]
[testing coverage][testing_coverage]
[testing_coverage][testing_coverage]
[risk management][risk_management]
[risk_management][risk_management]
[sys engineering][sys_engineering]
[sys_engineering][sys_engineering]
[testing charter][testing_charter]
[testing_charter][testing_charter]
[testing purpose][testing_purpose]
[testing_purpose][testing_purpose]
[Error Guessing][error_guessing]
[error_guessing][error_guessing]
[testing report][testing_report]
[testing_report][testing_report]
[code coverage][code_coverage]
[code_coverage][code_coverage]
[product_owner][PO]
[testing role][testing_role]
[testing_role][testing_role]
[API testing][api_testing]
[api_testing][api_testing]
[learning 목표][learning objective]
[구문 coverage][구문_coverage]
[구문_coverage][구문_coverage]
[분기 coverage][분기_coverage]
[분기_coverage][분기_coverage]
[탐색적 testing][탐색적_testing]
[탐색적_testing][exploratory_testing]
[테스트 process][테스트_process]
[테스트_process][테스트_process]
[Test Basis][test_basis]
[test_basis][test_basis]
[testing 항목][testing_항목]
[testing_항목][testing_항목]
[구문_testing][statement_testing]
[분기 testing][분기_testing]
[분기_testing][branch_testing]
[비공식 review][informal review]
[Test Case][test_case]
[test_case][test_case]
[test 베이시스][test_basis]
[공식 review][formal review]
[기대 result][expected_result]
[실제 result][actual_result]
[화이트박스 테스트][white_box_testing]
[결함/장애 관리][defect/fault_management]
[리스크 모니터링][risk_monitoring]
[블랙박스 테스트][black_box_testing]
[유지보수 테스트][maintenance_testing]
[테스트 모니터링][test_monitoring]
[테스트 베이시스][test_basis]
[테스트 피라미드][테스트_피라미드]
[테스트_피라미드][test_pyramid]
[프로젝트 리스크][project_risk]
[code 구문][code_구문]
[code_구문][code_구문]
[구문 커버리지][statement_coverage]
[분기 커버리지][branch_coverage]
[비기능 테스트][non_functional_testing]
[슈도 code][pseudocode]
[시스템 테스트][sys_testing]
[커버리지 항목][coverage_item]
[탐색적 테스트][exploratory_testing]
[테스트 사분면][testing_quadrants]
[테스트 자동화][테스트_자동화]
[테스트_자동화][테스트_자동화]
[테스트 접근법][test_approach]
[테스트 케이스][test_case]
[결함 보고서][defect/fault_report]
[경계값 분석][boundary_value_analysis]
[기능 테스트][functional_testing]
[단위 테스트][unit_testing]
[리스크 관리][risk_management]
[리스크 분석][risk_analysis]
[리스크 수준][risk_level]
[리스크 식별][risk_identification]
[리스크 완화][risk_mitigation]
[리스크 추정][risk_estimate]
[리스크 통제][risk_control]
[리스크 평가][risk_assessment]
[비정형 리뷰][informal_review]
[영향도 분석][impact_analysis]
[인수 테스트][acceptance_testing]
[제품 리스크][product_risk]
[테스트 계획][test_planning]
[테스트 대상][test_object]
[테스트 도구][테스트_도구]
[테스트_도구][테스트_도구]
[테스트 레벨][testing_level]
[테스트 목적][테스트_목적]
[테스트_목적][테스트_목적]
[테스트 방식][testing_technique]
[테스트 유형][test_type]
[테스트 전략][test_strategy]
[테스트 통제][test_control]
[통합 테스트][integration_testing]
[확인 테스트][confirmation_testing]
[회귀 테스트][regression_testing]
[가상 머신][가상_머신]
[가상_머신][가상_머신]
[기술 리뷰][technical_review]
[기술_리뷰][technical_review]
[동등 분할][equivalence_partitioning]
[드라이 런][드라이_런]
[드라이_런][드라이_런]
[시작 조건][entry_criteria]
[오류 추정][error_guessing]
[완료 조건][exit_criteria]
[이상 사항][anomaly]
[인수 조건][acceptance_criteria]
[정적 분석][static_analysis]
[정형 리뷰][formal_review]
[측정 치][측정치]
[devemopment자][developer]
[Shift-Left][shift_left]
[애플리케이션][APP]
[이해관계자][stakeholder]
[화이트박스][white_box]
[기술부채][technical_debt]
[네트워크][network]
[실러버스][syllabus]
[엔지니어][engineer]
[워크스루][walkthrough]
[인스펙션][inspection]
[프로세스][process]
[디버깅][debugging]
[백로그][backlog]
[자격증][certificate]
[측정치][metrics]
[컨디션][condition]
[테스터][tester]
[테스트][test]
[테스팅][testing]
[객체][object]
[결함][sw_defect/fault]
[구문][statement]
[기법][방식]
[대화][Conversation]
[도구][tool]
[리뷰][review]
[분기][branch]
[승인][Acknowledgement]
[오류][Error]
[이슈][issue]
[장애][failure/malfunction]
[차터][charter]
[카드][Card]
[$REG$($REG$)][$REG$]
# 약어 비약어 중에는 약어사용이 우선하여야한다
# 영어 비영어 중에는 영어사용이 우선하여야한다
# 한글영어혼합 에는 영어사용이 우선하여야한다
_______________________________________________________________
