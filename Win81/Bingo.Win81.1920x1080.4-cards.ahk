; Tested on Windows 8.1, 1920x1080, 100% Scale

UseColorCheck := false

^p::Pause ; Ctrl+P Pause
^b::      ; Ctrl+B AutoDaubt
{
	SpaceX := 76, SpaceY := 62

	DaubtCard(660, 212, SpaceX, SpaceY)
	DaubtCard(1080, 212, SpaceX, SpaceY)
	DaubtCard(660, 684, SpaceX, SpaceY)
	DaubtCard(1080, 684, SpaceX, SpaceY)

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
