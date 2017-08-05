function Initialize()

	msMeasureCount = SKIN:GetMeasure("MeasureCount")
	currentTable = {}
	
end -- Initialize

function Update()

	fileCount = msMeasureCount:GetValue()
	
	if #currentTable == 0 then
		currentTable = RandomOrder(fileCount)
	end
	
	return table.remove(currentTable)
	
end	-- Update

function RandomOrder(inputCount)

	assert(type(inputCount) == 'number', ('RandomOrder must receive a number. Received %s instead.'):format(type(inputCount)))

	local sortedTable, unsortedTable = {}, {}
	
	for inc = 1, inputCount do
		unsortedTable[inc] = inc
	end
	
	math.randomseed(tonumber(tostring(os.time()):reverse():sub(1,6)))

	while #unsortedTable > 0 do
		table.insert(sortedTable, table.remove(unsortedTable, math.random(1, #unsortedTable)))
	end
	
	unsortedTable = nil
	
	return sortedTable	
	
end -- RandomOrder	