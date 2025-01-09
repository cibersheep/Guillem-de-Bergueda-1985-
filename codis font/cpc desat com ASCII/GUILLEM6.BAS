10 POKE &BDEE,201:ON ERROR GOTO 5280
20 REM Guillem de Bergueda en versio CPC6128 de AMSTRAD ¤ FEDERICO J. ALONSO PADILLA & ACE & GENERALITAT DE CATALUNYA 
30 PEN 1:PAPER 0:INK 0,24:INK 1,0:BORDER 13:CLEAR:SPEED KEY 14,5
40 PEN 1:MOVE 342,15:DRAW 342,384,1:MOVER 1,0:DRAW 343,15:DRAW 633,15:DRAW 633,384:MOVER -1,0:DRAW 632,15:MOVE 342,384:DRAW 633,384:PAPER 1:PEN 0:WINDOW #0,44,79,2,24:CLS:LOCATE 1,1:INK 1,0:INK 0,24:ENV 1,5,1,1,5,2,1,3,5,2
50 FOR j=0 TO 9:KEY j,"":NEXT 
60 mu=0:mo=0
70 xx=1:WINDOW #2,1,1,1,1
80 REM adoptada altra presentacio ,anulacio de l'anterior
90 REM final del titol
100 IF mar=1 THEN fa=1
110 REM del principi del guillem
120 CLS:d=0:ni=1
130 DIM l1$(100),pa$(40),co$(40),si%(40)
140 RANDOMIZE TIME:x=INT(RND(TIME-0.5)*82)+11
150 IF x=20 OR x=30 OR x=39 OR x=40 OR x=48 OR x=49 OR x=50 OR x=57 OR x=58 OR x=59 OR x=60 OR x=66 OR x=67 OR x=68 OR x=69 OR x=70 OR x=75 OR x=76 OR x=77 OR x=78 OR x=79 OR x=80 OR x=84 OR x=85 OR x=86 OR x=87 OR x=88 OR x=89 OR x=90 THEN 140
160 '  posada en la anterior
170 IF x>7 THEN xp=(10*(x/10-x\10)-1)*32+9:yp=(x\10)*-26+304:st=29 ELSE xp=9:yp=304:st=316
180 REM per provar
190 i1%=INT(RND(TIME-0.5)*33)+1:FOR j=1 TO i1%:READ cx%:NEXT:i2%=33-i1%
200 FOR j=1 TO i2%:READ w:NEXT
210 DATA 14,16,17,18,19,22,24,26,27,28,29,31,34,35,37,41,42,45,46,47,52,53,56,62,63,64,71,72,73,74,81,91,92
220 IF cx%\10<10*(cx%/10-cx%\10) THEN w=1 ELSE w=10
230 REM son les del cofre
240 GOSUB 1720:din=100
250 ll=INT(LEN(MID$(l1$(cx%),10))/3)
260 l2=LEN(MID$(l1$(cx%),10))/3  
270 IF l2>ll THEN r=INT(4*(l2-ll)):cl$(1)=MID$(l1$(cx%),10,ll+r)
280 IF l2>ll THEN cl$(2)=MID$(l1$(cx%),10+ll+r,ll)
290 IF l2>ll THEN cl$(3)=MID$(l1$(cx%),10+2*ll+r,ll+r):GOTO 320
300 cl$(1)=MID$(l1$(cx%),10,ll):cl$(2)=MID$(l1$(cx%),10+ll,ll)
310 cl$(3)=MID$(l1$(cx%),10+2*ll)
320 REM 
330 CLS:d2=3
340 PRINT TAB(9)"HOLA! COM ET DIUS ?":PRINT TAB(11)"(Nom i Cognoms)":GOSUB 4490
350 n$=UPPER$(" "+x$+" "):IF x$="" THEN n$="Psssstt ... ":PRINT"Si no tens nom et direa¡b:- "n$:FOR yu=0 TO 3000:NEXT
360 IF LEN(n$)>25 THEN PRINT" El teu nom ea¡s molt llarg.           Do¡na-me'l me¡s curt.b":GOSUB 4490:GOTO 350
370 PRINT:PRINT" Cerca el cofre meravelloa¡s.":PRINT"
 Tambe¡ pots utilitzar el teclat     nume`ric per escriure automa`ticament els missatges indicats :b"
380 PRINT"
f7 agafo   f8 pujo      f9 deixo    
f4 farcell f5 vaig nord f6 ajuda    
f1 vaig est f2 vaig sud f3 vaig oest

 Pots treure i posar la mua¡bsica amb       ~treu musica~ i ~musica~.
       Per continuar pren una tecla.":WHILE INKEY$="":WEND
