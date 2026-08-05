#!/bin/sh

set -x

for size in 16 24 32 48 72 128 256 512; do
	install -m644 -D -T docs/logo/mupdf-icon-$size.png \
		debian/tmp/usr/share/icons/hicolor/${size}x${size}/apps/mupdf.png
done

install -m644 -D -T docs/logo/mupdf-icon.svg \
	debian/tmp/usr/share/icons/hicolor/scalable/apps/mupdf.svg
