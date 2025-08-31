#!/bin/bash

systemctl --user stop sunshine

hyprctl keyword monitor "DP-2",2560x1440@144,0x0,1
hyprctl keyword monitor "HDMI-A-1",2560x1440@75,2560x-350,1,transform,3
hyprctl keyword monitor "HDMI-A-2",2560x1440@75,-2560x0,1
hyprctl keyword monitor "HEADLESS-2",2560x1440@60,-5120x0,1

systemctl --user start sunshine
