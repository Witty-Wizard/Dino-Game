local jump = false
local duck = true
local pos = 0
local walk = true
local lastTriggerTimeWalk = 0
local lastTriggerTime = 0
local delay = 100
local delayWalk = 300
local over = false

local function displayCactus()
    lcd.drawPixmap(pos, LCD_H - 22, "gfx/cactus.bmp")
end

local function displayRIP()
    lcd.drawPixmap(5, LCD_H - 35, "gfx/dino_gameover.bmp")
end

local function displayDino()
    if duck then
        if walk then
            lcd.drawPixmap(5, LCD_H - 22, "gfx/dino_ducking_leftstep.bmp")
        else
            lcd.drawPixmap(5, LCD_H - 22, "gfx/dino_ducking_rightstep.bmp")
        end
    elseif jump then
        if walk then
            lcd.drawPixmap(5, LCD_H - 64, "gfx/dino_leftstep.bmp")
        else
            lcd.drawPixmap(5, LCD_H - 64, "gfx/dino_rightstep.bmp")
        end
    else
        if walk then
            lcd.drawPixmap(5, LCD_H - 35, "gfx/dino_leftstep.bmp")
        else
            lcd.drawPixmap(5, LCD_H - 35, "gfx/dino_rightstep.bmp")
        end
    end
end

local function init()
    -- Initialization code if any
    lastTriggerTime = getTime() -- Record the initial time
    lastTriggerTimeWalk = getTime()
end

-- Main function
local function run(event)
    if event == EVT_EXIT_BREAK then
        return 1
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

    lcd.clear()

    if not over then
        local currentTime = getTime()
        if (currentTime - lastTriggerTime) >= (delay / 10) then
            pos = pos - 3
            if (pos <= 0) then
                pos = LCD_W - 14
            end
            lastTriggerTime = currentTime
        end
        if (currentTime - lastTriggerTimeWalk) >= (delayWalk / 10) then
            walk = not walk
            lastTriggerTimeWalk = currentTime
        end

        if pos <= 32 and not jump then
            over = true
        end

        displayDino()
        displayCactus()
    else
        displayRIP()
        displayCactus()
        if jump or duck then
            over = false
            pos = LCD_W - 14
        end
    end



    return 0
end

return { init = init, run = run }
