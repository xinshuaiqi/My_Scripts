#byobu

F2                 打开一个新的窗口
F3                进入前一个窗口
F4                 进入后一个窗口
F9                打开byobu菜单，查看帮助信息和配置信息
F12                锁住屏幕
F6                  断开链接
Ctrl+D to close a window
Ctrl+S to stop on the current screen


Putty 从0.61cn 版本开始为支持byobu，设置Fn 功能键和小键盘为“Xterm R6”
F2 创建新的窗口
shift+F2生成水平分隔
ctrl+F2生成垂直分隔
ctrl+shift+F2生成新会话

F3 回到先前窗口
F4:跳到下一个窗口

shift+F3在一个窗口的分隔中回到上一个子窗口，可循环
shift+F4在一个窗口的分隔中回到下一个子窗口，可循环

F5 重新加载文件
F6 释放该次对话并退出Byobu环境，回到当前终端窗口，并且当你下次登录时，它会记住你上回的设置，非常智能
F7 进入 复制/回滚模式
F8 重新命名一个窗口
F9 启动配置窗口，从这里可以了解byobu的热键设置，并且也可以自己修改设置一些选项，建议每次多看看


######################################################byobu

       launching screen


DESCRIPTION
       byobu is a script that launches GNU screen in the byobu  configuration.
       This enables the display of system information and status notifications
       within two lines at the bottom of the screen session. It  also  enables
       multiple  tabbed  terminal  sessions,  accessible  through  simple key-
       strokes.


STATUS NOTIFICATIONS
       byobu supports a number of unique and interesting status  notifications
       across  the  lowest  two lines in the screen.  Each status notification
       item is independently configurable, enabled and disabled by the config-
       uration  utility.   The guide below helps identify each status item (in
       alphabetical order):

       apport - symbol displayed if there are pending crash reports; {!}  sym-
       bol  displayed  on the lower bar toward the left, in black on an orange
       background

       arch - system architecture; displayed on the lower bar toward the left,
       in the default text color on the default background color

       battery  -  battery  information;  display  on the lower bar toward the
       right; |-| indicates discharging, |+| indicates charging, |=| indicates
       fully  charged;   when  charging  or  discharging,  the current battery
       capacity as a percentage is displayed;  the colours green, yellow,  and
       red are used to give further indication of the battery's charge state

      #services  -  users  can configure a list of services to monitor, define
       the SERVICES variable in $HOME/.byobu/status, a whitespace separated of
       services,  each  service  should  include the init name of the service,
       then a pipe, and then an abbreviated name or  symbol  to  display  when
       running;  displayed  in  the  lower  bar toward the center in cyan on a
       white background

      #cpu_count - the number of cpu's or cores on the  system;  displayed  in
       the lower bar toward the right in the default text color on the default
       background, followed by a trailing 'x'

       cpu_freq - the current frequency of the cpu in GHz;  displayed  in  the
       lower bar toward the right in white text on a light blue background

       cpu_temp - the cpu temperature in Celsius (default) or Fahrenheit, con-
       figure TEMP=F or TEMP=C  in  $HOME/.byobu/statusrc;  displayed  in  the
       lower  bar  toward  the right in yellow text on a black background; you
       may override the detected  cpu  temperature  device  by  setting  MONI-
       TORED_TEMP=/proc/acpi/whatever in $HOME/.byobu/statusrc

       custom  -  user  defined custom scripts; must be executable programs of
       any kind in $HOME/.byobu/bin; must be named N_NAME, where N is the fre-
       quency in seconds to refresh the status indicator, and NAME is the name
       played in the lower bar on the far right in white text on a light  pur-
       ple  background; override the default directory by specifying an alter-
       nate mount point with MONITORED_DISK=/wherever in $HOME/.byobu/statusrc

       ec2_cost - an estimation of the cost of the current boot of the  system
       in  terms  of  the Amazon EC2 billing model; displayed in the lower bar
       toward the right in green text on a black background; there is a  lead-
       ing  '~' to indicate that this is an estimation, and the monetary units
       are US Dollars '$'

       fan_speed - cpu or system fan speed as  reported  by  lm-sensors;  dis-
       played  in the lower bar toward the right in black text on a grey back-
       ground; there is a trailing 'rpm' for units

      #hostname - the hostname of the system; displayed in the  upper  bar  on
       the far right in bold black text on a grey background; there is a lead-
       ing '@' symbol if the username status is also enabled

      #ip_address - the ip address of the system in dotted decimal form;  dis-
       played  in  the upper bar on the far right in bold black text on a grey
       background

       load_average - the system load average over the  last  1  minute;  dis-
       played  in  the  lower  bar  toward the right in black text on a yellow
       background

       logo - an approximation of the current operating  system's  logo;  dis-
       played in the lower bar on the far left; you may customize this logo by
       setting a chosen logo in $HOME/.byobu/logo, or you  may  override  this
       with LOGO=:-D in $HOME/.byobu/statusrc

       mail  - system mail for the current user; the letter '[M]' is displayed
       in the lower bar toward the left in black text on a grey background

       mem_available - total memory available in the system; displayed in  the
       lower bar toward the right in white text on a green background

       mem_used - total memory used in the system as a percentage of the total
       memory available; displayed in the lower bar toward the right in  white
       text on a green background with a trailing '%' sign

       menu  - a simple indicator directing new users to use the F9 keybinding
       to access the byobu menu

       network - instantaneous upload/download bandwidth in kB/s over the last
       2 seconds; displayed in the lower bar toward the right in white text on
       a purple background with a leading '^' sign  indicating  'up'  and  'v'
       sign indicating 'down'; override the default interface by specifying an
       alternate interface with  MONITORED_NETWORK=eth1  in  $HOME/.byobu/sta-
       tusrc

       processes  - total number of processes running on the system; displayed
       in the lower bar in white text on  a  dark  yellow  background  with  a
       trailing '&' indicating 'background processes'

       time  -  the system time in HH:MM:SS format; displayed in the lower bar
       on the far right in the default text and default background colors

       time_utc - the UTC system time in HH:MMformat; displayed in  the  lower
       bar on the far right in dark text on a light background

       updates_available - the number of updates available on the system; dis-
       played in the lower bar toward the right in white text on a  red  back-
       ground  with  a  trailing '!' sign; if any updates are marked 'security
       updates', then there will  be  a  total  of  two  trailing  exclamation
       points, '!!'

       uptime  -  the  total  system  uptime since last boot; displayed in the
       lower bar toward the right in blue text on a grey background

       users - the number of remote users logged into  the  system  via  sshd,
       empty  if  0  users; displayed in the lower bar toward the right in red
       text on a grey background with a trailing '#' sign

       whoami - the name of the user who owns the screen session; displayed in
       the  upper  bar toward the far right in bold black text on a grey back-
       ground

       wifi_quality - the connection rate and signal quality of the wifi  con-
       nection; displayed in the lower bar toward the right in black text on a
       cyan background; the connection rate is in 'Mb/s' and the signal  qual-
       ity is as a percentage with a trailing '%'

       windows  -  each open window in the screen session appears is displayed
       in the upper bar toward the far right in blue text on a grey background


