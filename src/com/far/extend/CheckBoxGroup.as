package com.far.extend
{
	import com.bit101.components.CheckBox;

	public class CheckBoxGroup
	{
		private var _checkboxs:Vector.<CheckBox>;

		public function CheckBoxGroup(incheckboxs:Vector.<CheckBox>)
		{
			_checkboxs=incheckboxs||=new Vector.<CheckBox>();
		}

		/**返回选中的CheckBox*/
		public function getSelectCheckBox():Vector.<CheckBox>
		{
			var selectcheckbox:Vector.<CheckBox>=new Vector.<CheckBox>();
			;
			var len:int=_checkboxs.length;
			for (var i:int=0; i < len; i++)
			{
				if (_checkboxs[i].selected)
				{
					selectcheckbox.push(_checkboxs[i]);
				}
			}
			return selectcheckbox;
		}

		/**添加checkbox*/
		public function addCheckBox(checkbox:CheckBox):void
		{
			_checkboxs.push(checkbox);
		}

		/**移除checkbox*/
		public function removeCheckBox(checkbox:CheckBox):void
		{
			var index:int=_checkboxs.indexOf(checkbox);
			if (index != -1)
			{
				_checkboxs.splice(index, 1);
			}
		}

		public function get checkboxs():Vector.<CheckBox>
		{
			return _checkboxs;
		}

		public function set checkboxs(value:Vector.<CheckBox>):void
		{
			_checkboxs=value;
		}

	}
}
