local parse_treasure_type_table = {}

function parse_treasure_type_table.parse()
	-- **BIG NOTE** Generalize stuff out where frequently repeated.
	-- The table is on pages 7 to 10

	local table_data = {headings={}}
	local start_page_data = {
		filename = "pages/07.txt",
		title = "TREASURE TYPE TABLE",
		heading_line = 3,
		entries_start = 5,
		entries_end = 60
	}

	-- Load all lines
	local lines = {}
	for line in io.lines(start_page_data.filename) do
		table.insert(lines, line)
	end

	-- Verify title exists
	if not lines[1]:find(start_page_data.title) then
		print(string.format("*** Failed to find the title '%s' in the file '%s'", start_page_data.title, start_page_data.filename))
	end

	-- Parse headings
	local i = 1
	for word in lines[start_page_data.heading_line]:gmatch("%S+") do
		table_data.headings[i] = word
		i = i + 1
	end

	-- MANUAL OVERRIDE! Embellishments -> Decorative + Supernatural
	table_data.headings[5] = "Supernatural Embellishments"
	table.insert(table_data.headings, 5, "Decorative Embellishments")

	-- Parse lines
end

return parse_treasure_type_table
