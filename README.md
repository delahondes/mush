# mush

I have always liked terminal multiplexers like screen or tmux. I am also a big fan of mosh, an improvement of ssh with very little requirements.
More and more my working routing began to be: start my terminal emulator, mosh to my server, try to attach my tmux session... or start a new one when I forgot about the server fresh reboot. 

I've seen a few integrated tools that claim to be better than tmux, so I've tried a few things but they all seem to somewhat get in the way, tmux is almost the  perfect tool for me. Yet I was obviously missing some productivity gains since a lot of things can be achieved by customizing tmux, and it did not suit me to manage a lot of different tmux configurations on different servers (I tend to connect to lots of servers, with a very variable frequency).

So discussing with ChatGPT, I was able to create a small bash function, that just do a minimal configuration that is fine for me and that is instantly available in all my remote servers (provided they have tmux and mosh, but these two utilities are widespread in linux world). 

So here it is: add this function in your .bashrc or .bash_profile, make sure mosh and tmux are available on your servers, do your SSH class (like you should already have done: e.g. copy your SSH key to the different servers and correctly set up your .ssh/config so you have a nice nickname for all your servers and you  don't need to specify user, ports, address).
