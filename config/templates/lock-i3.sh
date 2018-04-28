#!/usr/bin/env sh

#icon="$HOME/dotfiles-manjaro-i3/img/i3-lock-icon-deathnote.png"
#icon="$HOME/dotfiles-manjaro-i3/img/i3-lock-icon-homestuck-crew.png"

# colours
bgcolor=<GTKTHEMEBG1>FF
ringcolor=<GTKTHEMEBG2>FF
opaquebgcolor=<GTKTHEMEBG4>D8
wrongcolor=<GTKTHEMEURGENT>FF
wrongbgcolor="$bgcolor"
inactivebgcolor=<GTKTHEMEBG1>FF
inactivetextcolor=<GTKTHEMEFG1>FF
urgentbgcolor=<GTKTHEMEURGENT>FF
urgenttextcolor=<GTKTHEMEFG2>FF
highlightcolor=<GTKTHEMEHI>FF
verifyingbgcolor="$bgcolor"
verifyingringcolor="$ringcolor"
backspacecolor="$wrongcolor"
textcolor="$highlightcolor"

tmpbg='/tmp/screen.png'

revert() {
  xset dpms 0 0 0
}

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
convert "$tmpbg" -gravity center -composite -matte "$tmpbg"

# enable DPMS while the screen is locked
trap revert HUP INT TERM
xset +dpms dpms 10 20 30

# lock the screen
i3lock --nofork --image="$tmpbg" --insidevercolor="$verifyingbgcolor" --insidewrongcolor="$wrongbgcolor" --insidecolor="$bgcolor" --ringvercolor="$verifyingringcolor" --ringwrongcolor="$wrongcolor" --ringcolor="$ringcolor" --keyhlcolor="$highlightcolor" --bshlcolor="$backspacecolor" --textcolor="$textcolor"
# switch off DPMS
revert

