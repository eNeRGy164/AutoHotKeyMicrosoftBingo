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
	; First Row
	MouseClick, Left, 950, 560, 1, 0
	MouseClick, Left, 1350, 560, 1, 0

	; Second Row
	MouseClick, Left, 950, 1030, 1, 0
	MouseClick, Left, 1350, 1030, 1, 0
	Return
}

^b::      ; Ctrl+B AutoDaubt
{
	SpaceX := 75, SpaceY := 65

	; First row
	DaubtCard(805, 225, SpaceX, SpaceY)
	DaubtCard(1225, 225, SpaceX, SpaceY)
	
	; Second row
	DaubtCard(805, 700, SpaceX, SpaceY)
	DaubtCard(1225, 700, SpaceX, SpaceY)

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
		
		IsRed := (Red == "C" and Green == "2" and Blue == "0")
		IsGreen := (Red == "6" and Green == "C" and Blue == "2")
		IsWhite := (Red == "F" and Green == "F" and Blue == "F")

		If (!IsRed and !IsGreen and !IsWhite)
		{
			MouseClick, Left, %TileX%, %TileY%, 2, 0
		}
	}
	Else
	{
		MouseClick, Left, %TileX%, %TileY%, 2, 0
	}
}