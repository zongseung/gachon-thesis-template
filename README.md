# 가천대학교 일반대학원 학위논문 LaTeX 템플릿

가천대학교 일반대학원(이공·자연계열) 석·박사 학위논문 작성을 위한 **LaTeX 템플릿 모음**입니다. 공식 작성지침(국문·영문)을 그대로 이식하여, B5 규격·여백·글꼴·제본 순서를 지침대로 만족하면서 LaTeX의 자동화(목차/표목차/그림목차/참고문헌/상호참조) 장점을 누릴 수 있습니다.

> **대상**: 가천대학교 일반대학원 이공·자연계열 석·박사 과정
> **엔진**: XeLaTeX (국문·영문 모두 동일)
> **권장 환경**: Overleaf (무설치) 또는 로컬 TeX Live 2022+

---

## 📂 폴더 구조

```
양식/
├── README.md                              ← (이 문서) 전체 진입점
│
├── (국문)학위논문 작성지침.pdf            ← 공식 지침 원본 (국문)
├── (국문)학위논문 템플릿(이공계열).hwp    ← 공식 HWP 템플릿 (국문)
├── Thesis_Dissertation_Guidelines_English.pdf  ← 공식 지침 원본 (영문)
│
├── LaTeX_템플릿_기획서.md                 ← 국문판 구현 기획서
├── LaTeX_Template_Plan_EN.md              ← 영문판 구현 기획서
│
├── thesis-gachon-kr/                      ← 국문 논문용 LaTeX 템플릿
│   ├── README.md                          ← 국문판 상세 사용법
│   ├── main.tex                           ← 루트 문서
│   ├── gachon-thesis.cls                  ← 국문판 문서 클래스
│   ├── latexmkrc
│   ├── config/
│   │   ├── metadata.tex                   ← 메타데이터 (여기만 수정)
│   │   └── fonts.tex                      ← 폰트 설정 (함초롬바탕 옵션)
│   ├── frontmatter/                       ← 표지·제출서·인준서·국문초록
│   ├── chapters/                          ← 본문 5개 장
│   ├── backmatter/                        ← 참고문헌·부록·영문초록
│   └── fonts/                             ← (옵션) 사용자 폰트 배치용
│
└── thesis-gachon-en/                      ← 영문 논문용 LaTeX 템플릿
    ├── README.md                          ← 영문판 상세 사용법
    ├── main.tex
    ├── gachon-thesis-en.cls               ← 영문판 문서 클래스
    ├── latexmkrc
    ├── config/
    │   ├── metadata.tex                   ← 메타데이터 (여기만 수정)
    │   └── fonts.tex                      ← Times New Roman 설정
    ├── frontmatter/                       ← 표지·제출서·인준서·영문초록
    ├── chapters/                          ← 본문 5개 장
    ├── backmatter/                        ← 참고문헌·부록·국문초록
    └── fonts/
```

---

## 🧭 어느 템플릿을 써야 하나요?

| 상황 | 선택 |
|---|---|
| 한국어로 학위논문을 작성 | **`thesis-gachon-kr/`** |
| 영어로 학위논문을 작성 (지도교수 승인 필요) | **`thesis-gachon-en/`** |
| 둘 다 써야 하는 경우 (ex. 국문 제출 후 영문 재제출) | 두 폴더를 독립적으로 관리 |

> **중요**: 작성지침 제1조에 따라 **학위청구 논문은 한국어 작성이 원칙**이며, 영문 작성은 **지도교수의 승인**이 있을 때에만 가능합니다. 영문으로 진행하기 전 반드시 지도교수와 협의하세요.

---

## 🔍 국문판 vs 영문판 주요 차이

두 템플릿은 같은 구조(클래스 + metadata + frontmatter/chapters/backmatter)를 공유하지만, 공식 지침의 차이로 인해 다음 항목이 서로 다릅니다.

