module darkanoid.player;

import dsfml.system, dsfml.window, dsfml.graphics;
import darkanoid.interfaces, darkanoid.mixins;
import darkanoid.resources; 
import darkanoid.constants : resources; 

class Player : Drawable, Moveable {
	
	mixin DefaultMoveable;
	mixin DefaultDrawable;
	mixin SpritePosition;
	mixin Bounded;

	private static immutable float INITIAL_SPEED = 10;

	private float spd;

	this(Window window) {
		sprite = resources.newPlayer();
		rightBound = window.size.x - sprite.textureRect.width;
		sprite.position = Vector2f((rightBound - sprite.textureRect.width) / 2.0,
				           window.size.y - sprite.textureRect.height * 2);
		spd = INITIAL_SPEED;
	}

	@property const(float) speed() { return spd; }
}
