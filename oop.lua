--[[
	Basic class constructor
	Helps you to define classes in a similar way as you do in PHP

	@author Christian V
	@version 0.1
	@param mixed `definition`
		If `definition` is a numeric indexed table then argument 1
		is the className and 2 is the object definition
		or if `definition` is a string then it will be the class name
	@param [table] `...`
		If the first argument is a string then second must be the
		object definition
	@return void
]]
function class(definition, ...)
	local name, self;
	if type(definition) == 'table' then
		name = definition[1]
		self = definition[2]
	else
		name = definition
		self = arg[1]
	end

	_G[name] = function(...)
		local classObject = {}
		for k,v in pairs(self) do
			if type(v) == 'function' then
				classObject[k] = function(this, ...)
					return v(this, ...)
				end
			else
				classObject[k] = v
			end
		end

		for k,v in ipairs(arg) do
			if type(v) == 'table' then
				for key, value in pairs(v) do
					classObject[key] = value
				end
			end
		end

		classObject.__index = self
		setmetatable(classObject, self)
		return classObject
	end
end
