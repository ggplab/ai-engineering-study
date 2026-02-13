#!/usr/bin/env bash
set -euo pipefail

if [ "${1:-}" = "" ]; then
  echo "Usage: $0 <notion_markdown_file>"
  exit 1
fi

INPUT="$1"

if [ ! -f "$INPUT" ]; then
  echo "File not found: $INPUT"
  exit 1
fi

cat > README.md <<'HEADER'
# AI Engineering Study Archive

> [!NOTE]
> 노션 스터디 원본을 GitHub 친화적인 형식으로 재구성했습니다.
> 구조: `단원 토글` -> `문제 토글` -> `답변/모범답안`.

## Quick Start
```bash
scripts/build_readme_from_chapters.sh "notion_raw/<notion_export>.md"
```

## 단원 바로가기
- [01단원](#ch01)
- [02단원](#ch02)
- [03단원](#ch03)
- [04단원](#ch04)
- [05단원](#ch05)
- [06단원](#ch06)
- [07단원](#ch07)
- [08단원](#ch08)
- [09단원](#ch09)
- [10단원](#ch10)

---
HEADER

awk '
BEGIN {
  in_chapter=0;
  chapter_open=0;
  question_open=0;
  author="";
  qidx=0;
  chapter_num="";
}
function close_question() {
  if (question_open==1) {
    print "\n</details>\n";
    question_open=0;
  }
}
function close_chapter() {
  if (chapter_open==1) {
    close_question();
    print "</details>\n\n---\n";
    chapter_open=0;
  }
}
/^- [0-9]+단원$/ {
  close_chapter();

  in_chapter=1;
  chapter_num=$2;
  gsub("단원", "", chapter_num);
  qidx=0;
  author="";

  printf "\n<a id=\"ch%02d\"></a>\n", chapter_num;
  printf "<details>\n<summary><strong>%02d단원</strong> - 문제와 답변 보기</summary>\n\n", chapter_num;
  print "### 문제 목록\n";
  chapter_open=1;
  next;
}
{
  if (in_chapter==0) next;
}
/^    ### / {
  author=$0;
  sub(/^    ### /, "", author);
  gsub(/^ +| +$/, "", author);
  if (author ~ /스터디 질문|문제 출제/) author="";
  next;
}
/^    - / {
  close_question();

  qidx++;
  q=$0;
  sub(/^    - /, "", q);
  gsub(/^ +| +$/, "", q);

  printf "<details>\n<summary><strong>Q%d.</strong> %s</summary>\n\n", qidx, q;
  if (author != "") {
    printf "**작성자:** `%s`\n\n", author;
  }
  print "**답변**\n";

  question_open=1;
  next;
}
{
  if (question_open==0) next;

  line=$0;
  gsub(/^ +/, "", line);

  if (line ~ /^<aside>/ || line ~ /^<\/aside>/) next;
  if (line ~ /^💡[[:space:]]*$/) next;
  if (line ~ /^✅[[:space:]]*$/) {
    print "\n**모범답안**\n";
    next;
  }

  print line;
}
END {
  close_chapter();
}
' "$INPUT" >> README.md
