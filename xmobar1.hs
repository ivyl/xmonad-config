Config { font = "xft:Droid Sans Mono Dotted:bold:pixelsize=10"
       , bgColor = "black"
       , fgColor = "grey"
       , position = TopW L 100 
       , commands = [ Run Date "%a %b %_d %l:%M" "date" 50
                    , Run Com "~/.xmonad/bin/wlan.sh" [] "wireless" 50
                    , Run Network "wlan0" ["-L","0","-H","32","--normal","#3399ff","--high","#3399ff"] 10
		    , Run BatteryP ["BAT0"] ["-t", "<left>%", "--", "-c", "energy_full"] 200
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{%wlan0% %wireless% bat0: [%battery%] <fc=#3399ff>%date%</fc> "
       }
