; Tested on Windows 8.1, 1920x1080, 100% Scale with no ads

; Check the color of the tile before clicking it twice, this is slower on empty boards, but will gain speed later on
UseColorCheck := true

Escape:: ExitApp ; Escape to exit
^p::Pause ; Ctrl+P Pause

; Ctrl+O to click on the power up button
^o::
{
	MouseClick, Left, 1845, 300, 1, 0
	Return
}

; Ctrl+D to click on the Bingo buttons
^d::
{
	MouseClick, Left, 880, 420, 1, 0
	MouseClick, Left, 1165, 420, 1, 0
	MouseClick, Left, 1445, 420, 1, 0

	MouseClick, Left, 880, 740, 1, 0
	MouseClick, Left, 1165, 740, 1, 0
	MouseClick, Left, 1445, 740, 1, 0

	MouseClick, Left, 880, 1050, 1, 0
	MouseClick, Left, 1165, 1050, 1, 0
	MouseClick, Left, 1445, 1050, 1, 0
	Return
}

^b::      ; Ctrl+B AutoDaubt
{
	SpaceX := 50, SpaceY := 41

	; Coordinate seeds need to be in the center of the tile for ColorCheck to work correctly.
	; First row
	DaubtCard(785, 195, SpaceX, SpaceY)
	DaubtCard(1065, 195, SpaceX, SpaceY)
	DaubtCard(1345, 195, SpaceX, SpaceY)
	
	; Second row
	DaubtCard(785, 510, SpaceX, SpaceY)
	DaubtCard(1065, 510, SpaceX, SpaceY)
	DaubtCard(1345, 510, SpaceX, SpaceY)
	
	; Third row
	DaubtCard(785, 825, SpaceX, SpaceY)
	DaubtCard(1065, 825, SpaceX, SpaceY)
	DaubtCard(1345, 825, SpaceX, SpaceY)

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
	}
}

Daubt(TileX, TileY)
{
	Global UseColorCheck

	If (UseColorCheck = true) 
	{
		PixelGetColor, Color, %TileX%, %TileY%, RGB

		Red := SubStr(Color, 3, 1), Green := SubStr(Color, 5, 1), Blue := SubStr(Color, 7, 1)
		
		; IsRed := (Red == "C" and Green == "2" and Blue == "0")
		; IsGreen := (Red == "6" and Green == "C" and Blue == "2")
		; IsWhite := (Red == "F" and Green == "F" and Blue == "F")

		If (!(Red == "C" and Blue == "0") and	; If it is not Red
			!(Red == "6" and Blue == "2") and	; and not Green
			!(Red == "F" and Blue == "F"))		; and not White
		{
			MouseClick, Left, %TileX%, %TileY%, 2, 0
		}
	}
	Else
	{
		MouseClick, Left, %TileX%, %TileY%, 2, 0
	}
}
