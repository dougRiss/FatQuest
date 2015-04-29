package game.state 
{
	import assets.Asset;
	import org.flixel.FlxState;
	import org.flixel.FlxButton;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	
	/**
	 * This state is reached when you win the whole game!
	 */
	public class WinningState extends FlxState
	{
		private var score:int;
		private var level:int;
		private var timer:int;
		private var difficulty:int;
		
		/**
		 * Constructor
		 * @param	timer - how much time you've had left in the previous round
		 * @param	score - Your cumulative score so far
		 * @param	level - the level you just beat.
		 */
		public function WinningState(timer:int, score:int, level:int, difficulty:int) {
			this.timer = timer;
			this.score = score;
			this.level = level;
			this.difficulty = difficulty;
		}
		
		/**
		 * Create the state.
		 */
		override public function create():void {
			FlxG.bgColor = 0xff000000;
			FlxG.play(Asset.woop_1MP3);
			
			var title:FlxText;
			title = new FlxText( 0, 0, FlxG.width, "YOU WIN!");
			title.setFormat (null, 15, 0xFFFFFFFF, "center");
			add(title);
			
			var scoreBreakdown:FlxText;
			scoreBreakdown = new FlxText( 0, 45, FlxG.width, "Final Score: " + ((score + (timer * 100)) * difficulty));
			scoreBreakdown.setFormat (null, 12, 0xFFFFFFFF, "center");
			add(scoreBreakdown);
			
			var mainMenu:FlxButton;
			mainMenu = new FlxButton(FlxG.width/2-40, (FlxG.height / 2), "Main Menu", function ():void 
			{
				FlxG.switchState(new SplashState());
			});
			add(mainMenu)
			
			var levelcodetext:FlxText;
			levelcodetext = new FlxText(0, FlxG.height - 40, FlxG.width, "Thanks for playing!");
			levelcodetext.setFormat (null, 8, 0xFFFFFFFF, "center");
			add(levelcodetext);
		}
	}

}