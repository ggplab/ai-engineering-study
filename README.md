# AI Engineering Study Archive

노션에서 진행한 `AI 엔지니어링 스터디` 기록을 GitHub 기준으로 재구성한 저장소입니다.

## 저장소 구성

```text
.
├── README.md
├── CONTRIBUTING.md
├── IMPORT_FROM_NOTION.md
├── docs/
│   └── 00-study-overview.md
├── chapters/
│   ├── README.md
│   ├── 01-chapter-01.md
│   ├── 02-chapter-02.md
│   ├── ...
│   └── 10-chapter-10.md
├── templates/
│   └── chapter-template.md
└── notion_raw/
    └── AI 엔지니어링 스터디 ... .md
```

## 읽는 순서
1. 스터디 개요: `docs/00-study-overview.md`
2. 단원 인덱스: `chapters/README.md`
3. 단원별 본문: `chapters/01-chapter-01.md` ~ `chapters/10-chapter-10.md`

## 정리 원칙
- 원본 보존: `notion_raw/`
- 학습 본문 분리: `chapters/`
- 운영/가이드 문서 분리: `docs/`, `CONTRIBUTING.md`

## GitHub 업로드

```bash
git add .
git commit -m "docs: import notion study notes by chapter"
git remote add origin <YOUR_GITHUB_REPO_URL>  # 최초 1회
git push -u origin main
```

## 다음 정리 추천
- 각 단원 파일 상단에 `핵심 요약 5줄` 추가
- 질문마다 `최종 모범답안`을 한 번 더 정제
- 단원별 태그(예: `#RAG`, `#평가`, `#배포`) 부여
