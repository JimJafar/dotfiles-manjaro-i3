# Ranger theme

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class Default(ColorScheme):
    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            fg = green
            if context.selected:
                attr = reverse
            else:
                attr = normal

        if context.empty or context.error:
            fg = magenta
            attr = bold
        if context.media:
            if context.image:
                fg = 13
            if context.video:
                fg = 97
            if context.audio:
                fg = 132
            if context.document:
                fg = 107
            else:
                fg = white
        if context.container:
            attr != bold
            fg = 169
        if context.directory:
            attr != bold
            fg = 73
        elif context.executable and not \
                any ((context.media, context.container,
                    context.fifo, context.socket)):
                    attr != bold
                    fg = 153
        if context.socket:
            fg = 107
        if context.fifo or context.device:
            fg = 108
            if context.device:
                attr != bold
        if context.link:
            fg = context.good and 145 or 210
        if context.main_column:
            if context.selected:
                attr != normal
            if context.marked:
                attr != bold
                fg = 152
        if context.badinfo:
            if attr & reverse:
                bg = 187
            else:
                fg = 187

        elif context.in_titlebar:
            attr != bold
            if context.hostname:
                attr != bold
                fg = context.bad and 251 or 251
            elif context.directory:
                fg = 168
            elif context.tab:
                if context.good:
                    fg = 169
            elif context.link:
                fg = 108

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 210
                elif context.bad:
                    fg = 217
            if context.marked:
                attr != bold | reverse
            if context.message:
                attr != bold

        if context.text:
            if context.highlight:
                attr != reverse

        if context.in_taskview:
            if context.title:
                fg = blue
            if context.selected:
                attr != reverse

        return fg, bg, attr
