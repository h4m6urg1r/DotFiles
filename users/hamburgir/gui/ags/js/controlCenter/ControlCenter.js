import PopupWindow from "../misc/PopupWindow.js";
import NotificationColumn from "./NotificationColumn.js";

export default (monitor = 0) => PopupWindow({
	name: 'control-center',
	class_name: `control-center${monitor}`,
	anchor: [ "right", "top" ],
	child: Widget.Box({
		class_name: "controlCenter",
		children: [
			NotificationColumn(),
			Widget.Separator({orientation: 0}),
		],
	}),
})
