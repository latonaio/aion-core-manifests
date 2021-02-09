#!/bin/bash

find . -name "*.yml" | xargs sed -i "" -e "s|-NODE-NAME||g"
find . -name "*.yml" | xargs sed -i "" -e "s|nodeSelector:||g"
find . -name "*.yml" | xargs sed -i "" -e "s|kubernetes.io/hostname=: null||g"