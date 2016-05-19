module darkanoid.player;

import dsfml.system, dsfml.window, dsfml.graphics;
import darkanoid.interfaces, darkanoid.mixins;
import darkanoid.resources; 
import darkanoid.constants : resources; 
import darkanoid.entity;

class Player : Entity {
	
	mixin DefaultDrawable;

	private static enum INITIAL_SPEED = 10f;

	this(Window window) {
		sprite = resources.newPlayer();
		size = Vector2f(sprite.textureRect.width, sprite.textureRect.height);
		sprite.position = Vector2f((rightBound - sprite.textureRect.width) / 2.0,
				           window.size.y - sprite.textureRect.height * 2);
		m_speed = INITIAL_SPEED;
	}
}
