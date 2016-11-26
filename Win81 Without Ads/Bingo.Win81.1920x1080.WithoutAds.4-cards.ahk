; Tested on Windows 8.1, 1920x1080, 100% Scale with no ads
; Escape will exit the app

UseColorCheck := false
KeepRunning := false

Escape:: ExitApp ; Escape to exit
^p::Pause ; Ctrl+P Pause

^b::      ; Ctrl+B AutoDaubt
if KeepRunning  ; This means an underlying thread is already running the loop below.
{
    KeepRunning := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
KeepRunning := true
{
	SpaceX := 76, SpaceY := 62

	; First row
	DaubtCard(780, 210, SpaceX, SpaceY)
	DaubtCard(1200, 210, SpaceX, SpaceY)
	
	; Second row
	DaubtCard(780, 680, SpaceX, SpaceY)
	DaubtCard(1200, 680, SpaceX, SpaceY)

	Return
}

DaubtCard(CardX, CardY, SpaceX, SpaceY) 
{
	X := CardX, Y := CardY

	MouseMove, %X%, %Y%, 0

	Loop, 5
	{
		DaubtColumn(X, Y, SpaceY, A_Index)

		If (A_Index < 5) {
			X += SpaceX
			MouseMove, %X%, %Y%, 0
		}
		
		if not KeepRunning  ; The user signaled the loop to stop by pressing Win-Z again.
			break  ; Break out of this loop.
	}
}

DaubtColumn(ColumnX, ColumnY, SpaceY, Column)
{
	Daubt(ColumnX, ColumnY)

	Loop, 4
	{
		ColumnY += SpaceY
		MouseMove, %ColumnX%, %ColumnY%, 0

		If (!(Column = 3 and A_Index = 2))
		{
			Daubt(ColumnX, ColumnY)
		}
		
		if not KeepRunning  ; The user signaled the loop to stop by pressing Win-Z again.
			break  ; Break out of this loop.
	}
}

Daubt(TileX, TileY)
{
	Global UseColorCheck

	If (UseColorCheck = true) 
	{
		PixelGetColor, Color, %TileX%, %TileY%, RGB

		Red := SubStr(Color, 3, 2), Blue := SubStr(Color, 7, 2)

		If (!(Red == "CC" and Blue == "00") and !(Red == "FF" and Blue == "FF"))
		{
			MouseClick, Left, %TileX%, %TileY%, 2, 0
		}
	}
	Else
	{
		MouseClick, Left, %TileX%, %TileY%, 2, 0
	}
}