UNITS OF MEASURE
       byobu uses binary for measurements rather than decimal for KB, MB,  and
       GB.   This  means  multiples  of 1024 rather than multiples of 1000, in
       accordance with JEDEC Standard 100B.01.


KEYBINDINGS
       byobu keybindings can be user defined in  /usr/share/byobu/keybindings/
       (or within .screenrc if byobu-export was used). The common key bindings
       are:

       F2 - Create a new window

       F3 - Move to previous window

       F4 - Move to next window

       F5 - Reload profile

       F6 - Detach from this session

       Ctrl-a ! - Toggle key bindings on and off

       Ctrl-a k - Kill the current window


BUGS
       PuTTY users have reported that the F2, F3, and F4 shortcut keys are not
       working  properly.   PuTTY sends the same escape sequences as the linux
       console for F1-F4 by default.  You can fix this problem  in  the  PuTTY
       config,  Terminal  ->  Keyboard  ->  Function  keys:  Xterm  R6.   See:
       http://www.mail-archive.com/screen-users@gnu.org/msg01525.html

       Mac OSX terminal users have reported 'flashing text'.  You can fix this
       in  the  advanced  settings  of the terminal application, with 'Declare
       Terminal As: xterm-color'.


SEE ALSO
       screen(1),  byobu-config,  byobu-export,  byobu-status,   byobu-status-
       detail
       http://launchpad.net/byobu


AUTHOR
       This  manpage  and  the  utility  was written by Dustin Kirkland <kirk-
       land@canonical.com> for Ubuntu systems (but may  be  used  by  others).
       Permission  is  granted to copy, distribute and/or modify this document
       under the terms of the GNU General Public License, Version 3  published
       by the Free Software Foundation.

       On  Debian systems, the complete text of the GNU General Public License
       can be found in /usr/share/common-licenses/GPL.



byobu                            19 June 2009                         byobu(1)
Man Pages Copyright Respective Owners. Site Copyright (C) 1994 - 2014 Hurricane Electric. All Rights Reserved.









