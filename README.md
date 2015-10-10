# AutoHotKey Microsoft Bingo Scripts
Inspired by KinectKid333's script he posted at TrueAchievements (http://www.trueachievements.com/forum/viewthread.aspx?tid=732469) I went a step further and enhanced the script.

Features:
- CTRL+B starts the autodaubt
- Checks if a tile is already daubted and skips it

I tested the script using Windows 8.1 on Hyper-V at a resolution of 1920x1080.

To quickly create your own version: 
- Make as screenshot of your desired layout (CTRL+PrntScrn)
- Paste the into Paint
- Move the cursor just above the center of the number in the top-left corner, in the system bar you will see the X and Y for that card
- Move the cursor the the same center position above the number to the right. Substruct that of the X you got the first time. This will by your horizontal spacing.
- Do the same as above, but now for the number below the first one. This will give you the vertical spacing.
- With these numbers you can autodaubt the card: `DaubtCard(«Card X», «Card Y», «Spacing X», «Spacing Y»)`
- Repeat this for all your cards in the lay-out.
