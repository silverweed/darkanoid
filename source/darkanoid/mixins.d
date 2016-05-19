module darkanoid.mixins;

import dsfml.graphics;
import dsfml.system : Vector2f;

mixin template DefaultDrawable() {
	protected Sprite sprite;

	public void draw(RenderTarget target, RenderStates states) {
		sprite.position = position;
		target.draw(sprite, states);	
	}
}
