package meta;

import flixel.math.FlxMath;
import openfl.utils.Assets;
import meta.state.PlayState;
import sys.FileSystem;

using StringTools;

class CoolUtil
{
	// tymgus45
	public static var difficultyArray:Array<String> = ['EASY', "NORMAL", "HARD"];
	public static var difficultyLength = difficultyArray.length;

	public static function difficultyFromNumber(number:Int):String
	{
		return difficultyArray[number];
	}

	public static function dashToSpace(string:String):String
	{
		return string.replace("-", " ");
	}

	inline public static function clamp(value:Float, min:Float, max:Float):Float
	{
		return Math.max(min, Math.min(max, value));
	}

	public static function spaceToDash(string:String):String
	{
		return string.replace(" ", "-");
	}

	public static function swapSpaceDash(string:String):String
	{
		return StringTools.contains(string, '-') ? dashToSpace(string) : spaceToDash(string);
	}

	public static function coolTextFile(path:String):Array<String>
	{
		var daList:Array<String> = Assets.getText(path).trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	public static function getOffsetsFromTxt(path:String):Array<Array<String>>
	{
		var firstArray:Array<String> = Assets.getText(path).split('\n');
		var swagOffsets:Array<Array<String>> = [];

		for (i in firstArray)
			swagOffsets.push(i.split(' '));

		return swagOffsets;
	}

	public static function returnAssetsLibrary(library:String, ?subDir:String = 'assets/images'):Array<String>
	{
		var libraryArray:Array<String> = [];

		for (folder in Assets.list().filter(files -> files.contains('$subDir/$library')))
		{
			// simulating da FileSystem.readDirectory?
			var daFolder:String = folder.replace('$subDir/$library', '');
			daFolder.split(daFolder.substring(daFolder.indexOf('/'), daFolder.length)).join(''); // fancy
			if (!daFolder.startsWith('.'))
				libraryArray.push(daFolder);
		}

		return libraryArray;
	}

	public static function getAnimsFromTxt(path:String):Array<Array<String>>
	{
		var firstArray:Array<String> = Assets.getText(path).split('\n');
		var swagOffsets:Array<Array<String>> = [];

		for (i in firstArray)
		{
			swagOffsets.push(i.split('--'));
		}

		return swagOffsets;
	}

	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
		{
			dumbArray.push(i);
		}
		return dumbArray;
	}

	public static var lerpSnap:Bool = false;
	public static function fakeLerp(val1:Float, val2:Float, ratio:Float) {
		if (lerpSnap)
			return FlxMath.lerp(val1, val2, 1);
		return FlxMath.lerp(val1, val2, ratio);
	}
}
