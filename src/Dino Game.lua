Jump = false
Duck = true
local pos = 0;
local lastTriggerTime = 0 -- Variable to store the last trigger time
local delay = 20          -- Delay in milliseconds (2 seconds)

local function displayCactus1(xCord)
    lcd.drawPixmap(xCord + 0, LCD_H - 38, "gfx/cactus_1_1.bmp")
    lcd.drawPixmap(xCord + 45, LCD_H - 38, "gfx/cactus_1_2.bmp")
end

local function displayCactus2(xCord)
    lcd.drawPixmap(xCord + 0, LCD_H - 38, "gfx/cactus_2_1.bmp")
    lcd.drawPixmap(xCord + 45, LCD_H - 38, "gfx/cactus_2_2.bmp")
end

local function displayCactus3(xCord)
    lcd.drawPixmap(xCord + 0, LCD_H - 38, "gfx/cactus_3_1.bmp")
    lcd.drawPixmap(xCord + 45, LCD_H - 38, "gfx/cactus_3_2.bmp")
end

local function displayGround0(xCord)
    lcd.drawPixmap(xCord + 0, LCD_H - 38, "gfx/ground_0_1.bmp")
    lcd.drawPixmap(xCord + 45, LCD_H - 38, "gfx/ground_0_2.bmp")
end

local function displayGround1(xCord)
    lcd.drawPixmap(xCord + 0, LCD_H - 38, "gfx/ground_1_1.bmp")
    lcd.drawPixmap(xCord + 45, LCD_H - 38, "gfx/ground_1_2.bmp")
end

local function displayDino()
    lcd.drawPixmap(5, LCD_H - 36, "gfx/dino_default.bmp")
end

local function init()
    -- Initialization code if any
    lastTriggerTime = getTime() -- Record the initial time
end

-- Main function
local function run(event)
    if event == EVT_EXIT_BREAK then
        return 1
    end



    lcd.clear()
    local currentTime = getTime()
    if (currentTime - lastTriggerTime) >= (delay / 10) then
        pos = pos - 1
        lastTriggerTime = currentTime
    end

    local triggerValue = getSourceValue(1)

    if triggerValue <= -100 then
        Jump = false
        Duck = true
    elseif triggerValue >= 100 then
        Jump = true
        Duck = false
    else
        Jump = false
        Duck = false
    end

    -- if Jump then
    --     lcd.drawPixmap(5,LCD_H-25, "gfx/dino_default.bmp")
    -- elseif Duck then
    --     lcd.drawPixmap(5,LCD_H-12, "gfx/dino_ducking_leftstep.bmp")
    -- else
    --     lcd.drawPixmap(5,LCD_H-18, "gfx/dino_default.bmp")
    -- end
    displayGround0(pos+90)
    displayGround1(pos)
    displayDino()



    return 0
end

return { init = init, run = run }
