module darkanoid.entity;

import dsfml.system;

class Entity {
	static enum MAX_X = 800;
	static enum MAX_Y = 600;

	private Vector2f m_speed;
	private Vector2f m_position;
	private Vector2f m_size;

	this(in Vector2f pos) {
		m_position = pos;
	}

	@property
	public Vector2f position() const { return m_position; }

	@property
	public Vector2f speed(in Vector2f spd) { return m_speed = spd; }

	public void step() {
		import math.algorithm;

		m_position = Vector2f(
				clamp(position.x + speed.x, 0f, MAX_X - size.x),
				clamp(position.y + speed.y, 0f, MAX_Y - size.y));
	}
}
