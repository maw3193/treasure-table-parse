#!/usr/bin/lua

local parsers = {
	"parsers/treasure-type-table"
}

for _,v in ipairs(parsers) do
	local parser = require(v)
	parser:parse()
end
