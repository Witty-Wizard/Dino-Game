local jump = false
local duck = true
local pos = 0
local walk = true
local lastTriggerTime = 0 -- Variable to store the last trigger time
local delay = 20          -- Delay in milliseconds (2 seconds)

local function displayCactus1(xCord)
    lcd.drawPixmap(xCord + 0, LCD_H - 35, "gfx/cactus_1_1.bmp")
    lcd.drawPixmap(xCord + 45, LCD_H - 35, "gfx/cactus_1_2.bmp")
end

local function displayCactus2(xCord)
    lcd.drawPixmap(xCord + 0, LCD_H - 35, "gfx/cactus_2_1.bmp")
    lcd.drawPixmap(xCord + 45, LCD_H - 35, "gfx/cactus_2_2.bmp")
end

local function displayCactus3(xCord)
    lcd.drawPixmap(xCord + 0, LCD_H - 35, "gfx/cactus_3_1.bmp")
    lcd.drawPixmap(xCord + 45, LCD_H - 35, "gfx/cactus_3_2.bmp")
end

local function displayGround0(xCord)
    lcd.drawPixmap(xCord + 0, LCD_H - 35, "gfx/ground_0_1.bmp")
    lcd.drawPixmap(xCord + 45, LCD_H - 35, "gfx/ground_0_2.bmp")
end

local function displayGround1(xCord)
    lcd.drawPixmap(xCord + 0, LCD_H - 35, "gfx/ground_1_1.bmp")
    lcd.drawPixmap(xCord + 45, LCD_H - 35, "gfx/ground_1_2.bmp")
end

local function displayDino()
    if duck then
        if walk then
            lcd.drawPixmap(5, LCD_H - 23, "gfx/dino_ducking_leftstep.bmp")
        else
            lcd.drawPixmap(5, LCD_H - 23, "gfx/dino_ducking_rightstep.bmp")
        end
    elseif jump then
        if walk then
            lcd.drawPixmap(5, LCD_H - 64, "gfx/dino_leftstep.bmp")
        else
            lcd.drawPixmap(5, LCD_H - 64, "gfx/dino_rightstep.bmp")
        end
    else
        if walk then
            lcd.drawPixmap(5, LCD_H - 36, "gfx/dino_leftstep.bmp")
        else
            lcd.drawPixmap(5, LCD_H - 36, "gfx/dino_rightstep.bmp")
        end
    end
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
        walk = not walk
    end

    local triggerValue = getSourceValue(1)

    if triggerValue <= -100 then
        jump = false
        duck = true
    elseif triggerValue >= 100 then
        jump = true
        duck = false
    else
        jump = false
        duck = false
    end

    -- if jump then
    --     lcd.drawPixmap(5,LCD_H-25, "gfx/dino_default.bmp")
    -- elseif duck then
    --     lcd.drawPixmap(5,LCD_H-12, "gfx/dino_ducking_leftstep.bmp")
    -- else
    --     lcd.drawPixmap(5,LCD_H-18, "gfx/dino_default.bmp")
    -- end
    displayDino()



    return 0
end

return { init = init, run = run }
