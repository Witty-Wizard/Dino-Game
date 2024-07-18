Jump = false
Duck= true

-- Main function
local function run(event)
    if event == EVT_EXIT_BREAK then
        return 1
    end

    lcd.clear()
    
    local triggerValue = getSourceValue(1)

    if triggerValue <=-100 then
        Jump = false
        Duck = true
    elseif triggerValue >=100 then
        Jump = true
        Duck = false
    else
        Jump = false
        Duck = false
    end

    if Jump then
        lcd.drawPixmap(5,LCD_H-25, "gfx/dino_default.bmp")
    elseif Duck then
        lcd.drawPixmap(5,LCD_H-12, "gfx/dino_ducking_leftstep.bmp")
    else
        lcd.drawPixmap(5,LCD_H-18, "gfx/dino_default.bmp")
    end
    

    return 0
end

return { run = run }
