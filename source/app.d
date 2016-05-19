import std.stdio, std.path : dirName;
import dsfml.graphics;
import darkanoid;

void main(string[] args) {
	appBasePath = dirName(args[0]);

	debug stderr.writeln("base path: " ~ appBasePath);

	auto window = new RenderWindow(VideoMode(Entity.MAX_X, Entity.MAX_Y), "Hello");

	auto lv = Level.simple();
	auto player = new Player(window);
	auto ball = new Ball(window);

	while (window.isOpen) {
		Event event;
		while (window.pollEvent(event)) {
			switch (event.type) {
			case Event.EventType.Closed:
				window.close();
				break;
			case Event.EventType.KeyPressed:
				if (event.key.code == Keyboard.Key.Q)
					window.close();
				break;
			default: 
				break;
			}
		}

		if (Keyboard.isKeyPressed(Keyboard.Key.Left)) {
			player.move(-player.speed[0]);
		} else if (Keyboard.isKeyPressed(Keyboard.Key.Right)) {
			player.move(player.speed[0]);
		}

		ball.move();

		window.clear();
		window.draw(lv);
		window.draw(player);
		window.draw(ball);
		window.display();
	}
}
