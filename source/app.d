import std.stdio;
import dsfml.graphics;
import darkanoid;

void main(string[] args) {
	appBasePath = args[0];

	auto window = new RenderWindow(VideoMode(800, 600), "Hello");

	auto circle = new CircleShape(5);
	circle.position = Vector2f(100, 100);
	circle.fillColor = Color.Green;

	while (window.isOpen) {
		Event event;
		while (window.pollEvent(event)) {
			switch (event.type) {
			case Event.EventType.Closed:
				window.close();
				break;
			default: 
				break;
			}
		}

		window.clear();
		window.draw(circle);
		window.display();
	}
}
