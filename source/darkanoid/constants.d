module darkanoid.constants;

import darkanoid.resources;

enum Path : string {
	BrickTexture = "assets/graphics/brick.png",
	BatTexture = "assets/graphics/bat.png"
}

string getPath(in string path) {
	return appBasePath ~ "/" ~ path;
}

string appBasePath;

Resources resources;

static this() {
	resources = new Resources();
}
