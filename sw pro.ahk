/*

	ALT+D za dragon farmo
	ALT+H za dimensional hole


*/
end=0
afk=1000
n=50


numOfRuns = -1									;kolk runov ( -1 za izklop )
refil = 1										;kolk refilov 
exitNox = 0										;0=false  1=true
shutDown = 0									;0=false  1=true
delay = 0										;(2min20 v ms)		140000

picPath = D:\github\summonerswar\pics\			;CHANGE


;-----------------------------------Doungeon-------------------------------------------
!d::

;Pics name
replay 	= dReplay.png
fail 	= dFail.png
shop 	= shop.png

Function()

return
;-------------------------------Dimensional Hole-------------------------------------
!h::

;Pics name
replay 	= hReplay.png
fail 	= hFail.png

Function()

return


;---------------------------------FUNCTION------------------------------------------
Function(){
	global
	
	WinGetPos, , , winX, winY, A
	colectX := winX*0.522
	colectY := winY*0.7984

	replayX := winX*0.3125
	replayY := winY*0.5577

	failX := winX*0.625
	failY := winY*0.6538

	MsgBox,64 ,No Shit,  SCRIPT ACTIVE , 1.5

	loop 
	{
		if(end=0){
			sleep, delay
			end++
		}
	
		sleep, afk
		ImageSearch, x, y, 0, 0, winX, winY,*%n% %picPath%%fail%
		sleep, 100
		if(ErrorLevel = 0){
			MouseClick, left, failX, failY
			sleep, afk
			MouseClick, left, colectX, colectY
			sleep, afk
			MouseClick, left, 600, 580
			sleep, afk
	
			ImageSearch, shopX, shopY, 0, 0, winX, winY,*%n% %picPath%%shop%
				sleep, 100
				if(ErrorLevel = 0){
					if(refil=0){
						exitFunc(exitNox, shutDown, afk)
					}
					else{
						shopFunc()
					}
				}
			sleep, afk
			MouseClick, left, 1600, 750
		}
		
		else if(ErrorLevel = 1){
			ImageSearch, x, y, winX*0.234 , winY*0.432 , winX*0.416, winY*0.673, *%n% %picPath%%replay%
			sleep, 100
			if(ErrorLevel = 1){
				MouseClick, left, colectX, colectY
			}
			else
			{
				end--
				MouseClick, left, replayX, replayY
				sleep, afk
				ImageSearch, shopX, shopY, 0, 0, winX, winY,*%n% %picPath%%shop%
				sleep, 100
				if(ErrorLevel = 0){
					if(refil=0){
						exitFunc(exitNox, shutDown, afk)
					}
					else{
						shopFunc()
					}
				}
			}
		}
		
		else if(ErrorLevel = 2){
			
			MsgBox,64 ,No Shit,  WTF , 1.5
			sleep, 2000
			
		}
	
	}
	
}

exitFunc(exitNox, shutDown, afk){
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
MouseClick, left, winX*0.313 , winY*0.558		;replay

refil--
sleep, afk
}



Esc::
Reload
ExitApp
return

/*


replay dime hole	520 545 do 680 610
replay dragon		520 545 do 680 610
replay giant
replay necro
replay elemental
replay scenario

fail dime hole	
fail dragon		
fail giant
fail necro
fail elemental
fail scenario



*/









