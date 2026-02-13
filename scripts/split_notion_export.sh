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

mkdir -p chapters docs
rm -f chapters/*.md

awk '
BEGIN{out=""}
/^- [0-9]+단원$/ {
  ch=$2; gsub("단원","",ch);
  num=sprintf("%02d", ch);
  out=sprintf("chapters/%s-chapter-%s.md", num, num);
  print "# " num "단원" > out;
  print "" >> out;
  next;
}
out!="" {print >> out}
' "$INPUT"

awk 'BEGIN{p=1} /^- 1단원$/{p=0} p{print}' "$INPUT" > docs/00-study-overview.md

cat > chapters/README.md <<'INDEX'
# Chapters Index

- [01단원](01-chapter-01.md)
- [02단원](02-chapter-02.md)
- [03단원](03-chapter-03.md)
- [04단원](04-chapter-04.md)
- [05단원](05-chapter-05.md)
- [06단원](06-chapter-06.md)
- [07단원](07-chapter-07.md)
- [08단원](08-chapter-08.md)
- [09단원](09-chapter-09.md)
- [10단원](10-chapter-10.md)
INDEX

echo "Done: chapters and overview regenerated from $INPUT"
