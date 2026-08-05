#!/bin/bash
set -e
export PATH=$PATH:/usr/libexec/afdko

ln -sf /usr/share/fonts-droid-fallback/truetype/DroidSansFallback.ttf /usr/share/fonts/truetype/droid/DroidSansFallbackFull.ttf resources/fonts/droid

# exactly the same font with different name
ln -sf /usr/share/fonts/opentype/noto/NotoSerifCJK-Regular.ttc resources/fonts/han/SourceHanSerif-Regular.ttc

ln -sf /usr/share/texlive/texmf-dist/fonts/truetype/google/noto-emoji/NotoEmoji-Regular.ttf resources/fonts/noto
for f in /usr/share/fonts/truetype/noto/*-Regular.ttf
do
  ln -sf $f resources/fonts/noto/`basename ${f//ttf/otf}`
done

cd resources/fonts/sil
ln -sf /usr/share/fonts/truetype/charis/CharisSIL-Regular.ttf
ln -sf /usr/share/fonts/truetype/charis/CharisSIL-Bold.ttf
ln -sf /usr/share/fonts/truetype/charis/CharisSIL-BoldItalic.ttf
ln -sf /usr/share/fonts/truetype/charis/CharisSIL-Italic.ttf
cd -

cd resources/fonts/urw
mkdir -p input
for f in /usr/share/fonts/type1/urw-base35/*
do
  ln -sf $f input/`basename $f`
done
mv input/D050000L.afm input/Dingbats.afm
mv input/D050000L.t1  input/Dingbats.t1
source tocff.sh
mv D050000L.cff Dingbats.cff
cd -
