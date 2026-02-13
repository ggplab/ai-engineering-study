# AI Engineering Study Archive

AI 엔지니어링 학습 내용을 **단원별 질문/답변/모범정답** 형태로 정리한 저장소입니다.

## 목표
- 노션에 흩어진 학습 기록을 GitHub에서 버전 관리
- 단원별 핵심 질문과 토론 결과를 구조화
- 회고와 재학습이 가능한 형태로 축적

## 저장소 구조

```text
.
├── README.md
├── CONTRIBUTING.md
├── chapters/
│   └── 01-sample-topic.md
└── templates/
    └── chapter-template.md
```

## 작성 흐름
1. 노션에서 단원 내용을 복사/정리
2. `templates/chapter-template.md`를 복제해서 `chapters/`에 단원 파일 생성
3. 질문, 답글, 모범정답, 배운 점 순서로 작성
4. 커밋 메시지 규칙에 맞춰 업로드

## 권장 파일명 규칙
- `01-llm-basics.md`
- `02-rag-overview.md`
- `03-prompt-engineering.md`

숫자 접두어를 붙이면 학습 순서가 유지됩니다.

## GitHub 업로드 (처음 1회)

```bash
git init
git add .
git commit -m "chore: initialize ai engineering study archive"
git branch -M main
git remote add origin <YOUR_GITHUB_REPO_URL>
git push -u origin main
```

## 이후 업로드

```bash
git add .
git commit -m "docs: add chapter 01 llm basics"
git push
```

## 노션 -> GitHub 정리 팁
- 노션 원문은 길게 두고, GitHub에는 핵심 요약 위주로 작성
- 코드/실습은 별도 코드 블록으로 분리
- 모범정답 아래에 "왜 이 답이 좋은지"를 2~3줄로 남기기
- 단원 끝에 `오답/헷갈린 포인트`를 반드시 기록
