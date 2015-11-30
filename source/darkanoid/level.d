module darkanoid.level;

import dsfml.graphics;
import darkanoid.resources, darkanoid.constants : resources;

class Level {
	
	static immutable Color[] BrickColors = [
		Color(204, 204, 204), // gray
		Color.Red,
		Color.Yellow,
		Color.Blue,
		Color.Magenta,
		Color.Green
	];

	enum Width = 15, Height = 25;

	private Sprite[Height][Width] grid;
	private int rowCursor, colCursor;

	/// Adds a whole row of bricks of color `col`
	void addRow(in Color col) {
		if (rowCursor + 1 == Height) {
			// Cannot add more rows
			return;
		}

		++rowCursor;

		for (colCursor = 0; colCursor < Height; ++colCursor) {

			assert(0 <= rowCursor && rowCursor < Height);
			assert(0 <= colCursor && colCursor < Width);

			grid[rowCursor][colCursor] = resources.newBrick(col);
		}
	}

	static Level simple(in int nRows = 5) {
		Level lv = new Level();
		
		for (int i = 0; i < nRows; ++i) {
			lv.addRow(BrickColors[i % BrickColors.length]);
		}

		return lv;
	}
}
