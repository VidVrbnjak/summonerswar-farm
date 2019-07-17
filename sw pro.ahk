/*	to do list:	
	-chack how many refils before quiz
	-sell useless runes - sw exporter
---------------------------------------------------------------------------------------------------------------------------------------------------------
	;faildata.txt Logs of fails and runes at the end
	;CHANGE picPath, replay, fail, shop

	ALT+D  		Doungeon farm
	ALT+H  		Dimensional hole farm
	ALT+S  		Scenario farm
	ALT+E 		Essence farm (Hall of elements)
	SHIFT+ESC	Exit with farm logs
	ESC			Restart
*/ 
;(dont put anything before *./)
 
collectXAdj = 0
collectYAdj = 0
failCount = 0
refilCount = 0
numOfReplays=0
end=0
n=50
afk=1000

;----------------------------------- OPTIONS ---------------------------------------------------------------------------------------------------------------
run = -1										;num of runs 	( -1 -> Turn off )
refil = 5										;num of refils 	( -1 -> Turn off (ce uporablas run lahk pa tut oboje))
exitNox = 0										;0=false  1=true	(at the end exit noxplayer)
shutDown = 0									;0=false  1=true	(at the end shut down PC)
delay = 140000									;(Delay at star of each run in miliseconds)		my=140000

picPath = D:\github\summonerswar\pics\			;CHANGE path (no name of img) end with \
shop 	= shopx.png								;Change name
replay 	= replayx.png							;Change name
fail 	= failx.png								;Change name
prepare	= prepare.png								;Change name


