#!/bin/bash

read -p "Please enter the codac package version (X.Y.Z[.D]) : " PACKAGE_VERSION

CPCFG=m-macosx_10_9_x86_64 PY_V_MAJ=3 PY_V_MIN=6 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=m-macosx_11_0_arm64 PY_V_MAJ=3 PY_V_MIN=6 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=m-manylinux_2_17_x86_64.manylinux2014_x86_64 PY_V_MAJ=3 PY_V_MIN=6 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=m-win32 PY_V_MAJ=3 PY_V_MIN=6 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=m-win_amd64 PY_V_MAJ=3 PY_V_MIN=6 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv

CPCFG=m-macosx_10_9_x86_64 PY_V_MAJ=3 PY_V_MIN=7 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=m-macosx_11_0_arm64 PY_V_MAJ=3 PY_V_MIN=7 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=m-manylinux_2_17_x86_64.manylinux2014_x86_64 PY_V_MAJ=3 PY_V_MIN=7 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=m-win32 PY_V_MAJ=3 PY_V_MIN=7 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=m-win_amd64 PY_V_MAJ=3 PY_V_MIN=7 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv

CPCFG=-macosx_10_9_x86_64 PY_V_MAJ=3 PY_V_MIN=8 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-macosx_11_0_arm64 PY_V_MAJ=3 PY_V_MIN=8 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-manylinux_2_17_x86_64.manylinux2014_x86_64 PY_V_MAJ=3 PY_V_MIN=8 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-win32 PY_V_MAJ=3 PY_V_MIN=8 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-win_amd64 PY_V_MAJ=3 PY_V_MIN=8 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv

CPCFG=-macosx_10_9_x86_64 PY_V_MAJ=3 PY_V_MIN=9 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-macosx_11_0_arm64 PY_V_MAJ=3 PY_V_MIN=9 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-manylinux_2_17_x86_64.manylinux2014_x86_64 PY_V_MAJ=3 PY_V_MIN=9 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-win32 PY_V_MAJ=3 PY_V_MIN=9 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-win_amd64 PY_V_MAJ=3 PY_V_MIN=9 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv

CPCFG=-macosx_10_9_x86_64 PY_V_MAJ=3 PY_V_MIN=10 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-macosx_11_0_arm64 PY_V_MAJ=3 PY_V_MIN=10 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-manylinux_2_17_x86_64.manylinux2014_x86_64 PY_V_MAJ=3 PY_V_MIN=10 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-win32 PY_V_MAJ=3 PY_V_MIN=10 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-win_amd64 PY_V_MAJ=3 PY_V_MIN=10 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv

CPCFG=-macosx_10_9_x86_64 PY_V_MAJ=3 PY_V_MIN=12 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-macosx_11_0_arm64 PY_V_MAJ=3 PY_V_MIN=12 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-manylinux_2_17_x86_64.manylinux2014_x86_64 PY_V_MAJ=3 PY_V_MIN=12 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-win32 PY_V_MAJ=3 PY_V_MIN=12 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-win_amd64 PY_V_MAJ=3 PY_V_MIN=12 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv

CPCFG=-macosx_10_9_x86_64 PY_V_MAJ=3 PY_V_MIN=11 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-macosx_11_0_arm64 PY_V_MAJ=3 PY_V_MIN=11 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-manylinux_2_17_x86_64.manylinux2014_x86_64 PY_V_MAJ=3 PY_V_MIN=11 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-win32 PY_V_MAJ=3 PY_V_MIN=11 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
CPCFG=-win_amd64 PY_V_MAJ=3 PY_V_MIN=11 ; rm -Rf codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl ; wget https://github.com/codac-team/codac/releases/download/v$PACKAGE_VERSION/codac-$PACKAGE_VERSION-cp$PY_V_MAJ$PY_V_MIN-cp$PY_V_MAJ$PY_V_MIN$CPCFG.whl --no-check-certificate -nv
