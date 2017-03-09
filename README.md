# CaseBlocksBar
CaseBlocks plugin for BitBar

## Setup

If you haven't created a BitBar plugin folder, create one for example:

    mkdir ~/BitBarPlugins

When you install BitBar point BitBar to that folder.

Clone this repository to your local laptop.

Amend CaseBlocksBar.rb with your specific CaseBlocks Auth Token on line 13.
DO NOT COMMIT YOUR CHANGES TO PUBLIC REPO. Keep you auth token secure.

Create a symbolic link from your CaseBlocksBar repo to your BitBarPlugins folder. For example:

    cd ~/BitBarPlugins
    ln -s ~/src/github.com/ijonas/CaseBlocksBar/CaseBlocksBar.rb

Hit "Refresh All" in BitBar.

Happy Days.
