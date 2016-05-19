module darkanoid.ball;

import dsfml.system, dsfml.window, dsfml.graphics;
import darkanoid.interfaces, darkanoid.mixins;
import darkanoid.resources;
import darkanoid.constants : resources;
import darkanoid.entity;

class Ball : Entity {

	mixin DefaultDrawable;

	this(Window window) {
		sprite = resources.newBall();
		size = Vector2f(sprite.textureRect.width, sprite.textureRect.height);
		position = Vector2f((rightBound - sprite.textureRect.width) / 2.0,
				           window.size.y - sprite.textureRect.height * 4);
		m_speed = randomInitialSpeed();
	}

	private static float[2] randomInitialSpeed() {
		import std.random;
		return [uniform(0.1f, 1f), uniform(0.1f, 1f)];
	}
}
