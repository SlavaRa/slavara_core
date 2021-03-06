package slavara.as3.game.starling.utils {
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.controls.GroupedList;
	import feathers.controls.List;
	import feathers.controls.ScrollContainer;
	import feathers.controls.TextInput;
	import feathers.controls.ToggleSwitch;
	import flash.utils.getQualifiedClassName;
	import slavara.as3.core.enums.BaseEnum;
	import starling.display.DisplayObjectContainer;
	
	/**
	 * @author SlavaRa
	 */
	public class FeathersDisplayUtils {
		
		//{ region aliases
		
		/**
		 * @see slavara.as3.game.starling.utils.FeathersDisplayUtils.getButtonByEnum
		 */
		public static function getBTNby(container:DisplayObjectContainer, enum:BaseEnum):Button {
			return getButtonByEnum(container, enum);
		}
		
		/**
		 * @see slavara.as3.game.starling.utils.FeathersDisplayUtils.getButtonGroupByEnum
		 */
		public static function getBTNGby(container:DisplayObjectContainer, enum:BaseEnum):ButtonGroup {
			return getButtonGroupByEnum(container, enum);
		}
		
		/**
		 * @see slavara.as3.game.starling.utils.FeathersDisplayUtils.getToggleSwitchByEnum
		 */
		public static function getTSGby(container:DisplayObjectContainer, enum:BaseEnum):ToggleSwitch {
			return getToggleSwitchByEnum(container, enum);
		}
		
		/**
		 * @see slavara.as3.game.starling.utils.FeathersDisplayUtils.getTextInputByEnum
		 */
		public static function getTIby(container:DisplayObjectContainer, enum:BaseEnum):TextInput {
			return getTextInputByEnum(container, enum);
		}
		
		/**
		 * @see slavara.as3.game.starling.utils.FeathersDisplayUtils.getScrollContainerByEnum
		 */
		public static function getSCby(container:DisplayObjectContainer, enum:BaseEnum):ScrollContainer {
			return getScrollContainerByEnum(container, enum);
		}
		
		/**
		 * @see slavara.as3.game.starling.utils.FeathersDisplayUtils.getGroupedListByEnum
		 */
		public static function getGLby(container:DisplayObjectContainer, enum:BaseEnum):GroupedList {
			return getGroupedListByEnum(container, enum);
		}
		
		/**
		 * @see slavara.as3.game.starling.utils.FeathersDisplayUtils.getListByEnum
		 */
		public static function getLby(container:DisplayObjectContainer, enum:BaseEnum):List {
			return getListByEnum(container, enum);
		}
		
		//} endregion
		
		public static function getButtonByEnum(container:DisplayObjectContainer, enum:BaseEnum):Button {
			return StarlingDisplayUtils.getDOby(container, enum) as Button;
		}
		
		public static function getButtonGroupByEnum(container:DisplayObjectContainer, enum:BaseEnum):ButtonGroup {
			return StarlingDisplayUtils.getDOby(container, enum) as ButtonGroup;
		}
		
		public static function getToggleSwitchByEnum(container:DisplayObjectContainer, enum:BaseEnum):ToggleSwitch {
			return StarlingDisplayUtils.getDOby(container, enum) as ToggleSwitch;
		}
		
		public static function getTextInputByEnum(container:DisplayObjectContainer, enum:BaseEnum):TextInput {
			return StarlingDisplayUtils.getDOby(container, enum) as TextInput;
		}
		
		public static function getScrollContainerByEnum(container:DisplayObjectContainer, enum:BaseEnum):ScrollContainer {
			return StarlingDisplayUtils.getDOby(container, enum) as ScrollContainer;
		}
		
		public static function getGroupedListByEnum(container:DisplayObjectContainer, enum:BaseEnum):GroupedList {
			return StarlingDisplayUtils.getDOby(container, enum) as GroupedList;
		}
		
		public static function getListByEnum(container:DisplayObjectContainer, enum:BaseEnum):List {
			return StarlingDisplayUtils.getDOby(container, enum) as List;
		}
		
		public function FeathersDisplayUtils() {
			super();
			throw new ArgumentError('ArgumentError: ' + getQualifiedClassName(this) + ' class cannot be instantiated.');
		}
	}
}