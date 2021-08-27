#!/usr/bin/env bash

rm -rf apl*
rm -rf public

hugo

mv public apl

tar zcvf apl.tgz apl

scp apl.tgz apl@veritas.ucd.ie:public_html/

rm -rf apl*

ssh apl@veritas.ucd.ie "rm -rf public_html/apl/"

ssh apl@veritas.ucd.ie "cd public_html; tar zxvf apl.tgz; rm apl.tgz"

