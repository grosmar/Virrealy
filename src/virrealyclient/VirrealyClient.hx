package virrealyclient;

import virrealyclient.parser.settings.application.InitialApplicationSettingsParser;
import virrealyclient.vo.settings.application.InitialApplicationSettingsVO;
import hex.di.IBasicInjector;
import hex.ioc.assembler.AbstractApplicationContext;
import hex.ioc.assembler.ApplicationAssembler;
import hex.ioc.parser.xml.ApplicationXMLParser;
import hex.ioc.parser.xml.XMLFileReader;
import hex.log.layout.JavaScriptConsoleLayout;
import hex.log.layout.LogLayoutHTMLView;
import hex.log.layout.LogProxyLayout;
import hex.log.layout.SimpleBrowserLayout;

/**
 * ...
 * @author duke
 */
@:expose("VirrealyClient")
class VirrealyClient
{
	#if js
	static var imports:Imports;
	#end
	
	static var self:VirrealyClient;
	
	var _applicationAssembler:ApplicationAssembler;
	var _applicationContext:AbstractApplicationContext;
	
	var _injector:IBasicInjector;
	var _initialApplicationSettings:InitialApplicationSettingsVO;

	static public function main() : Void
	{
		#if debug
		_initLogger();
		
		self = new VirrealyClient( virrealyclient.DebugConfig.config ); 
		#end
	}
	
	public function new( config:Dynamic )
	{
		this._init();
		this._setInitialApplicationSettings( config );
		
		this._registerView();
		
		this._build( this._getApplicationXml() );
	}
	
	function _getApplicationXml( ):Xml
	{
		return Xml.parse( XMLFileReader.readXmlFile("virrealyclient/configuration/context.xml") );
	}
	
	function _init():Void
	{
		this._applicationAssembler = new ApplicationAssembler();
		this._applicationContext = this._applicationAssembler.getApplicationContext("virrealyClient");
		this._injector = this._applicationContext.getBasicInjector();
	}
	
	function _setInitialApplicationSettings(config:Dynamic):Void
	{
		var initialApplicationSettingsParser = new InitialApplicationSettingsParser();
		this._initialApplicationSettings = initialApplicationSettingsParser.parseSettings( config );
		this._injector.mapToValue( InitialApplicationSettingsVO, this._initialApplicationSettings, "initialApplicationSettings" );
		
		this._applicationAssembler.getBuilderFactory(this._applicationContext).getCoreFactory().register("initialApplicationSettings", this._initialApplicationSettings);
	}
	
	function _registerView():Void
	{
		#if js
		this._applicationAssembler.getBuilderFactory( this._applicationContext ).getCoreFactory().register( "root", js.Browser.document.getElementById(this._initialApplicationSettings.rootElementId) );
		#end
	}
	
	function _build( xml : Xml ) : Void
	{
		var normalParser : ApplicationXMLParser = new ApplicationXMLParser();
		normalParser.parse( this._applicationAssembler, xml );
		
		this._applicationAssembler.buildEverything();
	}
	
	static function _initLogger():Void
	{
		var proxy : LogProxyLayout = new LogProxyLayout();
		var controller = new LogLayoutHTMLView( proxy );
		proxy.addListener( new SimpleBrowserLayout( controller.consoleWrapperTaget ) );
		#if js
		proxy.addListener( new JavaScriptConsoleLayout() );
		#end
	}
}