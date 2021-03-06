package slavara.as3.game.starling.utils {
	import flash.utils.getQualifiedClassName;
	import slavara.as3.core.utils.DestroyUtils;
	import starling.display.DisplayObject;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	/**
	 * @author SlavaRa
	 */
	public class StarlingDestroyUtils {
		
		[Inline]
		public static function destroy(target:Object, safeMode:Boolean = true):* {
			if(target is Texture) Texture(target).dispose();
			else if(target is TextureAtlas) TextureAtlas(target).dispose();
			else if(target is DisplayObject) DisplayObject(target).dispose();
			return DestroyUtils.destroy(target, safeMode);
		}
		
		public function StarlingDestroyUtils() {
			super();
			CONFIG::debug
			{
				throw new ArgumentError('ArgumentError: ' + getQualifiedClassName(this) + ' class cannot be instantiated.');
			}
		}
	}
}