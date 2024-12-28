#!/bin/bash

mkdir -p $PREFIX/etc/apt/sources.list.d
echo "deb [trusted=yes] https://termux-pawn.github.io/repo stable main" > $PREFIX/etc/apt/sources.list.d/termux-pawn.list

yes | pkg update -y
yes | pkg upgrade -y

echo -e "\n\n\e[32mTermux Pawn v1.2.0 apresenta\n\n\e[0mPacotes disponíveis:\n • pawncc, v3.10.10, compatível com SA-MP e Open.MP\n • pawncc-11, v3.10.11, compatível apenas com Open.MP\n • deamx, v2.0, compatível apenas com v3.10.10\n\nUtilze: pkg install <nome do pacote>\n"
