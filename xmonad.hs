import XMonad
import XMonad.Actions.CycleWindows -- classic alt-tab
import XMonad.Actions.CycleWS -- cycle thru WS', toggle last WS
import XMonad.Actions.DwmPromote -- swap master like dwm
import XMonad.Hooks.DynamicLog -- statusbar
import XMonad.Hooks.EwmhDesktops -- fullscreenEventHook fixes chrome fullscreen
import XMonad.Hooks.ManageDocks -- dock/tray mgmt
import XMonad.Hooks.UrgencyHook -- window alert bells
import XMonad.Layout.Named -- custom layout names
import XMonad.Layout.NoBorders -- smart borders on solo clients
import XMonad.Util.EZConfig -- append key/mouse bindings
import XMonad.Util.Run(spawnPipe) -- spawnPipe and hPutStrLn
import System.IO -- hPutStrLn scope

main = do
  din <- spawnPipe myStatusBar 
  xmonad $ defaultConfig
    { terminal    = "urxvtc"
    , modMask     = mod4Mask
    , borderWidth = 1
    , normalBorderColor = "#333333"
    , focusedBorderColor = "#666666"
    , logHook = myLogHook din
    , startupHook = myStartupHook
    , manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts  $  layoutHook defaultConfig
    }
    `additionalKeysP` myKeys

myKeys = [ ("M1-<Tab>" , cycleRecentWindows [xK_Alt_L] xK_Tab xK_Tab ) -- classic alt-tab behaviour
         , ("M-<Return>" , dwmpromote ) -- swap the focused window and the master window
         , ("M-<Down>" , nextWS ) -- go to next workspace
         , ("M-<Up>" , prevWS ) -- go to prev workspace
         , ("M-S-<Down>", shiftToNext ) -- move client to next workspace
         , ("M-S-<Up>" , shiftToPrev ) -- move client to prev workspace
         , ("M-p" , spawn "gmrun" ) -- app launcher
         , ("M-n" , spawn "wicd-client -n" ) -- network manager
         , ("M-a" , spawn "urxvtc -e alsamixer" ) -- sound mixer
         , ("M-f" , spawn "firefox" ) -- launch browser
         , ("M-x" , spawn "wxHexEditor" ) -- hex editor
         , ("M-v" , spawn "gvim" ) -- gvim
         , ("M-S-h" , spawn "urxvtc -e htop" ) -- htop
         , ("M-S-m" , spawn "urxvtc -e mutt" ) -- mutt
         , ("M-S-a" , spawn "~/.bin/cpu min" ) -- cpu scaling
         , ("M-S-s" , spawn "~/.bin/cpu min" ) -- cpu scaling
         , ("M-S-d" , spawn "~/.bin/cpu max" ) -- cpu scaling
	 , ("M-S-l" , spawn "slimlock" ) -- lock screen
         , ("C-M-<Delete>" , spawn "gksudo shutdown -r now" ) -- reboot
         , ("C-M-<Insert>" , spawn "gksudo shutdown -h now" ) -- poweroff
         , ("<XF86AudioRaiseVolume>", spawn "amixer -c 0 -- sset Master '2.00dB+'" ) -- volume up
         , ("<XF86AudioLowerVolume>", spawn "amixer -c 0 -- sset Master '1.00dB-'" ) -- volume down
         , ("<XF86Display>", spawn "arandr" )
         , ("<XF86KbdBrightnessDown>", spawn "sudo /opt/kbdlight/bin/kbdlight -" )
         , ("<XF86KbdBrightnessUp>", spawn "sudo /opt/kbdlight/bin/kbdlight +" )
         ]

myLogHook h = dynamicLogWithPP xmobarPP
            { ppHidden = xmobarColor "grey" "" --tag color
	    , ppCurrent = xmobarColor "#3399ff" "" . wrap "[" "]"
            , ppOutput = hPutStrLn h           --tag list and window title
            , ppTitle = xmobarColor "#3399ff" "" --window title color
            }

myStatusBar = "xmobar ~/.xmonad/xmobarrc" --define first xmobar
myStartupHook :: X ()
myStartupHook = do
            spawn "xmobar ~/.xmonad/xmobarrc2" --start second xmobar
