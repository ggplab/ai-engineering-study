# Notion Import Guide

## 1) 노션에서 내보내기
1. 노션 페이지 우측 상단 `...` 클릭
2. `Export` 선택
3. 포맷을 `Markdown & CSV`로 선택
4. `Include subpages` 체크 후 다운로드

## 2) 로컬 정리
- 압축 해제 후 단원별 Markdown 파일을 확인
- 이미지 파일은 단원별 폴더로 옮기거나 GitHub `assets/`에 모아 관리
- 단원 내용을 `templates/chapter-template.md` 형식에 맞춰 재배치

## 3) 반영 규칙
- 질문/답글/모범정답을 분리해서 작성
- 모호한 표현은 "정의 + 예시"로 보완
- 마지막에 반드시 `헷갈린 포인트` 작성

## 4) 커밋 예시
```bash
git add chapters/02-rag-overview.md
git commit -m "docs: add chapter 02 rag overview"
git push
```
