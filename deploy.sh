#!/usr/bin/env bash

rm -rf apl*
rm -rf public

hugo


mv public apl

npx pagefind --site "apl"

tar zcvf apl.tgz apl

scp apl.tgz apl@veritas.ucd.ie:/Library/WebServer/apl

rm -rf apl*

ssh apl@veritas.ucd.ie "rm -rf /Library/WebServer/apl/apl"

ssh apl@veritas.ucd.ie "cd /Library/WebServer/apl; tar zxvf apl.tgz; rm apl.tgz"
