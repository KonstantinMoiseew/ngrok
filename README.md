# SSH tunnel for free

Unfortunately, free version of ngrok changes external address each start.I got a little creative and decided to transfer the address through Telegram using a bot. 
`keys.sh` is what keys should look like. 
`API_KEY` can be retrieved from BotFather.
`CHAT_ID` is a group. You need to create it, then add bot there. 
Somehow bot must send a message there. IIRC I just sent a few API requests manually. Then bot will edit that message every time new information arrives.



# Now with systemd unit

I finally created this file. Its path should be
`$HOME/.local/share/systemd/user/ngrok-ssh.service` (I just symlinked it):

    mkdir -p $HOME/.local/share/systemd/user
    ln -s $(realpath ngrok-ssh.service) $HOME/.local/share/systemd/user

There is a problem which might be solved eventually: the unit relies on the fact that directory containing all the files is in the home directory. As 
earlier, I just symlinked it:

    ln -s $(realpath .) $HOME

Then the unit shall be activated:

    systemctl --user enable --now ngrok-ssh.service

If autostart even before login is desired, run:

    sudo loginctl enable-linger $USERNAME

It is more natural to attain the same result via python-telegram-bot or cpphttplib (for example) and what I am actually going to do, but ths bot has been written in Bash just for me learning new concepts at a time. 