| 항목 | 국문판 (`thesis-gachon-kr`) | 영문판 (`thesis-gachon-en`) |
|---|---|---|
| 용지 | B5 (190 × 260 mm) | B5 (190 × 260 mm) |
| **여백 (위/아래)** | **20 mm / 15 mm** | **30 mm / 30 mm** |
| 여백 (좌/우) | 25 mm / 25 mm | 25 mm / 25 mm |
| **주 글꼴** | **휴먼명조·신명조·명조 계열** | **Times New Roman** |
| **줄간격** | **180 ~ 200 %** (`\setstretch{1.9}`) | **1.5 또는 2.0** (`\setstretch{1.5}`) |
| 문단 들여쓰기 | 2 칸 | 2 chars |
| 큰제목 / 중간제목 / 소제목 | 16 / 14 / 12 pt | 16 / 14 / 12 pt |
| 본문 / 각주 | 11 / 9 pt | 11 / 9 pt |
| **본문 장 헤더** | **"제1장 서 론"** | **"1. Introduction"** |
| **목차 장 헤더** | **"제1장 서 론"** | **"CHAPTER 1. Introduction"** |
| **번호 체계** | 1.1 → 1.1.1 → (1) → ① (5단) | 1. → 1.1 → 1.1.1 (3단) |
| **초록 위치 (제본)** | 국문초록 → 본문 → 영문초록 | **영문초록 → 본문 → 국문초록** |
| 커버 하단 블록 순서 | 대학원 → 학과 → 전공 → 성명 | **성명 → 전공 → 학과 → 대학원** |
| 인준서 본문 크기 | 18 pt | **16 pt** |
| 심사위원 (석사/박사) | 3 인 / 5 인 | 3 인 / 5 인 |
| 클래스 이름 | `gachon-thesis.cls` | `gachon-thesis-en.cls` |

---

## 🚀 빠른 시작

### 옵션 1) Overleaf (권장, 무설치)

1. 사용할 템플릿 폴더(`thesis-gachon-kr/` 또는 `thesis-gachon-en/`) 전체를 zip으로 압축
2. Overleaf → **New Project → Upload Project** 로 업로드
3. **Menu → Settings → Compiler** 를 **`XeLaTeX`** 로 변경 (⚠️ 필수)
4. **Menu → Settings → Main document** 를 `main.tex` 로 지정
5. **Recompile** 클릭 → PDF 생성 확인
6. `config/metadata.tex` 에서 제목·저자·학과·지도교수 등 수정
7. `chapters/ch01_introduction.tex` 부터 본문 작성 시작

### 옵션 2) 로컬 (macOS / Linux / Windows)

사전 요구사항: **TeX Live 2022 이상** 또는 **MiKTeX**

```bash
cd 양식/thesis-gachon-kr      # 또는 thesis-gachon-en
latexmk main.tex              # latexmkrc가 xelatex + bibtex 자동 실행
```

또는 수동으로:

