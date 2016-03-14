module darkanoid.mixins;

import std.algorithm : clamp;
import dsfml.graphics;
import dsfml.system : Vector2f;

mixin template DefaultMoveable() {
	public void move(in float x) {
		sprite.position = Vector2f(clamp(sprite.position.x + x, 
					0f, cast(float) rightBound), 
					sprite.position.y);
	}
}

mixin template DefaultDrawable() {
	protected Sprite sprite;

	public void draw(RenderTarget target, RenderStates states) {
		target.draw(sprite, states);	
	}
}

mixin template SpritePosition() {
	@property Vector2f pos() { return sprite.position; }
}

mixin template Bounded(alias right = 0, alias left = 0) {
	private uint rightBound = right;
	private uint leftBound = left;
}
