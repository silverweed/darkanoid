module darkanoid.resources;

import dsfml.graphics;
import darkanoid.constants;

package final class Resources {
	
	private Texture[string] textures;

	public Sprite newBrick(in Color col) {
		return newSprite(Assets.Brick);
	}

	public Sprite newPlayer() {
		return newSprite(Assets.Bat);
	}

	public Sprite newBall() {
		return newSprite(Assets.Ball);
	}

	private Sprite newSprite(in Assets asset) {
		const string name = asset[0];
		Texture texture;
		if (name in textures)
			texture = textures[name];
		else {
			texture = new Texture();
			if (!texture.loadFromFile(getGraphicsPath(asset))) {
				throw new Exception("Couldn't load " ~ name ~ " texture!");
			}
			textures[name] = texture;
		}
		auto sprite = new Sprite();
		sprite.setTexture(texture);
		const Vector2i dim = asset[1];
		sprite.textureRect = IntRect(0, 0, dim.x, dim.y);
		return sprite;
	}
}