```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

출력: `main.pdf`

---

## ✏️ 메타데이터 수정 (가장 중요)

논문의 **모든 개인정보**는 `config/metadata.tex` 한 파일에서만 관리합니다. 표지·내표지·제출서·인준서·초록에 자동 반영됩니다.

### 국문판 (`thesis-gachon-kr/config/metadata.tex`)

```latex
\newcommand{\DegreeKR}{석사}                    % "석사" 또는 "박사"
\newcommand{\FieldKR}{공학}
\newcommand{\ThesisTitleKR}{논문 제목}
\newcommand{\ThesisTitleEN}{Thesis Title in English}
\newcommand{\AuthorKR}{홍\hspace{1.2em}길\hspace{1.2em}동}
\newcommand{\AuthorKRPlain}{홍길동}
\newcommand{\DepartmentKR}{설비·소방공학과}
\newcommand{\MajorKR}{소방방재공학 전공}
\newcommand{\Advisor}{지도교수 성명}
\newcommand{\SubmissionYear}{2026}
\newcommand{\SubmissionMonth}{2}                % 2 또는 8
```

### 영문판 (`thesis-gachon-en/config/metadata.tex`)

```latex
\newcommand{\DegreeType}{Master's Thesis}       % 또는 "Doctoral Dissertation"
\newcommand{\DegreeStatement}{Master of Engineering}
\newcommand{\ThesisTitleEN}{Thesis Title}
\newcommand{\ThesisTitleKR}{국문 제목}           % 뒷면 국문초록용
\newcommand{\AuthorEN}{Gildong Hong}
\newcommand{\AuthorKR}{홍길동}
\newcommand{\MajorEN}{Computer Engineering Major}
\newcommand{\DepartmentEN}{Department of IT Convergence Engineering}
\newcommand{\AdvisorEN}{Cheolsoo Kim}
\newcommand{\SubmissionYear}{2026}
\newcommand{\SubmissionMonth}{February}         % "February" 또는 "August"
```

### 석사 ↔ 박사 전환

1. `metadata.tex` 에서 학위 필드(`\DegreeKR` 또는 `\DegreeType`) 수정
2. 영문판: `\DegreeStatement` 도 함께 수정 ("Doctor of Philosophy in Engineering")
3. `frontmatter/04_approval.tex` 에서 **심사위원 2줄 주석 해제** (석사 3 인 → 박사 5 인)

---

## 🔤 폰트 설정

### 국문판

- **기본값**: kotex 기본 한글 폰트 — 추가 설치 없이 즉시 컴파일됨
- **지침 완전 준수**: 함초롬바탕 `.ttf` 를 `fonts/` 에 배치하고 `config/fonts.tex` 옵션 A 주석 해제
- 상세: [`thesis-gachon-kr/README.md`](thesis-gachon-kr/README.md)

### 영문판

- **기본값**: **TeX Gyre Termes** (Times 호환, TeX Live 기본 포함)
- **지침 완전 준수**: 실제 Times New Roman `.ttf` 을 `fonts/` 에 배치하고 `config/fonts.tex` 옵션 B 주석 해제
- 국문초록 페이지 때문에 kotex가 무조건 로드됩니다 → XeLaTeX 필수
- 상세: [`thesis-gachon-en/README.md`](thesis-gachon-en/README.md)

---

## 📋 제본 순서

두 템플릿 모두 공식 지침의 제본 순서를 **`main.tex` 에서 순차적으로** 구성합니다.

### 국문판 제본 순서

① 표지 → ② 면지 → ③ 내표지 → ④ 논문제출서 → ⑤ 인준서 → ⑥ **국문초록** → ⑦ 목차 → ⑧ 표목차 → ⑨ 그림목차 → ⑩ 본문 → ⑪ 참고문헌 → ⑫ 부록 → ⑬ **영문초록** → ⑭ 백지 → ⑮ 뒷표지

### 영문판 제본 순서 (⚠️ 초록 위치가 다릅니다)

① Cover → ② Flyleaf → ③ Inner Cover → ④ Submission → ⑤ Approval → ⑥ **Abstract (English)** → ⑦ TOC → ⑧ List of Tables → ⑨ List of Figures → ⑩ Main Text → ⑪ References → ⑫ Appendix → ⑬ **Abstract (Korean / 국문초록)** → ⑭ Blank → ⑮ Back Cover

---

## 🧾 원본 지침 문서

본 LaTeX 템플릿은 다음 두 공식 문서를 근거로 작성되었습니다. **의심스러운 부분이 있으면 반드시 원본을 확인**하세요.

| 파일 | 내용 |
|---|---|
| `(국문)학위논문 작성지침.pdf` | 국문 작성지침 (15쪽, 별표 1~10) |
| `(국문)학위논문 템플릿(이공계열).hwp` | 공식 HWP 템플릿 |
| `Thesis_Dissertation_Guidelines_English.pdf` | 영문 작성지침 (15쪽, Appendix 1~10) |

구현 의사결정은 다음 기획서에 정리되어 있습니다.

| 파일 | 내용 |
|---|---|
| `LaTeX_템플릿_기획서.md` | 국문판 구현 기획서 (269 줄) |
| `LaTeX_Template_Plan_EN.md` | 영문판 구현 기획서 (279 줄) |

---

## ✅ 제출 전 체크리스트

PDF 출력 후 다음 항목을 **반드시** 육안으로 확인하세요.

### 공통
- [ ] 용지가 **B5 (190 × 260 mm)** 로 출력되는가
- [ ] `config/metadata.tex` 의 모든 필드가 본인 정보로 수정되었는가
- [ ] 석사/박사에 맞게 학위 필드와 인준서 심사위원 수가 일치하는가
- [ ] 제출 월이 **2월 또는 8월** 로 되어 있는가
- [ ] 제본 순서가 지침대로 유지되는가
- [ ] 참고문헌이 본문 인용과 동기화되어 있는가
- [ ] 초록 본문이 각 2쪽 이내인가 / 핵심어 7~8단어가 기입되어 있는가

### 국문판 전용
- [ ] 여백 위 20 / 아래 15 / 좌우 25 mm
- [ ] 본문 줄간격이 시각적으로 180~200 %
- [ ] 장 제목이 **"제N장 ..."** 형식
- [ ] 번호 체계가 1.1 → 1.1.1 → (1) → ① 순으로 적용되는가
- [ ] 휴먼명조 계열 글꼴이 적용되는가 (지침 준수 시)

### 영문판 전용
- [ ] 여백 위 30 / 아래 30 / 좌우 25 mm
- [ ] 본문 줄간격이 1.5 또는 2.0
- [ ] 장 제목이 **"1. Introduction"** 형식 (본문)
- [ ] 목차 장 헤더가 **"CHAPTER 1. ..."** 형식
- [ ] Times New Roman 계열 글꼴이 적용되는가
- [ ] 뒷면 국문초록(Appendix 10) 이 한글로 작성되어 있는가

---

## ⚠️ 알려진 제한 사항

### 공통
- **로컬 xelatex 검증 미수행**: 템플릿 작성 시 로컬에 TeX Live가 없어 실제 컴파일은 Overleaf에서 검증해야 합니다. 첫 컴파일에서 오류가 나면 로그와 함께 이슈로 제기하세요.
- **"장평 80 %" 근사**: `\scalebox{0.8}[1]{...}` 로 구현했기 때문에 단일 행 제목에 최적입니다. 긴 제목은 메타데이터에서 `\\` 로 수동 줄바꿈을 넣으세요.
- **HWP 원본 참조 미수행**: 작성지침 PDF만으로 구현했으며, HWP 파일의 숨은 스타일 매핑은 반영되지 않았습니다.

### 국문판 전용
- **자간 29**: 지침의 HWP 기준 자간 값을 fontspec `LetterSpace` 로 근사했습니다. 완전 일치가 필요하면 `frontmatter/01_cover.tex` 에서 수동 조정하세요.

### 영문판 전용
- **`\addstarchaptertoc` 헬퍼 필수**: 번호 없는 장(Abstract/References/Appendix/국문초록)은 반드시 이 헬퍼를 사용해야 합니다. 일반 `\addcontentsline{toc}{chapter}{...}` 를 쓰면 빈 "CHAPTER ." 접두어가 찍힙니다.
- **부록 자동 번호 없음**: `\chapter*` 로 부록을 작성하므로 "Appendix A", "Appendix B" 식의 자동 번호는 없습니다. `\section*` 로 수동 작성하세요.
- **이탤릭 제목**: 지침 예시가 기울어 보이는 점을 반영해 커버/제출서 제목에 `\itshape` 가 적용되어 있습니다. 원치 않으면 `frontmatter/` 파일에서 제거 가능합니다.

---

## 🔧 문제 해결

| 증상 | 원인 / 해결 |
|---|---|
| `Package fontspec Error: font not found` | `config/fonts.tex` 의 폰트 이름이 시스템에 없음. 옵션 주석 처리 후 기본값 사용 |
| 한글이 □ 로 표시됨 | 엔진이 pdfLaTeX임. XeLaTeX로 변경 |
| 목차에 장 번호가 안 찍힘 | (영문판) 일반 `\addcontentsline` 대신 `\addstarchaptertoc` 사용 |
| 참고문헌이 비어있음 | `bibtex main` 실행 후 `xelatex main` 2회 더 실행 |
| 인준서에 심사위원이 5명으로 나와야 하는데 3명만 나옴 | `frontmatter/04_approval.tex` 의 박사용 2줄 주석 해제 |
| 표지 제목이 너무 길어서 넘침 | `metadata.tex` 의 `\ThesisTitleKR/EN` 에 `\\` 로 수동 줄바꿈 삽입 |

---

## 📝 라이선스 및 저작권

- **공식 지침 문서** (`*.pdf`, `*.hwp`) — 가천대학교 일반대학원 저작물. 원본 배포처를 확인하세요.
- **LaTeX 템플릿 코드** — 본 프로젝트 내에서 자유롭게 수정·재배포 가능합니다. 다만 **지침 준수 여부는 최종적으로 사용자가 책임**져야 하며, 제출 전 반드시 지도교수 및 대학원 행정실에 최종 양식을 확인하세요.

---

## 📚 추가 정보

- **각 템플릿의 상세 사용법**: 해당 폴더의 `README.md` 를 참조하세요.
  - [`thesis-gachon-kr/README.md`](thesis-gachon-kr/README.md)
  - [`thesis-gachon-en/README.md`](thesis-gachon-en/README.md)
- **설계 의사결정**: 기획서 문서를 참조하세요.
  - [`LaTeX_템플릿_기획서.md`](LaTeX_템플릿_기획서.md)
  - [`LaTeX_Template_Plan_EN.md`](LaTeX_Template_Plan_EN.md)
- **공식 지침 원본**: `(국문)학위논문 작성지침.pdf`, `Thesis_Dissertation_Guidelines_English.pdf`
