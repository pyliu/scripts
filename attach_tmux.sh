#!/bin/sh

export TERM=xterm

tmux -u detach-client -s wip
if [ $? -ne 0 ]; then
    tmux new -s wip
    tmux -u detach-client -s wip
fi
tmux -u a
