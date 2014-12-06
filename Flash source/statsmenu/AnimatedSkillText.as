﻿import Shared.GlobalFunc;
import Components.Meter;

class AnimatedSkillText extends MovieClip
{
	var SKILLS: Number = 18;
	var SKILL_ANGLE: Number = 20;
	var LocationsA: Array = [-150, -10, 130, 270, 410, 640, 870, 1010, 1150, 1290, 1430];
	var ThisInstance: AnimatedSkillText;

	function AnimatedSkillText()
	{
		super();
		ThisInstance = this;
	}

	function InitAnimatedSkillText(aSkillTextA: Array): Void
	{
		skse.Log("===== InitAnimatedSkillText =====");
		GlobalFunc.MaintainTextFormat();
		var originY: Number = this._y;
		var originX: Number = this._x;
		var skillCount: Number = 0;
		var skillWidth: Number = 150.0;
		var skillScale: Number = skillWidth / 216.45;
		for(var i: Number = 1; i < aSkillTextA.length; i += 5) {
			var SkillText = attachMovie("SkillText_mc", "SkillText" + i, getNextHighestDepth());
			SkillText.LabelInstance.html = true;
			SkillText.LabelInstance.htmlText = aSkillTextA[i].toString().toUpperCase() + " <font face=\'$EverywhereBoldFont\' size=\'24\' color=\'" + aSkillTextA[i + 2].toString() + "\'>" + aSkillTextA[i - 1].toString() + "</font>";
			var ShortBar: Meter = new Meter(SkillText.ShortBar);
			ShortBar.SetPercent(aSkillTextA[i + 1]);
			
			SkillText._xscale = skillScale;
			SkillText._yscale = skillScale;
			if(skillCount < 6) {
				SkillText._x = originX + skillWidth * (skillCount / 6);
				SkillText._y = originY;
			} else if(skillCount < 12) {
				SkillText._x = originX + skillWidth * (skillCount / (skillCount - 6));
				SkillText._y = originY + SkillText._height * 1;
			} else if(skillCount < 18) {
				SkillText._x = originX + skillWidth * (skillCount / (skillCount - 12));
				SkillText._y = originY + SkillText._height * 2;
			}
			SkillText._alpha = 75;
			
			skillCount += 1;
		}
		
		/*
		GlobalFunc.MaintainTextFormat();
		var arrayStride: Number = 4;
		for (var i: Number = 0; i < aSkillTextA.length; i += arrayStride) {
			var SkillText = attachMovie("SkillText_mc", "SkillText" + i / arrayStride, getNextHighestDepth());
			SkillText.LabelInstance.html = true;
			SkillText.LabelInstance.htmlText = aSkillTextA[i + 1].toString().toUpperCase() + " <font face=\'$EverywhereBoldFont\' size=\'24\' color=\'" + aSkillTextA[i + 3].toString() + "\'>" + aSkillTextA[i].toString() + "</font>";
			var ShortBar: Meter = new Meter(SkillText.ShortBar);
			ShortBar.SetPercent(aSkillTextA[i + 2]);
			SkillText._x = LocationsA[0];
		}
		*/
	}
	
	function highlightSkill(aIndex: Number): Void
	{
		/*
			0 <= aIndex <= 89 where the 90 values are split into 18 sets of 5. The second element in each set is the skill name.
			
			Each skill has 5 elements in StatsMenu.SkillStatsA (90 elements / 18 skills).
			
			Example:
			[0] = 15 (Skill level)
			[1] = Enchanting (Skill name)
			[2] = 0 (?)
			[3] = #FFFFFF (Color)
			[4] = 0 (?)
		*/
		
		for(var i: Number = 1; i < 90; i += 5) {
			ThisInstance["SkillText" + aIndex]._alpha = 75;
		}
		ThisInstance["SkillText" + aIndex]._alpha = 100;
	}

	function HideRing(): Void
	{
		/*
		for (var i: Number = 0; i < SKILLS; i++) {
			ThisInstance["SkillText" + i]._x = LocationsA[0];
		}
		*/
	}

	function SetAngle(aAngle: Number): Void
	{
		/*
		var skillAngle: Number = Math.floor(aAngle / SKILL_ANGLE);
		var __reg10: Number = aAngle % SKILL_ANGLE / SKILL_ANGLE;
		for (var i: Number = 0; i < SKILLS; i++) {
			var __reg11: Number = LocationsA.length - 2;
			var __reg5: Number  = Math.floor(__reg11 / 2) + 1;
			var __reg4: Number  = (skillAngle - __reg5 < 0) ? (skillAngle - __reg5 + SKILLS) : (skillAngle - __reg5);
			var __reg8: Number  = (skillAngle + __reg5 >= SKILLS) ? (skillAngle + __reg5 - SKILLS) : (skillAngle + __reg5);
			var __reg7: Boolean  = __reg4 > __reg8;
			if ((!__reg7 && (i > __reg4 && i <= __reg8)) || (__reg7 && (i > __reg4 || i <= __reg8))) {
				var locationAngleIdx: Number = 0;
				if (__reg7) {
					locationAngleIdx = (i <= __reg4) ? (i + (SKILLS - __reg4)) : (i - __reg4);
				} else {
					locationAngleIdx = (i - __reg4);
				}
				locationAngleIdx--;
				ThisInstance["SkillText" + i]._x = GlobalFunc.Lerp(LocationsA[locationAngleIdx], LocationsA[locationAngleIdx + 1], 1, 0, __reg10);
				var skillTextScale: Number = (locationAngleIdx == 4 ? (100 - __reg10) * 100 : (__reg10 * 100)) * 0.75 + 100;
				ThisInstance["SkillText" + i]._xscale = (locationAngleIdx == 5 || locationAngleIdx == 4) ? skillTextScale : 100;
				ThisInstance["SkillText" + i]._yscale = (locationAngleIdx == 5 || locationAngleIdx == 4) ? skillTextScale : 100;
				ThisInstance["SkillText" + i].ShortBar._yscale = (locationAngleIdx == 5 || locationAngleIdx == 4) ? (100 - (skillTextScale - 100) / 2.5) : 100;
			} else {
				ThisInstance["SkillText" + i]._x = LocationsA[0];
			}
		}
		*/
	}
}