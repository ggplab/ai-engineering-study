# Notion Import Guide

## 1) 노션에서 내보내기
1. 노션 페이지 우측 상단 `...` 클릭
2. `Export` 선택
3. 포맷을 `Markdown & CSV`로 선택
4. `Include subpages` 체크 후 다운로드

## 2) 로컬 정리
- 압축 해제 후 메인 Markdown 파일을 `notion_raw/`에 저장
- 파일명 예시: `notion_raw/AI 엔지니어링 스터디 ... .md`
- 아래 스크립트로 루트 `README.md`를 재생성

```bash
scripts/build_readme_from_chapters.sh "notion_raw/<notion_export>.md"
```

## 3) 반영 규칙
- 질문/답글/모범정답을 분리해서 작성
- 모호한 표현은 "정의 + 예시"로 보완
- 마지막에 반드시 `헷갈린 포인트` 작성

## 4) 커밋 예시
```bash
git add README.md notion_raw/ scripts/build_readme_from_chapters.sh
git commit -m "docs: refresh readme from notion export"
git push
```
