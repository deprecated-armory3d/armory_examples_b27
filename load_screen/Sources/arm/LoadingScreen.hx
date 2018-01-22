package arm;

// Custom loading screen, replaces the internal one

class LoadingScreen {

	static inline var barColor = 0xff2b43cf;
	static inline var barHeight = 20;

	public static function render(g:kha.graphics2.Graphics, assetsLoaded:Int, assetsTotal:Int) {
		g.color = barColor;
		g.fillRect(0, 0, iron.App.w() / assetsTotal * assetsLoaded, barHeight);
	}
}
