import std.stdio, std.path : dirName;
import dsfml.graphics;
import darkanoid;

void main(string[] args) {
	appBasePath = dirName(args[0]);

	debug stderr.writeln("base path: " ~ appBasePath);

	auto window = new RenderWindow(VideoMode(800, 600), "Hello");

	auto circle = new CircleShape(5);
	circle.position = Vector2f(100, 100);
	circle.fillColor = Color.Green;

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
			player.move(-player.speed);
		} else if (Keyboard.isKeyPressed(Keyboard.Key.Right)) {
			player.move(player.speed);
		}

		window.clear();
		window.draw(lv);
		window.draw(player);
		window.draw(ball);
		window.display();
	}
}
