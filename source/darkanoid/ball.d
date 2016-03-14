module darkanoid.ball;

import dsfml.system, dsfml.window, dsfml.graphics;
import darkanoid.interfaces, darkanoid.mixins;
import darkanoid.resources;
import darkanoid.constants : resources;

class Ball : Drawable, Moveable {

	mixin DefaultMoveable;
	mixin DefaultDrawable;
	mixin SpritePosition;
	mixin Bounded;

	this(Window window) {
		sprite = resources.newBall();
		rightBound = window.size.x - sprite.textureRect.width;
		sprite.position = Vector2f((rightBound - sprite.textureRect.width) / 2.0,
				           window.size.y - sprite.textureRect.height * 4);
	}
}
