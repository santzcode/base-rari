
function Utils:ShowMainScreen()
    BeginScaleformMovieMethod(self.Scaleform, 'SHOW_SCREEN')
    ScaleformMovieMethodAddParamInt(0)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(Utils.Scaleform, 'SET_MAIN_EVENT_IN_PROGRESS')
    ScaleformMovieMethodAddParamBool(true)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(Utils.Scaleform, 'CLEAR_ALL')
    EndScaleformMovieMethod()
end

---@param cooldown integer
---(in seconds).
function Utils:SetMainScreenCooldown(cooldown)
    BeginScaleformMovieMethod(self.Scaleform, 'SET_COUNTDOWN')
    ScaleformMovieMethodAddParamInt(cooldown)
    EndScaleformMovieMethod()
end

function Utils:SetNotAvailable()
    BeginScaleformMovieMethod(self.Scaleform, 'SHOW_ERROR')

    BeginTextCommandScaleformString('IT_ERROR_TITLE')
    EndTextCommandScaleformString()

    BeginTextCommandScaleformString('IT_ERROR_MSG')
    EndTextCommandScaleformString()

    EndScaleformMovieMethod()
end