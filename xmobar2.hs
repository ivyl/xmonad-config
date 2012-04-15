Config { font = "xft:Droid Sans Mono Dotted:bold:pixelsize=12"
       , bgColor = "black"
       , fgColor = "grey"
       , position = BottomW L 100
       , commands = [ Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run DiskU [("/", "/: <usedp>"), ("/boot", "/boot: <usedp>"), ("/home", "/home: <usedp>"), ("/var", "/var: <usedp>")] []  60
                    , Run DiskIO [("/", "/: <total>"), ("/boot", "/boot: <total>"), ("/home", "/home: <total>"), ("/var", "/var: <total>")] [] 10
                    , Run Com "~/.xmonad/bin/temp.sh" [] "temp" 50
                    , Run Com "awk '{print $1,$2,$3}' /proc/loadavg" [] "load" 100
                    , Run MultiCpu ["-L","3","-H","50","--normal","#3399ff","--high","red","-p","3","-t","Cpu: <total0>% <total1>%"] 10
                    , Run Com "~/.xmonad/bin/vol.sh" [] "vol" 10
                    , Run Com "cpufreq-info | grep policy | awk '{print $10$11}' | head -n 1" [] "freq" 55
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %multicpu%   %temp% %freq%} %disku% | %diskio% { %load% |  %memory% | %vol% "
       }
