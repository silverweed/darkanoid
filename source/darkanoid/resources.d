module darkanoid.resources;

import dsfml.graphics;
import darkanoid.constants;

package class Resources {
	
	Texture[string] textures;

	public Sprite newBrick(in Color col) {
		Texture texture;
		if ("brick_" ~ col.toString in textures)
			texture = textures["brick_" ~ col.toString];
		else {
			texture = new Texture();
			if (!texture.loadFromFile(getPath(Path.BrickTexture))) {
				throw new Exception("Couldn't load brick texture!");
			}
			textures["brick_" ~ col.toString] = texture;
		}
		auto sprite = new Sprite();
		sprite.setTexture(texture);
		sprite.textureRect = IntRect(0, 0, 100, 21);
		sprite.color = col;
		return sprite;
	}

	public Sprite newPlayer() {
		Texture texture;
		if ("player" in textures)
			texture = textures["player"];
		else {
			texture = new Texture();
			if (!texture.loadFromFile(getPath(Path.BatTexture))) {
				throw new Exception("Couldn't load player texture!");
			}
			textures["player"] = texture;
		}
		auto sprite = new Sprite();
		sprite.setTexture(texture);
		sprite.textureRect = IntRect(0, 0, 100, 17);
		return sprite;
	}
}
