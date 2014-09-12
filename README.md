lua.class_constructor
=====================

A simple way to define class constructors in a similar way as you do in PHP

Example 1: Sintax 1
```lua
class{"Person", {
	name='Unknown',
	sayMyName = function(this)
		print(this.name)
	end,
	rename = function(this, name)
		this.name = name
		return this.name
	end
}}


mario = Person({name="Mario"})
luigi = Person({name="Luigi"})

mario:sayMyName()
mario:rename('Luigi')
mario:sayMyName()

luigi:sayMyName()
luigi:rename('Mario')
luigi:sayMyName()
```

Example 2: Sintax 2
```lua
class("Ball", {
	diameter = 10,
	whatsMySize = function(this)
		print(this.diameter)
	end
})


ball = Ball();
biggerBall = Ball({diameter=20})
ball:whatsMySize()
biggerBall:whatsMySize()
```
