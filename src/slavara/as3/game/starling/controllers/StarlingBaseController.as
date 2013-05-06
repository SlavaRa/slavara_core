package slavara.as3.game.starling.controllers {
	import starling.display.DisplayObjectContainer;
	import flash.utils.getQualifiedClassName;
	import slavara.as3.core.commands.Command;
	import slavara.as3.core.commands.CommandDispatcher;
	import slavara.as3.core.data.Data;
	import slavara.as3.core.debug.Assert;
	import slavara.as3.core.utils.IDestroyable;
	
	/**
	 * @author СлаваRa
	 */
	public class StarlingBaseController extends CommandDispatcher implements IStarlingBaseController, IDestroyable {
		
		public function StarlingBaseController(container:DisplayObjectContainer, data:Data) {
			Assert.isNull(container, "container");
			Assert.isNull(data, "data");
			super();
			if ((this as Object).constructor === StarlingBaseController) {
				throw new ArgumentError('ArgumentError: ' + getQualifiedClassName(this) + ' class cannot be instantiated.');
			}
			_container = container;
			_data = data;
		}
		
		/* INTERFACE slavara.as3.core.controllers.IBaseController */
		public function get container():DisplayObjectContainer {
			return _container;
		}
		
		/* INTERFACE slavara.as3.core.controllers.IController */
		public function get data():Data {
			return _data;
		}
		
		/* INTERFACE slavara.as3.core.controllers.IController */
		public function get baseController():IStarlingBaseController {
			return this;
		}
		
		/* INTERFACE slavara.as3.core.utils.IDestroyable */
		public function destroy():void {
			removeCommandListeners();
			_data = null;
			_container = null;
		}
		
		public function call(commandName:String, ...args):* {
			dispatchCommand(new Command(commandName, args));
		}
		
		private var _container:DisplayObjectContainer;
		private var _data:Data;
		
	}
}