import clients from './buttons/client.js'
import SystemIndicator from './buttons/SystemIndicator.js'

const left = () => Widget.Box({
	class_name: 'left',
	children: [
		clients()
	],
})

const center = () => Widget.Box({
	class_name: 'center',
	children: [
		
	],
})

const right = () => Widget.Box({
	class_name: 'right',
	hpack: "end",
	children: [
		// Widget.Box({expand: true,}),
		SystemIndicator(),
	],
})

export default (monitor = 0) => Widget.Window({
	monitor,
	exclusivity: "exclusive",
	name: `bar${monitor}`,
	classNames: [ "bar1" ],
	anchor: [ "top", "left", "right" ],
	child: Widget.CenterBox({
		startWidget: left(),
		centerWidget: center(),
		endWidget: right(),
	})
})