390 CLS:GOSUB 5080:REM importantissim
400 d=d+1:d1=0:IF so>ni THEN si%(14)=cx%
410 READ si%(6),si%(5)
420 DATA 15,76,33,61,15,76,55,82,36,65,44,76,38,51
430 REM data de seguretat
440 DATA -1,-1
450 IF si%(6)=38 OR si%(5)=51 THEN RESTORE 420
460 IF si%(6)=-1 OR si%(5)=-1 THEN RESTORE 420 
470 PRINT"************************************"
480 '
490 PRINT n$":"TAB(29)"Dia";USING"####";d;
500 IF d=11 AND d1=0 OR d=17 AND d1=0 OR d=24 AND d1=0 OR d=29 AND d1=0 OR d=33 AND d1=0 THEN GOSUB 4270
510 REM dels mobils
520 IF g1=27 AND g2=14 AND cx%=x AND so>1 THEN PRINT:CLS:GOTO 4650
530 INK 1,0:INK 0,24:d2=3:PRINT"
":PRINT"Ets a"+MID$(l1$(x),9):IF xx THEN |VOLUME,12,10,0:|MUSICON,4,&7FFE,&8000+167
540 IF x=68 OR x=49 THEN PRINT:GOTO 560
550 FOR j=1 TO LEN(MID$(l1$(x),9))+5:PRINT"Ð";:NEXT
560 FOR j=5 TO 40
570 IF si%(j)=x THEN PRINT:PRINT"POTS VEURE :":PRINT"ÐÐÐÐÐÐÐÐÐÐÐÐ ":PRINT co$(j)
580 NEXT j
590 REM roca
600 IF g1=12 AND g2=8 AND x=3 THEN PRINT:PRINT"La inscripcioa¡b posa :";
610 IF g1=12 AND g2=8 AND x=3 THEN PRINT CHR$(34);"La vall que";
620 IF g1=12 AND g2=8 AND x=3 THEN PRINT"veus allaa`b baix, va cap al nord.";CHR$(34) 
630 IF x=95 THEN PRINT:PRINT"Et trobes un moro que et diu :";CHR$(34)cl$(2)CHR$(34):SO=SO+1
640 IF x=85 THEN PRINT:PRINT"Un morisc et canta a l'orella :" 
650 IF x=85 THEN PRINT" - ~estaa`b prop de";MID$(l1$(cx%-1*w),9)"~ -":so=so+1
660 IF g1=17 AND g2=32 AND x=40 AND si%(18)=-1 THEN 690
670 IF g1=17 AND g2=32 AND x=40 AND si%(17)=-1 THEN 690
680 GOTO 710
690 PRINT"que abans de morir et diu agonitzant "CHR$(34)cl$(1)CHR$(34):so=so+1
700 si%(32)=0
710 IF g1=3 AND g2=23 AND x=68 AND si%(7)<=1 THEN 730
720 GOTO 740
730 PRINT"I el notari et diu :"CHR$(34)cl$(1)CHR$(34):so=so+1
740 IF g1=34 AND g2=30 AND x=16 THEN 760
750 GOTO 780
760 PRINT"I l'Arondeta et contesta dient      suaument :";
770 PRINT CHR$(34)cl$(2)CHR$(34):so=so+1
780 IF g1=33 AND g2=29 AND x=27 AND si%(7)<=1 THEN 800
790 GOTO 810
800 PRINT"que et respon :"CHR$(34)cl$(2)CHR$(34):so=so+1
810 IF x=57 AND g2=4 THEN mar=0:GOTO 830
820 GOTO 860
830 IF RIGHT$(co$(19),1)<>"a" THEN si%(19)=0
840 IF RIGHT$(co$(20),1)<>"a" THEN si%(20)=0
850 PRINT"Un temporal ha enfonsat el vaixell ius ha deixat a la platja ..":pb=0
860 REM bisbe
870 IF g1=7 AND g2=36 AND x=14 AND din>0 THEN PRINT"I et respon : ":PRINT CHR$(34);
880 id=LEN(l1$(cx%-1*w))-8:IF g1=7 AND g2=36 AND x=14 AND din>0 THEN PRINT"PAX circa ";
890 IF g1=7 AND g2=36 AND x=14 AND din>0 THEN PRINT MID$(l1$(cx%-1*w),10,id);
900 IF g1=7 AND g2=36 AND x=14 AND din>0 THEN PRINT CHR$(34)
910 IF g1=7 AND g2=36 AND x=14 AND din>0 THEN so=so+1:din=0
920 REM gana
930 IF si%(5)=x THEN ga=1
940 IF ga=1 AND si%(22)<0 THEN PRINT"peroa`b t'has afartat amb els          queviures que portaves."
950 IF ga=1 AND si%(22)<0 THEN si%(22)=35:ga=0:si%(5)=si%(5)+5
960 IF si%(5)=x AND si%(22)>0 AND ga=1 THEN GOSUB 4920
970 REM llibre
980 IF G1=12 AND G2=10 AND SI%(10)<0 THEN PRINT:PRINT"I ara recordes, el tia¡tol del capi¡btolque ";
990 IF G1=12 AND G2=10 AND SI%(10)<0 THEN 1010
1000 GOTO 1030
1010 PRINT"diu : ODA a ";:FOR j=1 TO sa
1020 PRINT MID$(so$,sa-j+1,1);:NEXT:PRINT:PRINT:so=so+1
1030 REM bandoler
1040 IF x=si%(6) THEN ba=1
1050 IF ba=1 AND si%(18)=-1 THEN PRINT"Has fet fugir el bandoler !":ba=0:GOTO 1290 
1060 IF ba=1 AND si%(17)=-1 THEN PRINT"Has fet fugir el bandoler !":ba=0:GOTO 1290
1070 IF ba=1 THEN GOSUB 4870
1080 REM anell
1090 IF G1=27 AND G2=12 AND SI%(12)<0 THEN PRINT"Dins l'anell, trobes l'escut"
1100 IF G1=27 AND G2=12 AND SI%(12)<0 THEN PRINT"heraa`bldic de";MID$(l1$(cx%),9);" ...":so=so+1
1110 REM botafumeiro
1120 IF x=77 THEN PRINT"Dintre de la catedral, el           botafumeiro escriu amb fum : ":PRINT"- ";
1130 IF x=77 THEN 1150
1140 GOTO 1170
1150 FOR j=1 TO sa STEP 2
1160 PRINT MID$(so$,j,1)" ";:NEXT:PRINT" -
":so=so+1
1170 IF g1=36 AND g2=29 THEN PRINT:PRINT"Un dels oients et doa¡bna diners i     et diu : ";
1180 IF g1=36 AND g2=29 THEN PRINT CHR$(34)cl$(2)CHR$(34):din=din+10:so=so+1
1190 REM barca
1200 IF g1=15 AND g2=19 AND mar=1 THEN PRINT"Ets a dalt de la teva barca a punt  de";
1210 IF g1=15 AND g2=19 AND mar=1 THEN PRINT"navegar ...":pb=1
1220 IF g1=15 AND g2=20 AND mar=1 THEN PRINT"Ets a dalt del teu galioa¡b a punt     de nave";
1230 IF g1=15 AND g2=20 AND mar=1 THEN PRINT"gar ...":pb=1:REM lo del fossil
1240 IF g1=13 AND g2=15 AND si%(15)<0 THEN PRINT"Darrera el foa`bssil ,veus uns signes  rars :";
1250 IF g1=13 AND g2=15 AND si%(15)<0 THEN 1270
1260 GOTO 1300
1270 FOR j=1 TO sa:PRINT CHR$(203+j);CHR$(205+j);MID$(so$,j,1);
1280 NEXT j:PRINT CHR$(203+j+1);CHR$(204+j+2):REM final coses importants
1290 REM 
1300 PRINT:PRINT"POTS ANAR":PRINT"ÐÐÐÐÐÐÐÐÐ ";
1310 IF VAL(LEFT$(L1$(X),2))>0 THEN PRINT"nord ,";
1320 IF VAL(MID$(L1$(X),3,2))>0 THEN PRINT"sud ,";
1330 IF VAL(MID$(L1$(X),5,2))>0 THEN PRINT"est ,";
1340 IF VAL(MID$(L1$(X),7,2))>0 THEN PRINT"oest ,";
1350 PRINT".":PRINT:PRINT"QUE FAS ...?":PRINT"ÐÐÐÐÐÐÐÐÐÐÐÐ" 
1360 GOSUB 4490:x$=LOWER$(x$)
1370 E=0:FOR J=1 TO LEN(X$):IF MID$(X$,J,1)=" " THEN e=j
1380 NEXT j
1390 IF e=0 THEN e=LEN(x$)+2
1400 IF INSTR(1,x$,"ajuda") THEN 5050
1410 IF INSTR(1,x$,"musica") THEN 5060
1420 REM comprovador de paraules d'accio
1430 g1=0:g2=0
1440 FOR j=0 TO 40
1450 IF RIGHT$(x$,4)=RIGHT$(pa$(j),4) THEN g2=j
1460 IF LEFT$(x$,4)=LEFT$(pa$(j),4) THEN g1=j
1470 NEXT j:t=g1+g2
1480 IF g1=23 THEN g1=27
1490 IF g1=35 OR g1=19 THEN g1=3
1500 IF g1=28 THEN g1=13
1510 IF g1=25 THEN g1=15
1520 IF g1=26 THEN g1=9
1530 IF g1=29 THEN g1=10
1540 IF g1=16 THEN g1=8
1550 IF g1=24 THEN g1=17 
1560 IF g1=11 AND g2=11 THEN PRINT"ESTAS PORTANT :":PRINT"ÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐ ";:G2=1:GOTO 1580
1570 GOTO 1640
1580 tm$="":IF din THEN tm$="Diners,"
1590 FOR j=5 TO 40:IF si%(j)=-1 THEN tm$=tm$+(MID$(pa$(j),7))+","
1600 NEXT j:IF mar=1 THEN tm$=tm$+"Tia¡btol Barca,"
1610 IF LEN(tm$)>20 THEN PRINT: PRINT
1620 IF tm$<>"" THEN PRINT (tm$+".") ELSE PRINT"res."
1630 PRINT:FOR j=1 TO 1000:NEXT j:GOTO 460
1640 IF g1=0 AND g2=0 THEN PRINT "No entenc quea`b vol dir "CHR$(34)+x$+CHR$(34):GOTO 460
1650 IF g1>0 AND g2=0 THEN PRINT LEFT$((x$),e);"quea`b ?"
1660 IF g1>0 AND g2=0 THEN GOTO 460
1670 IF g1=0 AND t>0 THEN PRINT "No entenc quea`b vol dir ";CHR$(34);LEFT$((x$),e)CHR$(34):GOTO 460  
1680 '
1690 GOTO 3070
1700 REM a les rutines d'accio
1710 REM dades
1720 REM
1730 l1$(1)="00000207l Pirineu, perdut"
1740 l1$(2)="00000301l Pirineu, perdut"
1750 l1$(3)="00000402l Pirineu, perdut"
1760 l1$(4)="00000503l Pirineu, perdut"
1770 l1$(5)="00000604l Pirineu, perdut"
1780 l1$(6)="00000705l Pirineu, perdut"
1790 l1$(7)="00000106l Pirineu, perdut"
1800 l1$(11)="01211276l bosc"
1810 l1$(12)="02221311l bosc"
1820 l1$(13)="03231412l bosc"
1830 l1$(14)="04241513 la SEU D'URGELL"
1840 l1$(15)="05251614l bosc"
1850 l1$(16)="06261715 BERGA"
1860 l1$(17)="07271816 RIPOLL"
1870 l1$(18)="07281917 OLOT"
1880 l1$(19)="07293018 ROSES"
1890 l1$(21)="11312276l bosc"
1900 l1$(22)="12322321 TREMP"
1910 l1$(23)="13332422l bosc"
1920 l1$(24)="14342523 SOLSONA"
1930 l1$(25)="15352624 CARDONA, davant del castell"
1940 l1$(26)="16362725 MOIA"
1950 l1$(27)="17372826 VIC"
1960 l1$(28)="18382927 GIRONA"
1970 l1$(29)="19399428 PALAMOS"
1980 l1$(30)="93390000 la platja, perdut"
1990 l1$(31)="21413276 LLEIDA"
2000 l1$(32)="22423331l bosc"
2010 l1$(33)="23433432l bosc"
2020 l1$(34)="24443533 CALAF"
2030 l1$(35)="25453634 MANRESA"
2040 l1$(36)="26463735l  bosc"
2050 l1$(37)="27473836l MONTSENY"
2060 l1$(38)="28573937l bosc"
2070 l1$(39)="30570000 la platja, perdut"
2080 l1$(40)="25252525 una sala del castell"
2090 l1$(41)="31514276 FRAGA"
2100 l1$(42)="32524341 BORGES BLANQUES"
2110 l1$(43)="33534442l bosc"
2120 l1$(44)="34544543l bosc"
2130 l1$(45)="35554644 MONTSERRAT"
2140 l1$(46)="36564745 TERRASSA"
2150 l1$(47)="37573946 BADALONA"
2160 l1$(49)="00230000 dintre la cova, magatzem del  bandoler"
2170 l1$(51)="41615276l bosc"
2180 l1$(52)="42625351 MONTBLANC"
2190 l1$(53)="43635452 SANTA CREUS"
2200 l1$(54)="44645553l bosc"
2210 l1$(55)="45655654l bosc"
2220 l1$(56)="46665755 BARCELONA"
2230 l1$(57)="39660000 la platja ,perdut"
2240 l1$(61)="51716276l bosc"
2250 l1$(62)="52726361 CIURANA"
2260 l1$(63)="53736462 VALLS"
2270 l1$(64)="54746563 EL VENDRELL"
2280 l1$(65)="55756664l bosc"
2290 l1$(66)="57750000 la platja, perdut"
2300 l1$(71)="61817276 MORA D'EBRE"
2310 l1$(72)="62827371 FALSET"
2320 l1$(73)="63837472 REUS"
2330 l1$(74)="64939473 TARRAGONA"
2340 l1$(75)="66930000 la platja, perdut"
2350 l1$(81)="71918276 GANDESA"
2360 l1$(82)="72928381l bosc"
2370 l1$(83)="73937582l bosc"
2380 l1$(91)="81009276 TORTOSA"
2390 l1$(92)="82009391 AMPOSTA"
2400 l1$(93)="75300000 la platja, perdut"
2410 l1$(67)="68040000 L'AQUITANIA"
2420 l1$(96)="00670000 ANGLATERRA, a la cort del     rei Ricard"
2430 l1$(97)=" Cor de LLeoa¡b ..."
2440 l1$(68)=l1$(96)+l1$(97)
2450 l1$(76)="00003177l CAMI de SANTIAGO"
2460 l1$(77)="00007600 SANTIAGO DE COMPOSTELA"
2470 l1$(85)="91000000l PAIS VALENCIA"
2480 l1$(94)="00009557 alta mar"
2490 l1$(95)="00000094 MALLORCA, i en arribar : "
2500 REM
2510 REM verbs
2520 REM
2530 pa$(1)="vaig nord"
2540 pa$(2)="      sud"
2550 pa$(3)="signo est"
2560 pa$(4)="     oest"
2570 co$(5)="Que estaa`bs defallint de gana ..."
2580 pa$(6)="menjo bandoler":co$(6)="Un bandoler que t'intenta robar ...":si%(6)=15
2590 pa$(7)="pago   ploma":co$(7)="Una fabulosa ploma xinesa per       escriure ..."
2600 si%(7)=56
2610 pa$(8)="segueix inscripcio":co$(8)="":si%(8)=0
2620 pa$(9)="agafo penya-segat":co$(9)="Un ferea`bstec penya-segat rocoa¡bs ..."
2630 si%(9)=30
2640 co$(37)="Un ferea`bstec penya-segat rocoa¡bs ...":si%(37)=75
2650 pa$(10)="deixo  llibre":co$(10)="Un meravelloa¡bs llibre de versos ...":si%(10)=72
2660 pa$(11)="farcell"
2670 pa$(12)="llegei anell":co$(12)="Un intrigant anell amb una          ametista ...":si%(12)=41
2680 pa$(13)="examino"
2690 pa$(14)="    cofre":co$(14)="Un cofre meravelloa¡bs, tancat"
2700  pa$(15)="pujo   fossil"
2710 co$(15)="Un foa`bssil, dels utilitzats com a    moneda prehistoa`brica ..."
2720 si%(15)=49
2730 pa$(16)="baixo  escala":co$(16)="Una escala de corda ...":si%(16)=46
2740 pa$(17)="mato   basto":co$(17)="Un bastoa¡b de noguera, amb el puny    de plata ..."
2750 si%(17)=22
2760 pa$(18)="entro  punyal":co$(18)="Un gran punyal corbat, de plata ..."
2770 si%(18)=53
2780 pa$(19)="firmo  barca":co$(19)="Una bonica barca de pescadors.,      posada a la venda.":si%(19)=29
2790 pa$(20)="       galio":co$(20)="Un magnia¡bfic galioa¡b., en venda.":si%(20)=74
2800 pa$(21)="     torrent" 
2810 pa$(22)="entro  queviures":co$(22)="Uns quants queviures de tota mena ..":si%(22)=35
2820 pa$(23)="destap documents":co$(23)="Uns documents que et presenten ...":si%(23)=68
2830 pa$(24)="assassicova":co$(24)="Una gran cova, amagada ":si%(24)=50
2840 pa$(25)="m'enfilo"
2850 co$(25)="Un torrent de muntanya que te       la direccioa¡b del vent ..."
2860 si%(25)=6
2870 pa$(26)="prenc vall":si%(26)=3
2880 co$(26)="Una grandiosa roca amb una          inscripcioa¡ al costat del cami¡b..."
2890 pa$(27)="obro cova":co$(27)="Una gran cova, amagada per          la vegetacioa¡b ...":si%(27)=23
2900 pa$(28)="observo     "
2910 pa$(29)="abandonsirventes":co$(29)="":si%(29)=0
2920 pa$(30)="descansArondeta":co$(30)="a la teva estimada Arondeta ...":si%(30)=16
2930 pa$(31)="compro Hugh de Mataplana"
2940 co$(31)="al teu conegut Hugh de Mataplana ...":si%(31)=27
2950 pa$(32)="venc Guillem Folch de Cardona"
2960 co$(32)="al teu enemic vital, el Comte de    Cardona ...":si%(32)=40
2970 pa$(33)="escric Bisbe de la seu"
2980 co$(33)="al Bisbe de la Seu, que et demana   el  delme ...":si%(33)=14
2990 pa$(34)="festejocastell"
3000 pa$(35)="rubricbarquer":co$(35)="al barquer de l'Ebre que vol        cobrar ..."
3010 pa$(38)="       barquer":co$(38)="al barquer de l'Ebre que vol        cobrar ..."
3020 si%(35)=91:si%(38)=92
3030 pa$(36)="recito delme"
3040 so$=MID$(l1$(cx%),10):sa=LEN(so$)
3050 cad$="                    ACCIONS POSSIBLES: VAIG SIGNO MENJO PAGO SEGUEIXO AGAFO DEIXO LLEGEIXO EXAMINO PUJO BAIXO MATO ENTRO FIRMO DESTAPO ASSASSINO M'ENFILO PRENC OBRO OBSERVO ABANDONO DESCANSO COMPRO VENC ESCRIC FESTEJO RUBRICO RECITO TREU MUSICA
3060 cad$=SPACE$(10)+cad$:RETURN
3070 REM
3080 REM
3090 REM prohibidora
3100 IF g2=1 AND VAL(LEFT$(l1$(x),2))=0 THEN PRINT"No pots fer-ho":GOTO 460
3110 IF g2=2 AND VAL(MID$(l1$(x),3,2))=0 THEN PRINT"T'ea¡bs impossible":GOTO 460
3120 IF g2=3 AND VAL(MID$(l1$(x),5,2))=0 THEN PRINT"No t'hi empenyis":GOTO 460
3130 IF g2=4 AND VAL(MID$(l1$(x),7,2))=0 THEN PRINT"No pots anar-hi":GOTO 460
3140 REM dinamica  
3150 IF g1=1 AND g2=1 THEN x=VAL(MID$(l1$(x),1,2))
3160 IF g1=1 AND g2=2 THEN x=VAL(MID$(l1$(x),3,2))
3170 IF g1=1 AND g2=3 THEN x=VAL(MID$(l1$(x),5,2))
3180 IF g1=1 AND g2=4 THEN x=VAL(MID$(l1$(x),7,2))
3190 REM diccionari
3200 EI:REM diccionari:agafo i compro
3210 IF g1=9 THEN 3240
3220 IF g1=31 THEN 3300
3230 GOTO 3400
3240 IF g2>18 AND g2<21 THEN PRINT"No et deixen !":GOTO 4180
3250 IF g2=30 OR g2=31 OR g2=32 OR g2=33 OR g2=60 OR g2=35 OR g2=38 THEN PRINT"No et deixa !":GOTO 4180
3260 IF g2=26 OR g2=9 OR g2=24 THEN PRINT"No pots !":GOTO 4180
3270 GOSUB 4830:IF fa>1 THEN PRINT"No pots carrregar tant !":GOTO 4180
3280 FOR j=5 TO 40:IF si%(g2)=x THEN si%(g2)=-1:GOTO 4180
3290 NEXT:PRINT"No hi cap ";RIGHT$(x$,LEN(x$)-e):GOTO 4180
3300 IF din<25 THEN PRINT"No tens prou diners !":GOTO 4180
3310 IF g2=19 THEN PRINT"Es teva !":din=0:mar=1:co$(19)=LEFT$(co$(19),30):si%(19)=29
3320 IF g2=20 THEN PRINT"Es teu !":din=0:mar=1:co$(20)=LEFT$(co$(20),30):si%(20)=74
3330 IF g2=19 OR g2=20 THEN 4180
3340 IF g2=30 OR g2=31 OR g2=32 OR g2=33 OR g2=6 THEN PRINT"No es ven !":GOTO 4180
3350 IF g2=26 OR g2=9 THEN PRINT"No pots !":GOTO 4180
3360 GOSUB 4830:IF fa>1 THEN PRINT"No t'ho pots emportar !":GOTO 4180
3370 FOR j=5 TO 40:IF si%(g2)=x THEN si%(g2)=-1:din=d-25:GOTO 4180
3380 NEXT:PRINT"No hi cap ";RIGHT$(x$,LEN(x$)-e):GOTO 4180
3390 REM deixo i el venc
3400 IF g1=10 THEN 3430
3410 IF g1=32 THEN 3460
3420 GOTO 3550
3430 IF g2=20 OR g2=19 THEN PRINT"Quin pes t'has tret !":din=din+50
3440 FOR j=5 TO 40:IF si%(g2)=-1 THEN si%(g2)=x:GOTO 4180
3450 NEXT:PRINT"No portes cap ";RIGHT$(x$,LEN(x$)-e):GOTO 4180
3460 GOSUB 4830:IF fa<1 THEN PRINT"No tens res per vendre !":GOTO 4180
3470 IF x=11 OR x=12 OR x=13 OR x=15 OR x=21 OR x=23 OR x=32 THEN PRINT"No tens a qui vendre !":GOTO 4120
3480 IF x=33 OR x=36 OR x=38 OR x=43 OR x=44 OR x=51 THEN PRINT"No tens a qui vendre !":GOTO 4180
3490 IF x=54 OR x=5 OR x=82 OR x=83 THEN PRINT"No tens a qui vendre !":GOTO 4180
3500 FOR j=5 TO 40:IF si%(g2)=-1 THEN si%(g2)=x:din=din+10:GOTO 4180
3510 IF mar=1 THEN din=din+50:mar=0
3520 IF RIGHT$(co$(19),2)<>"a." THEN co$(19)=co$(19)+", en venda.":GOTO 4180
3530 IF RIGHT$(co$(20),2)<>"a." THEN co$(20)=co$(20)+", en venda.":GOTO 4180
3540 NEXT:PRINT"No tens cap ";RIGHT$(x$,LEN $(x$)-e):GOTO 4180
3550 REM aqu s'acaben les rutines basiques
3560 REM arondeta
3570 IF g1=34 AND g2<>30 THEN PRINT"No es deixa !":GOTO 4180
3580 IF g1=34 AND x<>16 THEN PRINT"No hi ea¡bs !"
3590 REM roca
3600 IF g1=16 AND g2=26 AND x=3 THEN x=67
3610 IF g1=16 AND g2<>26 THEN PRINT"Quea`b dius que fas ?":GOTO 460
3620 IF g1=12 AND g2<>8 AND g2<>10 THEN PRINT"Quea`b dius ?":GOTO 460
3630 IF g1=12 AND g2=10 AND x<>si%(10) AND si%(10)>0 THEN PRINT"No hi ha cap llibre !"
3640 IF g1=16 AND g2<>26 THEN PRINT"Quea`b dius ?":GOTO 460
3650 IF g1=13 AND g2<>25 AND g2<>11 AND g2<>15 THEN PRINT"Quea`b dius que fas ?":GOTO 460
3660 IF g1=8 AND g2=21 AND x=6 THEN x=14
3670 IF g1=8 AND g2=26 AND x=3 THEN x=67
3680 IF g1=15 AND g2=9 AND x<>30 AND x<>75 THEN PRINT"No hi ha penya-segat"
3690 IF g1=15 AND g2=9 AND x<>30 AND x<>75 THEN 4180
3700 IF g1=15 AND g2=9 AND x=30 THEN x=29
3710 IF g1=15 AND g2=9 AND x=75 THEN x=74
3720 REM vaixells
3730 IF x=94 AND mar=0 OR x=94 AND pb=0 THEN 4950
3740 REM cardona
3750 IF g1=17 AND g2=32 AND x<>40 THEN PRINT"No ea¡s aqui¡b !" 
3760 IF g1=17 AND g2<>32 THEN PRINT"No es deixa":GOTO 4180
3770 IF g1=17 AND si%(17)>0 AND si%(18)>0 THEN PRINT"Amb quea`b ?"
3780 REM mataplana
3790 IF g1=33 AND g2<>29 THEN PRINT"No creus que perds el temps ..."  
3800 IF g1=33 AND g2=29 AND si%(7)>0 OR g1=33 AND si%(7)>0 THEN PRINT"amb quea`b l'escrius ?"
3810 IF g1=3 AND g2=23 AND si%(7)>0 THEN PRINT"Amb quea`b els signes ?"
3820 REM mallorca
3830 IF x=95 THEN 4120
3840 REM anglaterra
3850 IF g1=3 AND g2<>23 THEN PRINT"No volen autoa`bgrafs !"
3860 REM cofre
3870 IF g1=27 AND g2<>14 AND g2<>12 THEN PRINT"No pots !"
3880 IF g1=27 AND g2=14 AND x<>cx% THEN PRINT"No hi ea¡bs !"
3890 REM escalada del castell
3900 IF g1=15 AND g2=34 AND si%(16)=-1 THEN x=40
3910 IF g1=15 AND g2=34 AND x<>40 THEN PRINT"A on vols pujar ?":GOTO 4180
3920 IF g1=15 AND g2=34 AND si%(16)>0 THEN PRINT"No tens cap escala !"
3930 IF g1=15 AND g2<>9 AND g2<>34 AND g2<>19 AND g2<>20 THEN 3950
3940 GOTO 3960
3950 PRINT"No perds una mica el temps ?":GOTO 4180
3960 IF g1=7 THEN IF g2=35 OR g2=38 THEN IF x=91 OR x=92 THEN IF din<1 THEN PRINT"No tens prou ";
3970 IF g1=7 THEN IF g2=35 OR g2=38 THEN IF x=91 OR x=92 THEN IF din<1 THEN PRINT"diners !"
3980 IF x<91 OR x>92 THEN IF g1=7 THEN IF g2=35 OR g2=38  THEN PRINT"No hi ha cap barquer !"
3990 IF g1=7 THEN IF g2=35 OR g2=38 THEN IF x=91 OR x=92 THEN IF din>1 THEN din=0:x=85
4000 IF g1=7 AND g2=36 AND x=14 AND din<1 THEN PRINT"No tens prou diners !"
4010 IF g1=7 AND g2<35 THEN PRINT"No t'ho accepta" 
4020 REM cova
4030 IF g1=22 AND g2=27 AND x=23 THEN x=49
4040 IF g1=22 AND g2<>27 THEN PRINT"A on dius que vas ?"
4050 IF g1=6 AND g2<>22 THEN PRINT"No ea¡bs comestible !":g1=17:g2=33:GOTO 3760
4060 IF g1=6 AND g2=22 AND si%(22)>0 THEN PRINT"No tens queviures !":GOTO 4180
4070 IF g1=12 AND g2=10 AND si%(10)>0 THEN PRINT"No arribes a veure'l !"
4080 REM anell
4090 IF g1=27 AND g2=12 AND si%(12)=x THEN PRINT"Peroa`b si no el tens !"
4100 IF g1=36 AND g2<>29 THEN PRINT"Quea`b dius que recites ?"
4110 IF g1=36 AND g2<>29 THEN PRINT"Estaa`sb perdent el temps."
4120 IF g1=15 AND g2=19 AND mar=0 THEN PRINT"No et deixen ,perquea` no e¡bs teva"
4130 IF g1=15 AND g2=20 AND mar=0 THEN PRINT"No et deixen ,perquea` no e¡bs teu"
4140 IF g1=13 AND g2=15 AND si%(15)>0 THEN PRINT"No el tens a l'abast"
4150 IF g1=27 AND g2<>12 AND g2<>14 THEN 4170
4160 GOTO 4180
4170 PRINT"Ets un males mans d'intencions, peroa`b no pots destapar-ho !"
4180 REM
4190 REM traba 
4200 GOSUB 5090
4210 IF g1=1 THEN 400
4220 PRINT"===================================="
4230 GOTO 490
4240 REM 
4250 REM preguntes
4260 REM
4270 |VOLUME,0,0,0:|MUSICON,3,&8170-2,&8170+83:FOR silo= 0 TO 10:KEY silo,"":|VOLUME,SILO+2,SILO,0:NEXT:PRINT:IF d=11 THEN 4330
4280 IF d=17 THEN 4350
4290 IF d=24 THEN 4370
4300 IF d=29 THEN 4400
4310 IF d=33 THEN 4420
4320 GOTO 460
4330 PRINT:PRINT"Et trobes una noia i et pregunta:":PRINT" Saps informaa`ticab ?"
4340 d1=1:GOTO 4440
4350 PRINT:PRINT"Et trobes un monjo i et pregunta:":PRINT" En quea`b treballes ?"
4360 d1=1:GOTO 4440
4370 PRINT:PRINT"Et trobes un soldat que et pregunta:":PRINT" Quina feina ";
4380 PRINT"t'agradaria fer ?"
4390 d1=1:GOTO 4440
4400 PRINT:PRINT"Et trobes un vagabund i et pregunta:":PRINT" Quina edat tens ?"
4410 d1=1:GOTO 4440
4420 PRINT:PRINT"Et trobes un poeta que et pregunta:":PRINT" Quea`b estudis tens ?"
4430 d1=1:GOTO 4440
4440 PRINT:PRINT"Quea`b contestes ?":d2=1:GOSUB 4490:d2=1
4450 IF LEFT$(x$,2)="si" THEN ni=3
4460 p$=p$+x$
4470 PRINT"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
4480 GOSUB 5080:RETURN
4490 REM get important
4500 x$="":PRINT"b>";
4510 x1$=""
4520 IF d2=1 THEN PRINT" ";
4530 IF d2=0 THEN INK 0,15
4540 IF d2=3 THEN INK 0,24
4550 IF d2=1 THEN INK 1,1
4560 IF INKEY$<>"" THEN 4560
4570 GOSUB 5230:x1$=INKEY$:IF x1$="" THEN 4570
4580 sc=ASC(x1$):IF sc>128 THEN 4570
4590 sl=LEN(x$):IF sl>34 THEN 4610
4600 IF sc>31 AND SC<>127 THEN x$=x$+x1$:PRINT"" x1$">";:|MUSICOFF:SOUND 1,400,6,12,1,1,25:GOTO 4570
4610 IF sc=127 AND sl>0  THEN x$=LEFT$(X$,SL-1):PRINT">";:SOUND 1,100,8,12,1,1,25:GOTO 4570
4620 IF sc=13 THEN PRINT"":GOSUB 5010:RETURN
4630 GOTO 4530
4640 REM ensambladora
4650 |VOLUME,12,10,0:|MUSICON,1,&8230-2,&8230+111:CLS:INK 0,24:INK 1,0:PRINT TAB(3)"L'enhorabona! Has trobat el que     cercaves:":PRINT
4660 PRINT TAB(3)" EL COFRE i el seu contingut ...":PRINT:PRINT"  ea¡bs un missatge ";
4670 PRINT"codificat que diu:":PRINT
4680 PRINT TAB(2)CHR$(34)MID$(l1$(x),10)(d+1100);so;
4690 FOR j=1 TO LEN(p$)
4700 IF p$="" THEN p$=" "
4710 p1%=ASC(MID$(p$,j,1))+5
4720 PRINT CHR$(p1%);
4730 NEXT j:PRINT CHR$(34):PRINT
4740 PRINT TAB(9)"Fes-ho saber al :"
4750 PRINT:PRINT"CENTRE DIVULGADOR  DE LA INFORMATICA";
4760 PRINT"ÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐÐ" 
4770 PRINT TAB(6)"GENERALITAT  DE  CATALUNYA"
4780 PRINT TAB(6)"Apartat de correus 5185":PRINT TAB(12)"Barcelona":PRINT
4790 PRINT"escrivint el missatge, el teu nom i adreca,a. Gra`cies.b  "
4800 INK 0,3,15:INK 1,15,3:FOR a=0 TO 10000:NEXT:PRINT
4810 GOTO 4980
4820 REM farcell
4830 fa=0:FOR j=5 TO 40:IF si%(j)=-1 THEN fa=fa+1
4840 NEXT
4850 IF mar=1 THEN fa=1
4860 RETURN
4870 REM robatori
4880 PRINT"i que t'ho roba tot.":ba=0
4890 FOR j=5 TO 40   
4900 IF si%(J)<0 THEN si%(j)=49
4910 NEXT j:si%(6)=si%(6)+1:din=0:RETURN
4920 REM la mort
4930  OUT &BC00,8:OUT &BD00,1:PRINT"I en no portar queviures t'has mort de gana.":PRINT"Ho sento.":PRINT
4940 GOTO 4970
4950 REM ofegada
4960 OUT &BC00,8:OUT &BD00,1:PRINT"T'HAS OFEGAT.":PRINT"Ho sento.":GOTO 4970
4970 |VOLUME,12,0,0:|MUSICON,4,&8340-2:REM final
4980 FOR SILO=0 TO 3000:NEXT:PRINT"Si vols reiniciar el joc pren una   tecla qualsevol."
4990 t$=INKEY$:IF t$="" THEN 4990
5000 INK 0,24:INK 1,0:GOSUB 5090:OUT &BD00,0:CLEAR:CLS:fl=0:GOSUB 5250:|PAUSE:RUN 50
5010 |MUSICOFF:DI:PRINT "":SOUND 1,100,10,12
5020 FOR j=0 TO 1000 STEP 20
5030 SOUND 1,j,1,12:NEXT
5040 EI:RETURN
5050 WINDOW #1,2,41,25,25:PEN #1,0:PAPER #1,1:CLS#1:FOR a=1 TO 217:PRINT #1," "+MID$(cad$,a,38);:FOR b=0 TO 20:NEXT:NEXT:FOR a=1 TO 38:PRINT#1, RIGHT$(cad$,39-a)+SPACE$(a-1);::FOR b=0 TO 20:NEXT:NEXT:PAPER #1,0:CLS#1:GOTO 4220
5060 IF INSTR(1,x$,"treu") THEN xx=0 ELSE xx=1
5070 GOTO 4220
5080 KEY 1,"vaig oest"+CHR$(13):KEY 2,"vaig sud"+CHR$(13):KEY 3,"vaig est"+CHR$(13):KEY 4,"farcell"+CHR$(13):KEY 5,"vaig nord"+CHR$(13):KEY 6,"ajuda"+CHR$(13):KEY 7,"agafo ":KEY 9,"deixo ":KEY 8,"pujo ":RETURN
5090 DI:IF mu=1 THEN GOSUB 5230 
5100 IF x=30 OR x=39 OR x=57 OR x=66 OR x=75 OR x=93 THEN fl=1 ELSE FL=0
5110 IF x>7 THEN xp=(10*(x/10-x\10)-1)*32+9:yp=(x\10)*-26+304:st=29 ELSE xp=9:yp=304:st=316
5120 IF fl XOR mo THEN GOSUB 5240
5130 IF x=49 THEN xp=78:yp=252:st=19
5140 IF x=67 THEN xp=199:yp=330:st=94
5150 IF x=68 THEN xp=185:yp=358:st=120
5160 IF x=76 THEN xp=89:yp=334:st=68
5170 IF x=85 THEN xp=9:yp=18
5180 IF x=94 THEN xp=233:yp=96
5190 IF x=95 THEN xp=297:yp=70
5200 IF x=77 THEN xp=12:yp=358:st=100
5210 IF x=40 THEN xp=142:yp=252:st=19
5220 RETURN
5230 PRINT#2,""+CHR$(1+mo):MOVE xp,yp:FOR a=0 TO 11:DRAWR st,0:MOVER -st,2:NEXT:mu=1 XOR mu:RETURN
5240 MO=1 XOR MO:PRINT#2,"A":MOVE 73,70:FOR b=1 TO 8:FOR a=0 TO 11:DRAWR st,0:MOVER -st,2:NEXT:MOVER 32,2:NEXT:MOVER -32,0:FOR a=0 TO 11:DRAWR st,0:MOVER -st,2:NEXT:RETURN
5250 IF mu=1 THEN PRINT#2,""+CHR$(1+mo):MOVE xp,yp:FOR a=0 TO 11:DRAWR st,0:MOVER -st,2:NEXT:mu=1 XOR mu:RETURN 
5260 IF mo=1 THEN PRINT#2,"A":MOVE 73,70:FOR b=1 TO 8:FOR a=0 TO 11:DRAWR st,0:MOVER -st,2:NEXT:MOVER 32,2:NEXT:MOVER -32,0:FOR a=0 TO 11:DRAWR st,0:MOVER -st,2:NEXT:RETURN
5270 RETURN
5280 MODE 0:PRINT:PRINT"** ERROR   EXTERN **

     DESCONECTAR         PERIFERIC":FOR A=0 TO 800:NEXT:CALL 0
LEM6$$$ÿ ÿ
     DESCONECTAR         PERIFERIC"ž   Áï ì  °ƒ    AT$$$ÿ ÿen press ENTER ",  éË"TRANSMAT.BAS",  ð