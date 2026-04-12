# 가천대학교 일반대학원 학위논문 LaTeX 템플릿

가천대학교 일반대학원 **이공·자연계열** 국문 학위논문 작성지침을 기반으로 한 LaTeX 템플릿입니다.

## 빠른 시작

### Overleaf에서 사용

1. 이 `thesis-gachon/` 폴더 전체를 zip으로 압축
2. Overleaf → **New Project → Upload Project** 에 업로드
3. **Menu → Settings → Compiler** 를 **XeLaTeX** 로 변경 (중요)
4. **Menu → Settings → Main document** 를 `main.tex` 로 설정
5. **Recompile** 클릭

### 로컬(macOS / Linux / Windows)에서 사용

TeX Live 2022 이상 또는 MiKTeX이 설치되어 있어야 합니다.

```bash
cd thesis-gachon
latexmk main.tex        # latexmkrc가 xelatex + bibtex를 자동 처리
# 또는 수동:
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

## 메타데이터 수정

논문 제목, 저자, 학과, 지도교수, 제출 시점 등은 모두 **`config/metadata.tex` 한 파일**에서만 수정하면 표지/내표지/제출서/인준서/초록에 모두 반영됩니다.

```latex
\newcommand{\DegreeKR}{석사}           % 석사 / 박사
\newcommand{\FieldKR}{공학}
\newcommand{\ThesisTitleKR}{...}
\newcommand{\ThesisTitleEN}{...}
\newcommand{\AuthorKR}{홍\hspace{1.2em}길\hspace{1.2em}동}
\newcommand{\AuthorKRPlain}{홍길동}
\newcommand{\DepartmentKR}{설비·소방공학과}
\newcommand{\MajorKR}{소방방재공학 전공}
\newcommand{\Advisor}{○\hspace{0.8em}○\hspace{0.8em}○}
\newcommand{\SubmissionYear}{2026}
\newcommand{\SubmissionMonth}{2}
```

### 박사 과정으로 전환

1. `config/metadata.tex` 에서 `\DegreeKR` 을 `박사` 로 수정
2. `frontmatter/04_approval.tex` 에서 "심사위원 2줄" 주석 해제 → 심사위원 5인

## 폰트 설정

### 기본 (별도 설치 불필요)

`config/fonts.tex` 는 기본적으로 **kotex 기본 폰트**를 사용하도록 비어 있습니다. Overleaf와 로컬 TeX Live 모두 바로 컴파일됩니다.

### 제출본용 — 함초롬바탕 (권장)

지침은 **신명조 / 명조 / 휴먼명조 중 사용**을 요구합니다. 제출본에는 무료 배포 폰트인 **함초롬바탕**을 권장합니다.

1. 함초롬바탕 `.ttf` 다운로드 (예: `HANBatang.ttf`, `HANBatangB.ttf`)
2. `thesis-gachon/fonts/` 폴더에 배치
3. `config/fonts.tex` 의 **옵션 A** 섹션 6줄 주석 해제
4. Overleaf의 경우, 프로젝트에 `fonts/` 폴더와 `.ttf` 파일을 함께 업로드 → Overleaf 서버에서도 동일하게 빌드됨

## 제본 순서 (15단계)

`main.tex` 는 작성지침의 제본 순서를 그대로 따릅니다.

| 번호 | 항목 | 파일 |
|---|---|---|
| ① | 표지 | `frontmatter/01_cover.tex` |
| ② | 면지 | (01_cover 끝에 포함) |
| ③ | 내표지 | `frontmatter/02_innercover.tex` |
| ④ | 논문제출서 | `frontmatter/03_submission.tex` |
| ⑤ | 논문심사인준서 | `frontmatter/04_approval.tex` |
| ⑥ | 국문초록 | `frontmatter/05_abstract_kr.tex` |
| ⑦ | 목차 | `\tableofcontents` (자동) |
| ⑧ | 표목차 | `\listoftables` (자동) |
| ⑨ | 그림목차 | `\listoffigures` (자동) |
| ⑩ | 본문 | `chapters/ch01~ch05` |
| ⑪ | 참고문헌 | `\bibliography{backmatter/references}` |
| ⑫ | 부록 | `backmatter/appendix.tex` |
| ⑬ | 영문초록 | `backmatter/abstract_en.tex` |
| ⑭ | 백지 | — (PDF 상 불필요, 인쇄 시 제본소에서 삽입) |
| ⑮ | 뒷표지 | — (양장 제본 시 제본소에서 처리) |

## 지침 대비 주요 규격

| 항목 | 값 |
|---|---|
| 용지 | B5 (190 × 260 mm) |
| 여백 | 위 20 / 아래 15 / 좌우 25 mm |
| 머리말 / 꼬리말 | 10 / 15 mm |
| 본문 글자 | 11 pt, 휴먼명조 계열 |
| 줄간격 | 180 ~ 200 % (`\setstretch{1.9}`) |
| 문단 들여쓰기 | 2 em (2칸) |
| 장 제목 | 16 pt, 중앙, 진하게, "제N장 ..." |
| 절 제목 | 14 pt, 진하게, "1.1 ..." |
| 항 제목 | 12 pt, 진하게, "1.1.1 ..." |
| 세부항 | 11 pt, "(1) ..." |
| 최하위 | 11 pt, "① ..." |
| 각주 | 9 pt |

## 디렉터리 구조

```
thesis-gachon/
├── main.tex                        # 루트 문서
├── gachon-thesis.cls               # 문서 클래스
├── latexmkrc                       # 빌드 설정 (xelatex 강제)
├── config/
│   ├── metadata.tex                # 논문 메타데이터 (여기만 수정)
│   └── fonts.tex                   # 폰트 설정
├── frontmatter/
│   ├── 01_cover.tex                # 표지 + 면지
│   ├── 02_innercover.tex           # 내표지
│   ├── 03_submission.tex           # 논문제출서
│   ├── 04_approval.tex             # 논문심사인준서
│   └── 05_abstract_kr.tex          # 국문초록
├── chapters/
│   ├── ch01_introduction.tex
│   ├── ch02_background.tex
│   ├── ch03_method.tex
│   ├── ch04_result.tex
│   └── ch05_conclusion.tex
├── backmatter/
│   ├── references.bib              # BibTeX 데이터베이스
│   ├── appendix.tex                # 부록
│   └── abstract_en.tex             # 영문초록 (ABSTRACT)
└── fonts/                          # (옵션) 함초롬바탕 등 사용자 폰트
```

## 알려진 제한 사항

- **장평 80 %**: `\scalebox{0.8}[1]{...}` 로 구현되어 있어 단일 행 제목에 최적화됩니다. 긴 제목은 `\ThesisTitleKR` 안에 `\\` 로 수동 줄바꿈을 넣으세요.
- **자간 29**: 지침의 HWP 기준 자간(29)은 fontspec의 `LetterSpace` 로 근사 가능합니다. 완전한 시각적 일치가 필요하면 `frontmatter/01_cover.tex` 의 "석사학위논문" 줄에 `\addfontfeature{LetterSpace=29}` 를 수동 추가하세요 (폰트가 지원하는 경우).
- **부록 번호**: `\chapter*` 로 부록을 작성하므로 "제A장" 식의 자동 번호는 부여되지 않습니다. 필요 시 `backmatter/appendix.tex` 에서 섹션 번호를 수동 지정하세요.
- **제본 여백 0 mm**: 지침대로 bindingoffset을 0으로 두었습니다. 실제 제본에서 좌측 여백을 더 확보하려면 `gachon-thesis.cls` 의 `bindingoffset` 을 수정하세요.

## 체크리스트 (제출 전)

- [ ] `config/metadata.tex` 의 모든 항목이 본인 정보로 수정되었는가
- [ ] `SubmissionMonth` 가 2 또는 8 로 설정되었는가
- [ ] 석사/박사에 맞게 `\DegreeKR` 과 `04_approval.tex` 의 심사위원 수가 맞는가
- [ ] 국문초록 / 영문초록이 각 2쪽 이내인가
- [ ] 핵심어 7~8단어가 기입되었는가
- [ ] 함초롬바탕이 적용되었는가 (지침 완전 준수 시)
- [ ] B5 규격으로 PDF가 출력되는가
- [ ] 제본 순서가 지켜지는가
