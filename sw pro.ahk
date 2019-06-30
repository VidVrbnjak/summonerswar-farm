colectX=0
colectY=0
end=0
afk=1000
shopAfk=3000
n=20


replayX = 600
replayY = 580


picPath=D:\github\summonerswar\pics\			;CHANGE

;-----------------------------------Dragon-------------------------------------------
!d::

;Pics name
replay 	= dReplay.png
fail 	= dFail.png
shop 	= shop.png

Function(picPath, replay, shop, fail)

return
;-------------------------------Dimensional Hole-------------------------------------
!h:: 

;Pics name
replay 	= hReplay.png
fail 	= hFail.png

Function(picPath, replay, shop, fail)

return


;---------------------------------FUNCTION------------------------------------------
Function(picPath, replay, shop, fail){

	WinGetPos, , , winX, winY, A
	colectX := winX*0.522
	colectY := winY*0.7984
	
	replayX := winX*0.3125
	replayY := winY*0.5577
	
	failX := winX*0.625
	failY := winY*0.6538
	
	MsgBox,64 ,No Shit,  SCRIPT ACTIVE , 1.5
	sleep, 1600

loop {
	if(end=0){
		sleep, delay
		end++
	}
	
	sleep, afk
	ImageSearch, failX, failY, 0, 0, 1920, 1080,*%n% %picPath%%fail%
	if(ErrorLevel = 1){
		sleep, 100
		ImageSearch, x, y, 0, 0, 1920, 1080, *%n% %picPath%%replay%
		sleep, 100
		if(ErrorLevel = 1){
			MouseClick, left, colectX, colectY
		}
		else
		{
			end--
			MouseClick, left, replayX, replayY
			sleep, afk
			ImageSearch, shopX, shopY, 0, 0, 1920, 1080,*%n% %picPath%%shop%
			sleep, 100
			if(ErrorLevel = 1){
			
			}
			else{
				if(refil=0){
					Send, {Alt down}
					sleep, afk
					Send, {F4}
					sleep, afk
					Send, {Alt up}
					sleep, afk
					MouseClick, left, 300, 160		;ok (for exit of nox)
					sleep, afk
					CoordMode, Mouse, Screen
					MouseClick, left, 0, 1070		;start button
					sleep, afk
					MouseClick, left, 20, 1010		;power off menu
					sleep, afk
					MouseMove, 60, 930		;shut down
					sleep, afk
					CoordMode, Mouse, Window 
					ExitApp
				}
				else{
				MouseClick, left, shopX, shopY
				sleep, afk
				MouseClick, left, 800, 650		;max energy
				sleep, afk
				MouseClick, left, 800, 650		;yes
				sleep, shopAfk
				MouseClick, left, 860, 650		;ok
				sleep, afk
				MouseClick, left, 930, 900		;close
				sleep, afk
				MouseClick, left, replayX, replayY
				
				refil--
				sleep, afk
				}
			}
		}
	}
	else{
		sleep, 100
		MouseClick, left, failX, failY
		;MouseClick, left, 1200, 700			;dimensional rift
		sleep, afk
		MouseClick, left, colectX, colectY
		sleep, afk
		MouseClick, left, 600, 580
		sleep, afk
		
		ImageSearch, shopX, shopY, 0, 0, 1920, 1080,*%n% %picPath%%shop%
			sleep, 100
			if(ErrorLevel = 1){
			
			}
			else{
				if(refil=0){
					Send, {Alt down}
					sleep, afk
					Send, {F4}
					sleep, afk
					Send, {Alt up}
					sleep, afk
					MouseClick, left, 300, 160		;ok (for exit of nox)
					sleep, afk
					CoordMode, Mouse, Screen
					MouseClick, left, 0, 1070		;start button
					sleep, afk
					MouseClick, left, 20, 1010		;power off menu
					sleep, afk
					MouseMove, 60, 930		;shut down
					sleep, afk
					CoordMode, Mouse, Window 
					ExitApp
				}
				else{
				MouseClick, left, shopX, shopY
				sleep, afk
				MouseClick, left, 800, 650		;max energy
				sleep, afk                
				MouseClick, left, 800, 650		;yes
				sleep, shopAfk                
				MouseClick, left, 860, 650		;ok
				sleep, afk                
				MouseClick, left, 930, 900		;close
				sleep, afk
				MouseClick, left, 600, 580
				
				refil--
				sleep, afk
				}
			}
		
		sleep, afk
		MouseClick, left, 1600, 750
	}
	
}

}
	


Esc::
Reload
ExitApp
return



