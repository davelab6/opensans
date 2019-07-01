#!/usr/bin/env bash

set -e

echo "Converting .glyphs to .ufo"
fontmake -g ./OpenSans-Roman.glyphs -o ufo --no-production-names
fontmake -g ./OpenSans-Italic.glyphs -o ufo --no-production-names

echo "Converting cubic curves to quadratic"
cu2qu ./master_ufo/OpenSans-Light.ufo/ ./master_ufo/OpenSans-Bold.ufo/ ./master_ufo/OpenSans-ExtraBold.ufo/ ./master_ufo/OpenSans-CondensedLight.ufo/ ./master_ufo/OpenSans-CondensedBold.ufo/ ./master_ufo/OpenSans-CondensedExtraBold.ufo/ -i
cu2qu ./master_ufo/OpenSans-LightItalic.ufo/ ./master_ufo/OpenSans-ExtraBoldItalic.ufo/ ./master_ufo/OpenSans-CondensedLightItalic.ufo/ ./master_ufo/OpenSans-CondensedExtraBoldItalic.ufo/ -i

echo "Generating VFs"
fontmake -m OpenSans-Roman.designspace -o variable --output-path ../fonts/variable_ttf/OpenSans-Roman-VF.ttf
fontmake -m OpenSans-Italic.designspace -o variable --output-path ../fonts/variable_ttf/OpenSans-Italic-VF.ttf


rm -rf ./master_ufo ./instance_ufo/
