.\dictation-kit-4.5\bin\windows\julius.exe ^
	-gram grammar/tel ^
	-h ./dictation-kit-4.5/model/phone_m/jnas-tri-3k16-gid.binhmm ^
	-hlist ./dictation-kit-4.5/model/phone_m/logicalTri ^
	-input mic ^
	-demo

pause > nul
