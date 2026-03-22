Config = {}

-- IMPOSSIBILITADO DE UTILIZAR TARGET NO MOMENTO
Config.UseTarget = false -- Defina como verdadeiro para usar o Terceiro Olho, caso contrário, falso
Config.Webhook = "https://discord.com/api/webhooks/1346909469350563881/l4iycSE0RUCzAyDyxETRo4p86mxRYbr-_kNnFYpZI4O3ErL9IzR8DjVvmWY_u3GoR2Il"


-- Se verdadeiro, exibe a sobreposição da câmera corporal no usuário da tela da câmera corporal quando a câmera corporal está ligada
Config.SelfOverlay = true
Config.CustomImage = "xion.png"
Config.PlayBeep = true
Config.BeepSound = "beepbeep.wav"
Config.Jobs = {
    ['Police']  = { job = "Police", display = "Police", grade = 0 },
    ['Admin']  = { job = "Admin", display = "Admin", grade = 0 },
}

-- The Locations to access Body Cam menu, job is the required job from Config.Jobs above
Config.Locations = {
    { coords = vector3(440.3,-975.74,30.68), job = "Admin" },
    { coords = vector3(1144.38,752.63,154.36), job = "Police" },  
    { coords = vector3(437.03, -996.21, 30.69), job = "Police" },
}

-- -- -- Box zones if using Config.Target = true to access Body Cam menu, job is the required job from Config.Jobs above
-- Config.Targets = {
--     { coords = vector3(386.93, 792.48, 187.69), width = 1.5, height = 1.5, job = "Police"}, 
--     { coords = vector3(447.97, -973.38, 30.69), width = 1.5, height = 1.5, job = "Police" },  
--     { coords = vector3(437.03, -996.21, 30.69), width = 1.5, height = 1.5, job = "Police" },
-- }