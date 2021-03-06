package slavara.as3.game.starling.resources {
	
	import arp.remote.ARPBundle;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import slavara.as3.core.debug.Assert;
	import slavara.as3.core.enums.BaseEnum;
	import slavara.as3.core.utils.Validate;
	import slavara.as3.game.starling.utils.ARPUtils;
	import starling.textures.Texture;
	
	[Exclude(kind="method",name="getClass")]
	[Exclude(kind="method",name="getDisplayObject")]
	[Exclude(kind="method",name="getByteArray")]
	[Exclude(kind="method",name="getBitmap")]
	[Exclude(kind="method",name="getBitmapData")]
	
	public class ARPResBundle extends BaseResBundle {
		
		public function ARPResBundle(name:BaseEnum, uriList:Vector.<String>) {
			CONFIG::debug
			{
				Assert.isNull(Validate.collectionIsNullOrEmpty(uriList));
			}
			
			super(name, NAME_2_RESOURCE);
			_bundles = new <ARPBundle>[];
			_resList = uriList;
		}
		
		public override function load():void {
			for each (var uri:String in _resList) {
				var loader:URLLoader = new URLLoader();
				loader.dataFormat = URLLoaderDataFormat.BINARY;
				loader.addEventListener(Event.COMPLETE, onLoader);
				loader.load(new URLRequest(uri));
			}
		}
		
		public override function has(uri:BaseEnum):Boolean {
			return Boolean(NAME_2_RESOURCE[uri]);
		}
		
		public override function unload():void {
			if (!isLoaded) {
				return;
			}
			
			for (var name:*in NAME_2_RESOURCE) {
				delete NAME_2_RESOURCE[name];
			}
			
			for each (var bundle:ARPBundle in _bundles) {
				for (var i:int = 0; i < bundle.atfTextures.length; i++) {
					ByteArray(bundle.atfTextures[i]).clear();
				}
				
				bundle.atfTextures = [];
				bundle.resources = {};
			}
			
			_bundles.length = _numLoadedRes = 0;
			_isLoaded = false;
		}
		
		public override function getTexture(uri:BaseEnum):Texture {
			CONFIG::debug
			{
				Assert.isNull(uri, "name");
			}
			
			return NAME_2_RESOURCE[uri.toString()];
		}
		
		private var _bundles:Vector.<ARPBundle>;
		private var _resList:Vector.<String>;
		private var _numLoadedRes:int;
		
		private function onLoader(event:Event):void {
			const bytes:ByteArray = URLLoader(event.target).data;
			bytes.position = 0;
			
			const bundle:ARPBundle = ARPBundle(bytes.readObject());
			_bundles.push(bundle);
			decode(bundle);
			bytes.clear();
		}
		
		private function decode(bundle:ARPBundle):void {
			if (_isLoaded) {
				return;
			}
			
			ARPUtils.fillHash(bundle, NAME_2_RESOURCE);
			
			_numLoadedRes++;
			if (_numLoadedRes == _resList.length) {
				_isLoaded = true;
				onLoaded();
			}
		}
		
		[Deprecated(message="метод запреден")]
		public override function getClass(uri:BaseEnum):Class {
			return null
		}
		
		[Deprecated(message="метод запрещен")]
		public override function getDisplayObject(uri:BaseEnum):DisplayObject {
			return null;
		}
		
		[Deprecated(message="метод запрещен")]
		public override function getByteArray(uri:BaseEnum):ByteArray {
			return null;
		}
		
		[Deprecated(message="метод запрещен")]
		public override function getBitmap(uri:BaseEnum):Bitmap {
			return null;
		}
		
		[Deprecated(message="метод запрещен")]
		public override function getBitmapData(uri:BaseEnum):BitmapData {
			return null;
		}
		
	}
}