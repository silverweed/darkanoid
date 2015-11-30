module darkanoid.resources;

import dsfml.graphics;
import darkanoid.constants;

package class Resources {
	
	Texture[string] textures;

	public Sprite newBrick(in Color col) {
		Texture texture;
		if (col.toString in textures)
			texture = textures[col.toString];
		else {
			texture = new Texture();
			textures[col.toString] = texture;
		}
		if (!texture.loadFromFile(getPath(Path.BrickTexture))) {
			throw new Exception("Couldn't load brick texture!");
		}
		auto sprite = new Sprite();
		sprite.setTexture(texture);
		//sprite.setColor(col);
		return sprite;
	}
}
