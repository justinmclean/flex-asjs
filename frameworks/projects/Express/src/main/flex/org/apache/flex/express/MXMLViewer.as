////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.flex.express
{
	import org.apache.flex.core.UIBase;
	import org.apache.flex.html.Label;
	import org.apache.flex.events.Event;
	
	COMPILE::JS
	{
		import org.apache.flex.core.WrappedHTMLElement;
	}

	/**
	 * This class extends the standard Label and allows MXML content (ie, XML or HTML) 
	 * to be displayed.
	 */
	public class MXMLViewer extends org.apache.flex.html.Label
	{
		public function MXMLViewer()
		{
			super();
		}
		
		COMPILE::JS
		/**
		 * @private
		 */
		override public function set text(value:String):void
		{
			this.element.textContent = value;
			this.dispatchEvent('textChange');
		}
		
		/**
		 * @flexjsignorecoercion org.apache.flex.core.WrappedHTMLElement
		 */
		COMPILE::JS
		override protected function createElement():WrappedHTMLElement
		{			
			element = document.createElement('span') as WrappedHTMLElement;
			positioner = element;
			element.flexjs_wrapper = this;
			element.style.whiteSpace = "pre-line";
			element.style.cursor = "default";
			element.style.pointerEvents = "none";
			
			className = "MXMLViewer";
			typeNames = "MXMLViewer";
			
			return element;
		}
	}
}