# i3lock-color options
# -S=number, --screen=number
#       Specifies which display to draw the unlock indicator and clock on. By default, they'll be placed on every screen.  Note that this number is zero indexed. The ordering is dependent on  libxin‐
#       erama.
#
# -B=sigma, --blur=sigma
#       Captures the screen and blurs it using the given sigma (radius).  Images may still be overlaid over the blurred screenshot.
#
# --indicator
#       Forces the indicator to always be visible, instead of only showing on activity.
#
# --keylayout mode
#       Displays the keylayout. Positionable similar to date, time, and indicator. Modes are as follows:
#
#              0 - Displays the full string returned by the query, i.e. "English (US)"
#
#              1 - Displays up until the first parenthesis, i.e. "English"
#
#              2 - Displays just the contents of the parenthesis, i.e. "US"
#
# -k, --clock, --force-clock
#       Displays the clock. --force-clock also displays the clock when there's indicator text (useful for when the clock is not positioned with the indicator).
#
# --composite
#       Some compositors have problems with i3lock trying to render over them, so this argument is disabled by default. However, some will work properly with it, so it's been left enabled.
#
# --insidevercolor=rrggbbaa
#       Sets the interior circle color while the password is being verified.
#
# --insidewrongcolor=rrggbbaa
#       Sets the interior circle color for during flash for an incorrect password.
#
# --insidecolor=rrggbbaa
#       Sets the default "resting" color for the interior circle.
#
# --ringvercolor=rrggbbaa
#       Sets the ring color while the password is being verified.
#
# --ringwrongcolor=rrggbbaa
#       Sets the ring color during the flash for an incorrect password.
#
# --ringcolor=rrggbbaa
#       Sets the default ring color.
#
# --linecolor=rrggbbaa
#       Sets the color for the line separating the inside circle, and the outer ring.
#
# --line-uses-ring
#       Conflicts with --line-uses-inside. Overrides --linecolor. The line will match the ring color.
#
# --linecolor=rrggbbaa
#        Sets the color for the line separating the inside circle, and the outer ring.
#
# --line-uses-ring
#        Conflicts with --line-uses-inside. Overrides --linecolor. The line will match the ring color.
#
# --line-uses-inside
#        Conflicts with --line-uses-ring. Overrides --linecolor; the line will match the inside color.
#
# --keyhlcolor=rrggbbaa
#        Sets the color of the ring 'highlight' strokes that appear upon keypress.
#
# --bshlcolor=rrggbbaa
#        Sets the color of the ring 'highlight' strokes that appear upon backspace.
#
# --separatorcolor=rrggbbaa
#        Sets the color of the 'separtor', which is at both ends of the ring highlights.
#
# --textcolor=rrggbbaa
#        Sets the color of the status text ("verifying...", "wrong!", etc).
#
# --indpos="x position:y position"
#        Sets the position for the unlock indicator. Valid variables include:
#
#               x - x position of the current display. Corresponds to the leftmost row of pixels on that display.
#
#               y - y position of the current display. Corresponds to the topmost row of pixels on that display.
#
#               w - width of the current display.
#
#               h - height of the current display.
#
#               r - the unlock indicator radius.
#
# --timecolor=rrggbbaa
#        Sets the color of the time in the clock.
#
# --timestr="%H:%M:%S"
#        Sets the format used for generating the time string. See strftime(3) for a full list of format specifiers.
#
# --timefont=sans-serif
#        Sets the font used to render the time string.
#
# --timesize=number
#        Sets the font size for rendering the time string. Defaults to 32.
#
# --timepos="x position:y position"
#        Sets the position for the time string. All the variables from --indpos may be used, in addition to:
#
#                             ix - the x value of the indicator on the current display.
#
#                             iy - the y value of the indicator on the current display.
#
#                             cw - the clock width.
#
#                             ch - the clock height.
#
# --time-align, --date-align, --layout-align
#        Sets the text alignment of the time, date, and keyboard layout. Values are:
#
#               0 - centered (default)
#
#               1 - left aligned
#
#               2 - right aligned
#
# --datecolor=rrggbbaa
#        Sets the color of the date in the clock.
#
# --datestr="%A, %m %Y
#        Sets the format used for generating the date string. See strftime(3) for a full list of format specifiers.
#
# --datefont=sans-serif
#        Sets the font used to render the date string.
#
# --datesize=number
#        Sets the font size for rendering the date string. Defaults to 14.
#
# --datepos="x position:y position"
#        Sets the position for the date string. All the variables from --indpos and --timepos may be used, in addition to:
#
#               tx - the computed x value of the timestring, for the current display.
#
#               ty - the computed y value of the timestring, for the current display.
#
# --refresh-rate=seconds-as-double
#        The  refresh  rate  of  the indicator, given in seconds. This should automatically align itself, but is somewhat buggy currently. Values less than one will work, but may result in poor system
#        performance.
#
# --veriftext="text"
#        Sets the string to be shown while verifying the password/input/key/etc. Defaults to "verifying…".
#
# --wrongtext="text"
#        Sets the string to be shown upon entering an incorrect password. Defaults to "wrong!".
#
# --textsize=number
#        The fontsize of the status text. Defaults to 28.
#
# --modsize=number
#       The fontsize of the text listing all the active modifiers (caps lock, num lock, etc). Defaults to 14.
#
# --radius
#       The radius of the circle. Defaults to 90.
#
# --bar-indicator
#       Replaces the usual ring indicator with a bar indicator, with a variety of options.
#
# --redraw-thread
#       Starts a separate thread for redrawing the screen. Potentially worse for security, but makes the bar indicator still do its usual periodic redraws when PAM is authenticating.
#
# --bar-direction={0, 1, 2}
#       Sets the direction the bars grow in. 0 is the default (downwards, or rightwards, depending on the bar orientation). 1 is the reverse, and 2 is both.
#
# --bar-width=15
#       Sets the width of the minibars in the bar.
#
# --bar-orientation={vertical,horizontal}
#       Sets whether the bar is vertically or horizontally oriented. Defaults to horizontal.
#
# --bar-step
#       Sets the step that each bar decreases by when a key is pressed. A random bar is set to its max height, and then each neighbor is set to (height - step*distance).
#
# --bar-max-height
#       The maximum height a bar can get to. When a key is pressed, a random bar is set to this value, and then its neighbors are set to its height, minus the step value.
#
# --bar-base-width
#       The thickness of the "base" bar that all the bars originate from. This bar also takes on the ring verif and wrong colors to give authentication feedback.
#
# --bar-color
#       Sets the default color of the bar base.
#
# --bar-periodic-step
#       The value by which the bars decrease each time the screen is redrawn.
#
# --bar-position
#       Works similarly to the time/date/indicator expressions. If the bar is horizontal, this sets the vertical offset from the top edge. If it's vertically oriented, this sets the horizontal offset
#       from the left edge
