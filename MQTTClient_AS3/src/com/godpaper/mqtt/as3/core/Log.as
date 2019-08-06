package com.godpaper.mqtt.as3.core
{

	public class Log
	{
		public function Log(_debug:Boolean=false) {
			this._debug = _debug;
		}
		private var _debug:Boolean;
		
		public function setDebug(de:Boolean):void {
			this._debug = de;
		}
		
		public function log(...message):void {
			trace("log : ", message);
		}
		
		public function info(...message):void {
			trace("log : ", message)
		}
		
		public function error(...message):void {
			trace("error : ", message)
		}
		
		public function debug(...message):void {
			if (this._debug) {
				trace(,"debug : ", message)
			}
		}
	}
}