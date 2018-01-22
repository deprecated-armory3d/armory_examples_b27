package arm;

// Custom loading screen, replaces the internal one

class LoadingScreen {

	static inline var barColor = 0xff4c6ea5;
	static inline var barHeight = 20;

	static var first = true;
	static var bunny:kha.Image = null;

	public static function render(g:kha.graphics2.Graphics, assetsLoaded:Int, assetsTotal:Int) {
		
		// First run, load bundled image
		if (first) {
			first = false;
			iron.data.Data.getImage("bunny.png", function(img:kha.Image) {
				bunny = img;
			});
		}

		// Draw loaded image
		if (bunny != null) {
			g.color = 0xffffffff;
			g.drawImage(bunny, iron.App.w() / 2 - bunny.width / 2, iron.App.h() / 2 - bunny.height / 2);
		}

		// Draw bar
		g.color = barColor;
		g.fillRect(0, 0, iron.App.w() / assetsTotal * assetsLoaded, barHeight);
	}
}
