#!/usr/bin/env bash

rm -rf apl*
rm -rf public

hugo

mv public apl

tar zcvf apl.tgz apl

scp apl.tgz apl@veritas.ucd.ie:/var/www/html/physicslabs

rm -rf apl*

ssh apl@veritas.ucd.ie "rm -rf /var/www/html/physicslabs/apl"

ssh apl@veritas.ucd.ie "cd /var/www/html/physicslabs/; tar zxvf apl.tgz; rm apl.tgz"

