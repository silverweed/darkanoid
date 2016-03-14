module darkanoid.level;

debug import std.stdio;
import dsfml.graphics;
import darkanoid.resources, darkanoid.constants : resources;

class Level : Drawable {
	
	static immutable Color[] BrickColors = [
		Color(204, 204, 204), // gray
		Color.Red,
		Color.Yellow,
		Color.Blue,
		Color.Magenta,
		Color.Green
	];

	enum Width = 15, Height = 25;

	private Sprite[Width][Height] grid;
	private int rowCursor, colCursor;

	/// Adds a whole row of bricks of color `col`
	void addRow(in Color col) {
		if (rowCursor + 1 == Height) {
			// Cannot add more rows
			return;
		}

		++rowCursor;

		for (colCursor = 0; colCursor < Width; ++colCursor) {

			assert(0 <= rowCursor && rowCursor < Height);
			assert(0 <= colCursor && colCursor < Width);

			auto brick = resources.newBrick(col);
			brick.position = Vector2f(colCursor * 100, rowCursor * 21);
			grid[rowCursor][colCursor] = brick;
		}
	}

	static Level simple(in int nRows = 5) {
		Level lv = new Level;
		
		for (int i = 0; i < nRows; ++i) {
			lv.addRow(BrickColors[i % BrickColors.length]);
		}

		return lv;
	}

	void draw(RenderTarget target, RenderStates states) {
		for (int row = 0; row < Height; ++row) {
			for (int col = 0; col < Width; ++col) {
				auto sprite = grid[row][col];
				if (sprite !is null) {
					target.draw(sprite, states);
				}
			}
		}
	}
}
