# AutoHotKey Microsoft Bingo Scripts
Inspired by KinectKid333's script he posted at TrueAchievements (http://www.trueachievements.com/forum/viewthread.aspx?tid=732469) I went a step further and enhanced the script.

Features:
- CTRL+B starts the auto-daub
- CTRL+P pauses and resumes the script
- Checks if a tile is already daubed and skips it

## New Windows 10 scaled cards version
The new version of Microsoft Bingo on Windows 10 uses "scaled cards". This makes the scripts much easier because the size is now the same no matter how many cards you play.

- Load the script with the amount of card you want to daup
- Make sure the DaubtFunctions.ahk is in the same folder

## Windows 8.1 & Windows 10 older version
I tested the scripts using Windows 8.1 on Hyper-V and Windows 10 native at a resolution of 1920x1080.
For Windows 10 the game must be in full screen mode.

To quickly create your own version: 
- Make as screenshot of your desired layout (CTRL+PrntScrn)
- Paste the into Paint
- Move the cursor just above the center of the number in the top-left corner, in the system bar you will see the X and Y for that card
- Move the cursor the the same center position above the number to the right. Substruct that of the X you got the first time. This will by your horizontal spacing.
- Do the same as above, but now for the number below the first one. This will give you the vertical spacing.
- With these numbers you can autodaubt the card: `DaubtCard(«Card X», «Card Y», «Spacing X», «Spacing Y»)`
- Repeat this for all your cards in the lay-out.
