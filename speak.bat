@echo off

cd open_jtalk
echo %1 > tmp.txt
.\bin\open_jtalk.exe -x dic\ -m nitech_jp_atr503_m001.htsvoice -ow tmp.wav tmp.txt
play.exe tmp.wav > null
