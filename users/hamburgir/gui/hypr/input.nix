{ config, ... }: {
    wm.rules.focusType = 1;
    wayland.windowManager.hyprland.settings = {
		input = {
			kb_layout = "us";
			follow_mouse = config.wm.rules.focusType;
			mouse_refocus = config.wm.rules.mouseRefocus;
			numlock_by_default = config.hardware.keyboard.numlock;
			touchpad = {
				natural_scroll = config.hardware.touchpad.naturalScroll;
				drag_lock = config.hardware.touchpad.dragLock;
				tap-and-drag = config.hardware.touchpad.tapAndDrag;
			};
			sensitivity = builtins.toString config.hardware.mouse.sensitivity;
		};
		Gestures = {
			workspace_swipe = config.wm.gesture.switchWorkspace;
		};
		device = {
			epic-mouse-v1 = {
				sensitivity = -0.5;
			};
		};
    };
}
