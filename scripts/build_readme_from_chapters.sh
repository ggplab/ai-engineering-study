#!/usr/bin/env bash
set -euo pipefail

cat > README.md <<'HEADER'
# AI Engineering Study Archive

노션 스터디 내용을 단원별 질문 중심으로 한 페이지에서 보도록 재구성했습니다.

- 질문: 기본으로 펼쳐서 확인
- 답변/모범답안: 각 질문 아래 토글(`details`)로 숨김

## 단원 목록
- [01단원](#01단원)
- [02단원](#02단원)
- [03단원](#03단원)
- [04단원](#04단원)
- [05단원](#05단원)
- [06단원](#06단원)
- [07단원](#07단원)
- [08단원](#08단원)
- [09단원](#09단원)
- [10단원](#10단원)
HEADER

for f in chapters/[0-9][0-9]-chapter-[0-9][0-9].md; do
  awk '
  BEGIN {
    chapter=""; author=""; qidx=0; inq=0;
  }
  /^# [0-9][0-9]단원$/ {
    chapter=$0;
    sub(/^# /, "## ", chapter);
    print "\n" chapter "\n";
    next;
  }
  /^    ### / {
    author=$0;
    sub(/^    ### /, "", author);
    gsub(/^ +| +$/, "", author);
    if (author ~ /스터디 질문|문제 출제/) author="";
    next;
  }
  /^    - / {
    if (inq==1) {
      print "\n</details>\n";
    }
    inq=1;
    qidx++;

    q=$0;
    sub(/^    - /, "", q);
    gsub(/^ +| +$/, "", q);

    printf "%d. %s\n\n", qidx, q;
    if (author != "") {
      printf "<details><summary>답변/모범답안 보기 - %s</summary>\n\n", author;
    } else {
      print "<details><summary>답변/모범답안 보기</summary>\n";
    }
    next;
  }
  {
    if (inq==0) next;

    line=$0;
    gsub(/^ +/, "", line);

    if (line ~ /^<aside>/ || line ~ /^<\/aside>/) next;
    if (line ~ /^💡[[:space:]]*$/) { print "**답변**"; next; }
    if (line ~ /^✅[[:space:]]*$/) { print "**모범정답**"; next; }

    print line;
  }
  END {
    if (inq==1) print "\n</details>\n";
  }
  ' "$f" >> README.md
done
