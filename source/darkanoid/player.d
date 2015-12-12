module darkanoid.player;

import std.algorithm.comparison : clamp;
import dsfml.system, dsfml.window, dsfml.graphics;
import darkanoid.resources, darkanoid.constants : resources;

class Player : Drawable {
	
	private const uint rightBound;
	private Sprite sprite;

	this(Window window) {
		rightBound = window.size.x;
		sprite = resources.newPlayer();
		sprite.position = Vector2f((rightBound - sprite.textureRect.width) / 2.0,
				           window.size.y - sprite.textureRect.height * 2);
	}
	
	@property Vector2f pos() { return sprite.position; }

	public void move(in float x) {
		sprite.position = Vector2f(clamp(sprite.position.x + x, 
					0f, cast(float) rightBound), sprite.position.y);
	}

	public void draw(RenderTarget target, RenderStates states) {
		target.draw(sprite, states);	
	}
}