;--------------------------------- Doungeon ----------------------------------------------------------------------------------------------------------------
!d::
typeOfScript = DUNGEON
FormatTime, currentTime
FileAppend, `n%currentTime% Doungeon run started. Num of refils=%refil% and/or runs=%run%`n, %picPath%faildata.txt
Function()
return
;---------------------------------- Dimensional Hole ----------------------------------------------------------------------------------------------------------------
!h::
typeOfScript = DIMENSIONAL HOLE
FormatTime, currentTime
FileAppend, `n%currentTime% Dimensional hole run started. Num of runs=%run%n, %picPath%faildata.txt
Function()
return
;---------------------------------- Scenario ---------------------------------------------------------------------------------------------------------------------
!s::
collectXAdj=-0.1
typeOfScript = SCENARIO

FormatTime, currentTime
FileAppend, `n%currentTime% Scenario run started. Num of refils=%refil% and/or runs=%run%`n, %picPath%faildata.txt
Function()
return
;---------------------------------- Hall of elements ---------------------------------------------------------------------------------------------------------------------
!e::
collectXAdj = -0.027
collectYAdj = 0.048
typeOfScript = SCENARIO

FormatTime, currentTime
FileAppend, `n%currentTime% Scenario run started. Num of refils=%refil% and/or runs=%run%`n, %picPath%faildata.txt
Function()
return


;----------------------------------Function----------------------------------------------------------------------------------------------------------------
Function(){
	global
	
	WinGetPos, , , winX, winY, A
	colectX := winX*(0.522+collectXAdj)
	colectY := winY*(0.798+collectYAdj)

	replayX := winX*0.3125
	replayY := winY*0.5577

	failX := winX*0.625
	failY := winY*0.6538

	MsgBox,64 ,No Shit, %typeOfScript% SCRIPT ACTIVE , 1.5

	loop 
	{
		if(end=0){
			sleep, delay
			end++
		}
	
		sleep, afk
		ImageSearch, x, y, winX*0.594, winY*0.615, winX*0.672, winY*0.711, *%n% %picPath%%fail%
		sleep, 100
		if(ErrorLevel = 0){
			FormatTime, currentTime, ,Time
			failCount++
			numOfReplays++
			FileAppend, %currentTime% - U fail %failCount%. at %numOfReplays% run `n, %picPath%faildata.txt
			
			end--
			run--
			MouseClick, left, failX, failY
			sleep, afk
			MouseClick, left, colectX, colectY
			sleep, afk
			MouseClick, left, winX*0.313 , winY*0.558
			sleep, afk
	
			ImageSearch, shopX, shopY, winX*0.338, winY*0.528, winX*0.49, winY*0.71,*%n% %picPath%%shop%
				sleep, 100
				if(ErrorLevel = 0){
					if(refil=0){
						break
					}
					else{
						shopFunc()
					}
				}
			sleep, afk
			MouseClick, left, winX*0.834, winY*0.721
		}
		
		else if(ErrorLevel = 1){
			ImageSearch, sellOkX, sellOkY, winX*0.338, winY*0.528, winX*0.49, winY*0.71,*%n% %picPath%%runeSell%
			if(ErrorLevel = 0){
				MouseClick, left, sellOkY, sellOkY	
			}			
			
			ImageSearch, x, y, winX*0.234 , winY*0.432 , winX*0.416, winY*0.673, *%n% %picPath%%replay%
			sleep, 100
			if(ErrorLevel = 1){
				MouseClick, left, colectX, colectY
			}
			else
			{
				end--
				run--
				numOfReplays++
				MouseClick, left, replayX, replayY
				sleep, afk
				ImageSearch, shopX, shopY, winX*0.338, winY*0.528, winX*0.49, winY*0.71,*%n% %picPath%%shop%
				sleep, 100
				if(ErrorLevel = 0){
					if(refil=0){
						break
					}
					else{
						shopFunc()
					}
				}
			}
		}
		
		else if(ErrorLevel = 2){
			
			MsgBox,64 ,No Shit, IMAGE WAS NOT FOUND CHECK PATH, NAME AND TYPE OF FILE(e.g - .PNG)
			break
			
		}
		
		if(run=0)
		{
			break
		}
	
	}
	
	FormatTime, currentTime, ,Time
	FileAppend, %currentTime% - Script ended after %numOfReplays% runs and %refilCount% refils`n, %picPath%faildata.txt
	sleep, afk
	
	if(exitNox = 1){
	Send, {Alt down}
	sleep, afk
	Send, {F4}
	sleep, afk
	Send, {Alt up}
	sleep, afk
	MouseClick, left, 300, 160		;ok (for exit of nox)
	sleep, afk
	}

	if(shutDown = 1){
	CoordMode, Mouse, Screen
	MouseClick, left, 0, 1070		;start button
	sleep, afk
	MouseClick, left, 20, 1010		;power off menu
	sleep, afk
	MouseClick, left, 60, 930		;shut down
	sleep, afk
	}
	
	ExitApp
	
}

shopFunc(){
global

MouseClick, left, shopX, shopY
sleep, afk
MouseClick, left, winX*0.417 , winY*0.625		;max energy
sleep, afk
MouseClick, left, winX*0.417, winY*0.625		;yes
sleep, afk*3									;rabi mal vec sleepa
MouseClick, left, winX*0.448 , winY*0.625		;ok
sleep, afk
MouseClick, left, winX*0.484 , winY*0.865		;close
sleep, afk
quizCounter=0
loop 5{
;dodaj prepare
	ImageSearch, x, y, winX*0.234 , winY*0.432 , winX*0.416, winY*0.673, *%n% %picPath%%replay%
	if(ErrorLevel = 0){
		MouseClick, left, winX*0.313 , winY*0.558		;replay
		break
	}
	
	ImageSearch, x, y, winX*0.234 , winY*0.432 , winX*0.416, winY*0.673, *%n% %picPath%%prepare%
	if(ErrorLevel = 0){
		MouseClick, left, replayX, replayY
		sleep, afk
		MouseClick, left, winX*0.313 , winY*0.558
		sleep, afk
		break
	}
	quizCounter++
	sleep, afk
}
if(quizCounter>4){
	run=0
	FileAppend, quiz hapend after %refilCount% refils `n, %picPath%faildata.txt
	refilCount--
}
refilCount++
refil--
sleep, afk
}


Esc::
Reload
ExitApp
return

+Esc::
FormatTime, currentTime, ,Time
FileAppend, %currentTime% - Script ended after %numOfReplays% runs and %refilCount% refils`n, %picPath%faildata.txt
ExitApp
return


/*


replay imgsrch 		520 545 do 680 610


fail dime hole	
fail dragon			1170 660 do 1260 720
fail giant
fail necro
fail elemental
fail scenario		1170 660 do 1260 720

shop	650 550 do 940 730

------------------------------------------------------------
sell rune 		690	790		920 890
item			840 820 	1070 910
(magic)esenc	840 855		1070 955
ok after sell 	850 670		border 680 590		910 680

sell rune(scenario) autoclick 860 850
rune sell ok	850 670  (where to imgsrch 650 550	920 720)


950, 880		;magic farm autoclick


quiz 850 95  940 140
820 70		1000 190 

*/







