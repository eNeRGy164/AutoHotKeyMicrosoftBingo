; Tested on Windows 8.1, 1920x1080, 100% Scale

^p::Pause ; Ctrl+P Pause
^b::      ; Ctrl+B AutoDaubt
{
	DaubtCard(660, 212, 76, 62)
	DaubtCard(1080, 212, 76, 62)
	DaubtCard(660, 684, 76, 62)
	DaubtCard(1080, 684, 76, 62)

	Return
}

DaubtCard(CardX, CardY, SpaceX, SpaceY) 
{
	X := CardX
	Y := CardY

	MouseMove, %X%, %Y%, 0

	Loop, 5
	{
		DaubtColumn(X, Y, SpaceY)

		If (A_Index < 5) {
			X += SpaceX
			MouseMove, %X%, %Y%, 0
		}
	}
}

DaubtColumn(ColumnX, ColumnY, SpaceY)
{
	Daubt(ColumnX, ColumnY)

	Loop, 4
	{
		ColumnY += SpaceY
		MouseMove, %ColumnX%, %ColumnY%, 0
		Daubt(ColumnX, ColumnY)
	}
}

Daubt(TileX, TileY)
{
	PixelGetColor, color, %TileX%, %TileY%, RGB

	Red := SubStr(color, 3, 2)
	Blue := SubStr(color, 7, 2)

	If (!(Red == "CC" and Blue == "00") and !(Red == "FF" and Blue == "FF"))
	{
		MouseClick, Left, %TileX%, %TileY%, 2, 0
	}
}
