# 가천대학교 일반대학원 학위논문 LaTeX 템플릿 (영문)

가천대학교 일반대학원 **영문 학위논문 작성지침 (Thesis/Dissertation Guidelines)** 을 기반으로 한 LaTeX 템플릿입니다. 국문 템플릿(`thesis-gachon/`)과 파일 구조는 동일하며, 영문 지침의 제본 순서 · 서식 · 번호 체계를 반영합니다.

## 빠른 시작

### Overleaf에서 사용

1. 이 `thesis-gachon-en/` 폴더 전체를 zip으로 압축
2. Overleaf → **New Project → Upload Project** 에 업로드
3. **Menu → Settings → Compiler** 를 **XeLaTeX** 로 변경 (필수)
4. **Menu → Settings → Main document** 를 `main.tex` 로 설정
5. **Recompile** 클릭

### 로컬 (macOS / Linux / Windows) 에서 사용

TeX Live 2022 이상 또는 MiKTeX이 설치되어 있어야 합니다.

```bash
cd thesis-gachon-en
latexmk main.tex        # latexmkrc 가 xelatex + bibtex 를 자동 처리
# 또는 수동:
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

## 폰트 설정 — Times New Roman

영문 지침은 본문 · 헤딩 전체에 대해 **Times New Roman** 을 요구합니다. 그러나 Overleaf와 많은 리눅스 TeX Live 에는 Times New Roman `.ttf` 가 기본 설치되어 있지 않습니다. 이를 고려하여 `config/fonts.tex` 는 기본값으로 **TeX Gyre Termes** (Times 호환, TeX Live 기본 포함) 를 사용합니다.

실제 Times New Roman 을 사용하려면 아래 중 하나를 선택하세요.

1. **시스템 설치 (macOS / Windows)**: `config/fonts.tex` 의 옵션 A 를 주석 처리하고 옵션 B의 `\setmainfont{Times New Roman}` 을 활성화
2. **폰트 파일 업로드**: `thesis-gachon-en/fonts/` 폴더에 `times.ttf`, `timesbd.ttf`, `timesi.ttf`, `timesbi.ttf` 를 업로드한 뒤 옵션 B의 경로 버전을 활성화

국문초록(본문 뒤 배치)에는 kotex 기본 폰트가 사용되며, 별도 설치 없이도 컴파일됩니다. 제출본용으로 함초롬바탕 같은 명조 계열을 적용하려면 `config/fonts.tex` 의 `\setmainhangulfont` 블록 주석을 해제하세요.

## 메타데이터 수정

논문 제목, 저자, 학과, 지도교수, 제출 시점 등은 모두 **`config/metadata.tex` 한 파일** 에서만 수정하면 표지 / 내표지 / 제출서 / 인준서 / 초록에 모두 반영됩니다.

```latex
\newcommand{\DegreeType}{Master's Thesis}              % 또는 "Doctoral Dissertation"
\newcommand{\DegreeStatement}{Master of Engineering}   % 또는 "Doctor of Philosophy in Engineering"
\newcommand{\ThesisTitleEN}{...}
\newcommand{\ThesisTitleKR}{...}                       % 본문 뒤 국문초록용
\newcommand{\AuthorEN}{Gildong Hong}
\newcommand{\AuthorKR}{홍길동}
\newcommand{\MajorEN}{Computer Engineering Major}
\newcommand{\DepartmentEN}{Department of IT Convergence Engineering}
\newcommand{\GraduateSchoolEN}{Graduate School of Gachon University}
\newcommand{\DepartmentKR}{IT융합공학과}
\newcommand{\GraduateSchoolKR}{가천대학교 대학원}
\newcommand{\AdvisorEN}{Cheolsoo Kim}
\newcommand{\SubmissionYear}{2026}
\newcommand{\SubmissionMonth}{February}                % "February" 또는 "August"
```

### 석사 ↔ 박사 전환

`config/metadata.tex` 에서 다음 항목을 수정하세요.

| 필드 | 석사 (Master) | 박사 (Doctoral) |
|---|---|---|
| `\DegreeType` | `Master's Thesis` | `Doctoral Dissertation` |
| `\DegreeStatement` | `Master of Engineering` | `Doctor of Philosophy in Engineering` |
| `\SubmissionStatement` | `A thesis Submitted ... Master of Engineering.` | `A dissertation Submitted ... Doctor of Philosophy in Engineering.` |
| `\ApprovalStatement` | `The thesis of ... Master of Engineering.` | `The dissertation of ... Doctor of Philosophy in Engineering.` |

박사의 경우 추가로:

1. `frontmatter/04_approval.tex` 하단 "Committee Member" 2줄 주석 해제 → 심사위원 5인 (위원장 1 + 위원 4)

## 제본 순서 (영문 지침)

`main.tex` 는 영문 지침의 제본 순서를 그대로 따릅니다. **국문 지침과 달리 영문초록이 목차 앞, 국문초록이 본문 뒤** 에 배치됩니다.

| 번호 | 항목 | 파일 |
|---|---|---|
| (1) | Cover Page | `frontmatter/01_cover.tex` |
| (2) | Flyleaf | (01_cover 끝에 포함) |
| (3) | Inner Cover Page | `frontmatter/02_innercover.tex` |
| (4) | Statement of Thesis Submission | `frontmatter/03_submission.tex` |
| (5) | Thesis Review Approval Sheet | `frontmatter/04_approval.tex` |
| (6) | **ABSTRACT (English)** | `frontmatter/05_abstract_en.tex` |
| (7) | Table of Contents | `\tableofcontents` (자동) |
| (8) | List of Tables | `\listoftables` (자동) |
| (9) | List of Figures | `\listoffigures` (자동) |
| (10) | Main Text | `chapters/ch01~ch05` |
| (11) | References | `\bibliography{backmatter/references}` |
| (12) | Appendix | `backmatter/appendix.tex` |
| (13) | **국문초록 (Korean Abstract)** | `backmatter/abstract_kr.tex` |
| (14) | Blank Page | — (PDF 상 불필요, 제본 시 삽입) |
| (15) | Back Cover | — (양장 제본 시 제본소 처리) |

## 지침 대비 주요 규격

| 항목 | 값 |
|---|---|
| 용지 | B5 (190 × 260 mm) |
| 여백 | 위 30 / 아래 30 / 좌우 25 mm |
| 머리말 / 꼬리말 | 10 / 10 mm |
| 제본 여백 | 0 mm |
| 폰트 | Times New Roman (본문 + 헤딩 전체) |
| 본문 글자 | 11 pt |
| 각주 | 9 pt |
| 줄간격 | 1.5 또는 2.0 (`\setstretch{1.5}` 기본) |
| 문단 들여쓰기 | 2 em (2자) |
| 장 제목 (본문) | 16 pt, 중앙, 진하게, `1. Introduction` |
| 장 제목 (목차) | 13 pt, 진하게, `CHAPTER 1. Title` |
| 절 제목 | 14 pt, 진하게, `1.1 Title` |
| 항 제목 | 12 pt, 진하게, `1.1.1 Title` |
| 표 번호 | `Table 2.1` (장.번호, 점 구분자) |
| 그림 번호 | `Figure 2.1` |

> **장 번호 표기의 이원화**: 영문 지침은 목차에서는 `CHAPTER 1.` 을, 본문 장 제목에서는 `1. Introduction` 을 예시로 제시합니다. 본 템플릿은 `titletoc` 의 목차 포맷에서 `CHAPTER` 접두어를, `titlesec` 의 장 포맷에서 숫자만을 사용하여 이 이원화를 정확히 반영합니다.

## 디렉터리 구조

```
thesis-gachon-en/
├── main.tex                         # 루트 문서
├── gachon-thesis-en.cls             # 문서 클래스
├── latexmkrc                        # 빌드 설정 (xelatex 강제)
├── config/
│   ├── metadata.tex                 # 논문 메타데이터 (여기만 수정)
│   └── fonts.tex                    # 폰트 설정 (Times New Roman / TeX Gyre Termes)
├── frontmatter/
│   ├── 01_cover.tex                 # Cover + Flyleaf
│   ├── 02_innercover.tex            # Inner Cover
│   ├── 03_submission.tex            # Statement of Thesis Submission
│   ├── 04_approval.tex              # Thesis Review Approval Sheet
│   └── 05_abstract_en.tex           # ABSTRACT (영문 초록, 목차 앞)
├── chapters/
│   ├── ch01_introduction.tex
│   ├── ch02_background.tex
│   ├── ch03_method.tex
│   ├── ch04_result.tex
│   └── ch05_conclusion.tex
├── backmatter/
│   ├── references.bib               # BibTeX 데이터베이스
│   ├── appendix.tex                 # Appendix
│   └── abstract_kr.tex              # 국문초록 (본문 뒤)
├── fonts/                           # (옵션) 사용자 폰트 (.ttf 업로드 위치)
└── README.md
```

## 알려진 제한 사항

- **Times New Roman 가용성**: Overleaf 기본 환경에는 Times New Roman `.ttf` 가 설치되어 있지 않습니다. 본 템플릿은 **TeX Gyre Termes** (Times 호환) 를 기본값으로 사용합니다. 지침 완전 준수를 위해서는 `fonts/` 폴더에 Times New Roman `.ttf` 를 업로드하고 `config/fonts.tex` 의 옵션 B 를 활성화하세요.
- **국문초록 폰트**: 본문 전체가 Times New Roman 계열 영문 폰트인 반면, 뒤에 오는 국문초록 한 페이지는 kotex 기본 한글 폰트로 조판됩니다. 제출본에서 명조 계열로 교체하려면 `config/fonts.tex` 의 `\setmainhangulfont` 블록을 활성화하세요.
- **부록 번호**: `\chapter*{Appendix}` 로 작성하므로 자동 장 번호는 부여되지 않습니다. 필요 시 `backmatter/appendix.tex` 에서 `\section*` 대신 `\section` 을 사용하여 번호를 수동 지정할 수 있습니다.
- **국문초록 목차 표기**: `\addstarchaptertoc{국문초록}` 으로 목차에 "국문초록" 항목이 추가됩니다. 접두어("CHAPTER") 없이 굵은 13 pt 로 표시됩니다. References · Appendix · ABSTRACT 도 동일한 포맷을 사용합니다.
- **제본 여백 0 mm**: 지침대로 `bindingoffset=0` 으로 설정되어 있습니다. 실제 제본 여유가 필요하면 `gachon-thesis-en.cls` 의 `bindingoffset` 을 조정하세요.
- **장평 / 자간**: 영문 지침은 장평 · 자간 조정을 요구하지 않으므로 본 템플릿은 1:1 비율의 Times 폰트를 그대로 사용합니다 (국문 템플릿과의 차이점).

## 체크리스트 (제출 전)

- [ ] `config/metadata.tex` 의 모든 항목이 본인 정보로 수정되었는가
- [ ] `\SubmissionMonth` 가 `February` 또는 `August` 로 설정되었는가
- [ ] 석사 / 박사에 맞게 `\DegreeType`, `\DegreeStatement`, `\SubmissionStatement`, `\ApprovalStatement`, `04_approval.tex` 의 심사위원 수가 모두 일관되는가
- [ ] ABSTRACT (영문) / 국문초록이 각각 2 쪽 이내인가
- [ ] Key words / 핵심어가 7~8 단어 기입되었는가
- [ ] Times New Roman (또는 TeX Gyre Termes) 이 적용되었는가
- [ ] B5 규격으로 PDF가 출력되는가
- [ ] 제본 순서 (영문초록은 앞, 국문초록은 뒤) 가 지켜지는가
