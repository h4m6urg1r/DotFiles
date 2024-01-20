{ config, ... }: {
    wm.rules.focusType = 1;
    wayland.windowManager.hyprland.extraConfig = ''
    input {
        kb_layout = us
        follow_mouse = ${ builtins.toString config.wm.rules.focusType }
        mouse_refocus = ${ if config.wm.rules.mouseRefocus then "true" else "false" }
        numlock_by_default = ${ if config.hardware.keyboard.numlock then "true" else "false" }
        touchpad {
            natural_scroll = ${ if config.hardware.touchpad.naturalScroll then "true" else "false" }
            drag_lock = ${ if config.hardware.touchpad.dragLock then "true" else "false" }
            tap-and-drag = ${ if config.hardware.touchpad.tapAndDrag then "true" else "false" }
        }
        sensitivity = ${ builtins.toString config.hardware.mouse.sensitivity }
    }
    ${ if config.wm.gesture.enable then
    ''
    Gestures {
        workspace_swipe = ${ if config.wm.gesture.switchWorkspace then "true" else "false" }
    }
    ''
    else ""
    }
    '';
}
