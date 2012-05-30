Config { font = "xft:Droid Sans Mono Dotted:bold:pixelsize=10"
       , bgColor = "black"
       , fgColor = "grey"
       , position = TopW L 100 
       , commands = [ Run Date "%b %_d %k:%M" "date" 50
                    , Run MultiCpu ["-L","3","-H","50", "--low","#3399ff","--normal","#3399ff","--high","red","-p","2","-c","0","-t","[<autototal>]"] 10
                    , Run Memory ["-t","<fc=#3399ff><usedbar></fc>"] 10
                    , Run Com "~/.xmonad/bin/temp.sh" [] "temp" 50
                    , Run Com "~/.xmonad/bin/wlan.sh" [] "wireless" 50
                    , Run Com "~/.xmonad/bin/vol.sh" [] "vol" 10
		    , Run BatteryP ["BAT0"] ["-t", "[<fc=#3399FF><left></fc>] <acstatus>", "--", "-c", "energy_full"] 200
                    , Run CpuFreq ["-t","<cpu0>","-L","0","-H","2","-l","green","-n","grey","-h","#3399FF"] 50
                    , Run StdinReader
                    ]
       , sepChar = "$"
       , alignSep = "}{"
       , template = "$StdinReader$ }{CPU: $cpufreq$ $multicpu$ $temp$ <fc=#444466>|</fc> WLAN: $wireless$ <fc=#444466>|</fc> MEM: [$memory$] <fc=#444466>|</fc> BAT: $battery$ <fc=#444466>|</fc> VOL: [<fc=#3399FF>$vol$</fc>] <fc=#444466>|</fc> <fc=#3399ff>$date$</fc> "
       }
