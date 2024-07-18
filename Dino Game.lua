-- Hello World script for EdgeTX

-- Initialization function
local function init_func()
    -- Any initialization code can go here
end

-- Function to draw the screen content
local function run_func(event)
    -- Clear the screen
    lcd.clear()
    
    -- Draw "Hello World" at position (10, 10) with medium size text
    lcd.drawText(0, 0, "Hello World!!", SMALLSIZE)
    
    -- Refresh the display
    lcd.refresh()
    
    return 0
end

-- Return the init and run functions to EdgeTX
return { init=init_func, run=run_func }
