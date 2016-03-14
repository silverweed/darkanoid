module darkanoid.constants;

import std.typecons;
import darkanoid.resources;
import dsfml.system : Vector2i;

enum Assets : Tuple!(string, Vector2i) {
	Brick = tuple("brick.png", Vector2i(100, 21)),
	Bat = tuple("bat.png", Vector2i(100, 17)),
	Ball = tuple("ball.png", Vector2i(50, 50)),
}

immutable(string) getPath(in string path) {
	return appBasePath ~ "/" ~ path;
}

immutable(string) getGraphicsPath(in Assets asset) {
	return appBasePath ~ "/assets/graphics/" ~ asset[0];
}

string appBasePath;

Resources resources;

static this() {
	resources = new Resources;
}
