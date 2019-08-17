#!/bin/bash
sudo cp ALCPlugFix /usr/bin/
sudo chmod 755 /usr/bin/ALCPlugFix
sudo chown $USER:admin /usr/bin/ALCPlugFix
sudo cp hda-verb /usr/bin/
sudo chmod 755 /usr/bin/hda-verb
sudo chown $USER:admin /usr/bin/hda-verb
sudo cp good.win.ALCPlugFix.plist /Library/LaunchDaemons/
sudo chmod 644 /Library/LaunchDaemons/good.win.ALCPlugFix.plist
sudo chown root:wheel /Library/LaunchDaemons/good.win.ALCPlugFix.plist
sudo launchctl load /Library/LaunchDaemons/good.win.ALCPlugFix.plist

echo "Done!"
exit 0
