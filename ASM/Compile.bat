@echo off
color 0a
cls
title Compiler Asm - Ser@ph

cls

:Start

TASM.EXE curs.asm

TLINK.EXE curs.obj /t

pause


