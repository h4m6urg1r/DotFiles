from libqtile.command import lazy
from libqtile.config import Key, KeyChord
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = "xfce4-terminal"

movementKeys = {
    'h': [ lazy.layout.left(), lazy.layout.shuffle_left(), lazy.layout.grow_left(), 'to the left' ],
    'j': [ lazy.layout.down(), lazy.layout.shuffle_down(), lazy.layout.grow_down(), 'down' ],
    'k': [ lazy.layout.up(), lazy.layout.shuffle_up(), lazy.layout.grow_up(), 'up' ],
    'l': [ lazy.layout.right(), lazy.layout.shuffle_right(), lazy.layout.grow_right(), 'to the right' ],
    #'h': 'left',
    #'j': 'down',
    #'k': 'up',
    #'l': 'right'
}
rofiKeys = {
    'd': 'rofi -modi drun -show drun',
    'r': 'rofi -modi run -show run',
    'w': 'rofi -modi window -show window',
    'c': 'rofi -modi windowcd -show windowcd'
}

keys = []
# Switch between windows
keys.extend([Key([mod], key, value[0], desc=f"Focus {value[-1]} window") for key, value in movementKeys.items()])

# Move windows between left/right columns or move up/down in current stack.
# Moving out of range in Columns layout will create new column.
keys.extend([Key([mod, "shift"], key, value[1], desc=f"Move window {value[-1]}") for key, value in movementKeys.items()])

keys.extend([
    Key([mod], "Tab", lazy.layout.next(), desc="Move window focus to other window"),


    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    KeyChord([mod], "w", [
        KeyChord([], "r", [
            Key([], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
            Key([], "j", lazy.layout.grow_down(), desc="Grow window down"),
            Key([], "k", lazy.layout.grow_up(), desc="Grow window up"),
            Key([], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
            Key([], "n", lazy.layout.normalize(), desc="Reset all window sizes")
        ], mode=True, name="Resize"),
        Key(["shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
        Key(["shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
        Key(["shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
        Key(["shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
        Key([], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([], "j", lazy.layout.down(), desc="Move focus down"),
        Key([], "k", lazy.layout.up(), desc="Move focus up"),
        Key([], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([], "x", lazy.window.kill(), desc="Kill focused window"),
        Key([], "Tab", lazy.layout.next(), desc="Move window focus to other window"),
        # Toggle between split and unsplit sides of stack.
        # Split = all windows displayed
        # Unsplit = 1 window displayed, like Max layout, but still with
        # multiple stack panes
        Key([], "t", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
    ], mode=True, name="Window Management"),

    Key([mod], "t", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    KeyChord([mod], "r", [
        Key([], key, lazy.spawn(command), desc="Open application launcher") for key, command in rofiKeys.items()
    ], mode=False, name="Rofi Commands")
])
'''
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
]
'''
