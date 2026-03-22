RegisterNUICallback('SetCostume', function(data, cb)
    if data and data.preset then
        local ped = PlayerPedId()
        local model = GetEntityModel(ped)
        
        -- Verificar se é personagem masculino ou feminino
        local isMale = (model == GetHashKey("mp_m_freemode_01"))
        local preset = isMale and data.preset.male or data.preset.female
        
        if preset and type(preset) == "table" and next(preset) ~= nil then
            -- Aplicar preset usando números específicos
            ApplyPresetToPlayer(preset)
            TriggerEvent("Notify", "verde", "Preset aplicado com sucesso!", 3000)
            cb(true)
        elseif preset and type(preset) == "string" and preset ~= "" and preset ~= "{}" then
            -- Tentar interpretar como JSON primeiro
            local success, parsed = pcall(json.decode, preset)
            if success and type(parsed) == "table" then
                ApplyPresetToPlayer(parsed)
                TriggerEvent("Notify", "verde", "Preset aplicado com sucesso!", 3000)
                cb(true)
            else
                -- Tentar interpretar como formato antigo (Lua array)
                local convertedPreset = ParseOldFormatPreset(preset)
                if convertedPreset then
                    ApplyPresetToPlayer(convertedPreset)
                    TriggerEvent("Notify", "verde", "Preset aplicado com sucesso!", 3000)
                    cb(true)
                else
                    TriggerEvent("Notify", "vermelho", "Erro ao interpretar preset!", 3000)
                    cb(false)
                end
            end
        else
            if not preset or preset == "" then
                TriggerEvent("Notify", "vermelho", "Nenhum preset configurado para " .. (isMale and "masculino" or "feminino") .. "! Configure primeiro.", 5000)
            else
                TriggerEvent("Notify", "vermelho", "Preset inválido! Formato incorreto.", 3000)
            end
            cb(false)
        end
    else
        TriggerEvent("Notify", "vermelho", "Nenhum preset fornecido!", 3000)
        cb(false)
    end
end)

-- Função para interpretar formato antigo de preset
function ParseOldFormatPreset(presetString)
    local convertedPreset = {}
    
    -- Extrair valores usando regex melhorado para o formato antigo
    local pants = presetString:match('"pants".-item%s*=%s*(%-?%d+)')
    local shoes = presetString:match('"shoes".-item%s*=%s*(%-?%d+)')
    local tshirt = presetString:match('"tshirt".-item%s*=%s*(%-?%d+)')
    local torso = presetString:match('"torso".-item%s*=%s*(%-?%d+)')
    local accessory = presetString:match('"accessory".-item%s*=%s*(%-?%d+)')
    local arms = presetString:match('"arms".-item%s*=%s*(%-?%d+)')
    local hat = presetString:match('"hat".-item%s*=%s*(%-?%d+)')
    local glass = presetString:match('"glass".-item%s*=%s*(%-?%d+)')
    
    -- Converter para formato novo
    if pants then convertedPreset.pants = { item = tonumber(pants), texture = 0 } end
    if shoes then convertedPreset.shoes = { item = tonumber(shoes), texture = 0 } end
    if tshirt then convertedPreset.tshirt = { item = tonumber(tshirt), texture = 0 } end
    if torso then convertedPreset.torso = { item = tonumber(torso), texture = 0 } end
    if accessory then convertedPreset.accessory = { item = tonumber(accessory), texture = 0 } end
    if arms then convertedPreset.arms = { item = tonumber(arms), texture = 0 } end
    if hat then convertedPreset.hat = { item = tonumber(hat), texture = 0 } end
    if glass then convertedPreset.glass = { item = tonumber(glass), texture = 0 } end
    
    -- Adicionar valores padrão para campos ausentes
    convertedPreset.vest = convertedPreset.vest or { item = 0, texture = 0 }
    convertedPreset.bracelet = convertedPreset.bracelet or { item = -1, texture = 0 }
    convertedPreset.backpack = convertedPreset.backpack or { item = 0, texture = 0 }
    convertedPreset.decals = convertedPreset.decals or { item = 0, texture = 0 }
    convertedPreset.mask = convertedPreset.mask or { item = 0, texture = 0 }
    convertedPreset.watch = convertedPreset.watch or { item = -1, texture = 0 }
    convertedPreset.ear = convertedPreset.ear or { item = -1, texture = 0 }
    
    -- Verificar se pelo menos um item foi encontrado
    if next(convertedPreset) ~= nil then
        return convertedPreset
    else
        return nil
    end
end

-- Função para aplicar preset com números específicos
function ApplyPresetToPlayer(preset)
    local ped = PlayerPedId()
    
    -- Verificar se o ped existe
    if not DoesEntityExist(ped) then
        return false
    end
    
    -- Aplicar cada peça de roupa
    if preset.hat and preset.hat.item ~= nil then
        if preset.hat.item == -1 then
            ClearPedProp(ped, 0)  -- Remove chapéu
        else
            SetPedPropIndex(ped, 0, preset.hat.item, preset.hat.texture or 0, true)
        end
    end
    
    if preset.pants and preset.pants.item ~= nil then
        SetPedComponentVariation(ped, 4, preset.pants.item, preset.pants.texture or 0, 0)
    end
    
    if preset.vest and preset.vest.item ~= nil then
        SetPedComponentVariation(ped, 9, preset.vest.item, preset.vest.texture or 0, 0)
    end
    
    if preset.bracelet and preset.bracelet.item ~= nil then
        if preset.bracelet.item == -1 then
            ClearPedProp(ped, 7)  -- Remove pulseira
        else
            SetPedPropIndex(ped, 7, preset.bracelet.item, preset.bracelet.texture or 0, true)
        end
    end
    
    if preset.backpack and preset.backpack.item ~= nil then
        SetPedComponentVariation(ped, 5, preset.backpack.item, preset.backpack.texture or 0, 0)
    end
    
    if preset.decals and preset.decals.item ~= nil then
        SetPedComponentVariation(ped, 10, preset.decals.item, preset.decals.texture or 0, 0)
    end
    
    if preset.mask and preset.mask.item ~= nil then
        SetPedComponentVariation(ped, 1, preset.mask.item, preset.mask.texture or 0, 0)
    end
    
    if preset.shoes and preset.shoes.item ~= nil then
        SetPedComponentVariation(ped, 6, preset.shoes.item, preset.shoes.texture or 0, 0)
    end
    
    if preset.tshirt and preset.tshirt.item ~= nil then
        SetPedComponentVariation(ped, 8, preset.tshirt.item, preset.tshirt.texture or 0, 0)
    end
    
    if preset.torso and preset.torso.item ~= nil then
        SetPedComponentVariation(ped, 11, preset.torso.item, preset.torso.texture or 0, 0)
    end
    
    if preset.accessory and preset.accessory.item ~= nil then
        SetPedComponentVariation(ped, 7, preset.accessory.item, preset.accessory.texture or 0, 0)
    end
    
    if preset.watch and preset.watch.item ~= nil then
        if preset.watch.item == -1 then
            ClearPedProp(ped, 6)  -- Remove relógio
        else
            SetPedPropIndex(ped, 6, preset.watch.item, preset.watch.texture or 0, true)
        end
    end
    
    if preset.arms and preset.arms.item ~= nil then
        SetPedComponentVariation(ped, 3, preset.arms.item, preset.arms.texture or 0, 0)
    end
    
    if preset.glass and preset.glass.item ~= nil then
        if preset.glass.item == -1 then
            ClearPedProp(ped, 1)  -- Remove óculos
        else
            SetPedPropIndex(ped, 1, preset.glass.item, preset.glass.texture or 0, true)
        end
    end
    
    if preset.ear and preset.ear.item ~= nil then
        if preset.ear.item == -1 then
            ClearPedProp(ped, 2)  -- Remove brinco
        else
            SetPedPropIndex(ped, 2, preset.ear.item, preset.ear.texture or 0, true)
        end
    end
    
end

-- COMANDOS PARA DESCOBRIR NÚMEROS DAS ROUPAS
-- ==========================================

-- Função para capturar preset atual do jogador
function CaptureCurrentPreset()
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    local isMale = (model == GetHashKey("mp_m_freemode_01"))
    
    -- Obter componentes atuais
    local preset = {
        hat = { item = GetPedPropIndex(ped, 0), texture = 0 },
        pants = { item = GetPedDrawableVariation(ped, 4), texture = 0 },
        vest = { item = GetPedDrawableVariation(ped, 9), texture = 0 },
        bracelet = { item = GetPedPropIndex(ped, 7), texture = 0 },
        backpack = { item = GetPedDrawableVariation(ped, 5), texture = 0 },
        decals = { item = GetPedDrawableVariation(ped, 10), texture = 0 },
        mask = { item = GetPedDrawableVariation(ped, 1), texture = 0 },
        shoes = { item = GetPedDrawableVariation(ped, 6), texture = 0 },
        tshirt = { item = GetPedDrawableVariation(ped, 8), texture = 0 },
        torso = { item = GetPedDrawableVariation(ped, 11), texture = 0 },
        accessory = { item = GetPedDrawableVariation(ped, 7), texture = 0 },
        watch = { item = GetPedPropIndex(ped, 6), texture = 0 },
        arms = { item = GetPedDrawableVariation(ped, 3), texture = 0 },
        glass = { item = GetPedPropIndex(ped, 1), texture = 0 },
        ear = { item = GetPedPropIndex(ped, 2), texture = 0 }
    }
    
    return preset, isMale
end

-- Callback para capturar preset atual
RegisterNUICallback('CaptureCurrentPreset', function(data, cb)
    local preset, isMale = CaptureCurrentPreset()
    
    -- Retornar o preset no formato correto
    local result = {
        preset = {
            male = isMale and preset or {},
            female = not isMale and preset or {}
        }
    }
    
    cb(result)
end)

-- Callback para aplicar preset pré-definido
RegisterNUICallback('ApplyPresetTemplate', function(data, cb)
    if data and data.template then
        local ped = PlayerPedId()
        local model = GetEntityModel(ped)
        local isMale = (model == GetHashKey("mp_m_freemode_01"))
        
        local template = data.template
        
        -- Aplicar preset baseado no template
        if template == "policia" then
            if isMale then
                -- Preset polícia masculino
                SetPedComponentVariation(ped, 4, 23, 0, 0)  -- Calça preta
                SetPedComponentVariation(ped, 6, 25, 0, 0)  -- Sapato preto
                SetPedComponentVariation(ped, 8, 24, 0, 0)  -- Camiseta azul
                SetPedComponentVariation(ped, 11, 24, 0, 0) -- Torso azul
                SetPedComponentVariation(ped, 7, 20, 0, 0)  -- Acessório
                SetPedComponentVariation(ped, 9, 16, 0, 0)  -- Colete
                SetPedPropIndex(ped, 0, -1, 0, true)        -- Sem chapéu
                SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
            else
                -- Preset polícia feminino
                SetPedComponentVariation(ped, 4, 17, 0, 0)  -- Calça preta
                SetPedComponentVariation(ped, 6, 25, 0, 0)  -- Sapato preto
                SetPedComponentVariation(ped, 8, 22, 0, 0)  -- Camiseta azul
                SetPedComponentVariation(ped, 11, 23, 0, 0) -- Torso azul
                SetPedComponentVariation(ped, 7, 14, 0, 0)  -- Acessório
                SetPedComponentVariation(ped, 9, 18, 0, 0)  -- Colete
                SetPedPropIndex(ped, 0, -1, 0, true)        -- Sem chapéu
                SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
            end
            TriggerEvent("Notify", "verde", "Preset de Polícia aplicado!", 3000)
        elseif template == "bombeiro" then
            if isMale then
                -- Preset bombeiro masculino
                SetPedComponentVariation(ped, 4, 30, 0, 0)  -- Calça vermelha
                SetPedComponentVariation(ped, 6, 35, 0, 0)  -- Bota de bombeiro
                SetPedComponentVariation(ped, 8, 30, 0, 0)  -- Camiseta vermelha
                SetPedComponentVariation(ped, 11, 30, 0, 0) -- Torso vermelho
                SetPedComponentVariation(ped, 7, 25, 0, 0)  -- Acessório
                SetPedComponentVariation(ped, 9, 25, 0, 0)  -- Colete vermelho
                SetPedPropIndex(ped, 0, 45, 0, true)        -- Capacete
                SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
            else
                -- Preset bombeiro feminino
                SetPedComponentVariation(ped, 4, 28, 0, 0)  -- Calça vermelha
                SetPedComponentVariation(ped, 6, 35, 0, 0)  -- Bota de bombeiro
                SetPedComponentVariation(ped, 8, 28, 0, 0)  -- Camiseta vermelha
                SetPedComponentVariation(ped, 11, 28, 0, 0) -- Torso vermelho
                SetPedComponentVariation(ped, 7, 22, 0, 0)  -- Acessório
                SetPedComponentVariation(ped, 9, 22, 0, 0)  -- Colete vermelho
                SetPedPropIndex(ped, 0, 45, 0, true)        -- Capacete
                SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
            end
            TriggerEvent("Notify", "verde", "Preset de Bombeiro aplicado!", 3000)
        elseif template == "medico" then
            if isMale then
                -- Preset médico masculino
                SetPedComponentVariation(ped, 4, 20, 0, 0)  -- Calça branca
                SetPedComponentVariation(ped, 6, 15, 0, 0)  -- Sapato branco
                SetPedComponentVariation(ped, 8, 15, 0, 0)  -- Camiseta branca
                SetPedComponentVariation(ped, 11, 15, 0, 0) -- Torso branco
                SetPedComponentVariation(ped, 7, 10, 0, 0)  -- Acessório
                SetPedComponentVariation(ped, 9, 12, 0, 0)  -- Colete branco
                SetPedComponentVariation(ped, 1, 50, 0, 0)  -- Máscara médica
                SetPedPropIndex(ped, 0, -1, 0, true)        -- Sem chapéu
                SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
            else
                -- Preset médico feminino
                SetPedComponentVariation(ped, 4, 18, 0, 0)  -- Calça branca
                SetPedComponentVariation(ped, 6, 15, 0, 0)  -- Sapato branco
                SetPedComponentVariation(ped, 8, 18, 0, 0)  -- Camiseta branca
                SetPedComponentVariation(ped, 11, 18, 0, 0) -- Torso branco
                SetPedComponentVariation(ped, 7, 10, 0, 0)  -- Acessório
                SetPedComponentVariation(ped, 9, 15, 0, 0)  -- Colete branco
                SetPedComponentVariation(ped, 1, 50, 0, 0)  -- Máscara médica
                SetPedPropIndex(ped, 0, -1, 0, true)        -- Sem chapéu
                SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
            end
            TriggerEvent("Notify", "verde", "Preset de Médico aplicado!", 3000)
        end
        
        cb(true)
    else
        cb(false)
    end
end)

-- Comando para mostrar roupas atuais
RegisterCommand('minhasroupas', function()
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    local isMale = (model == GetHashKey("mp_m_freemode_01"))
    
    -- Obter componentes atuais
    local face = GetPedDrawableVariation(ped, 0)
    local mask = GetPedDrawableVariation(ped, 1)
    local hair = GetPedDrawableVariation(ped, 2)
    local arms = GetPedDrawableVariation(ped, 3)
    local pants = GetPedDrawableVariation(ped, 4)
    local backpack = GetPedDrawableVariation(ped, 5)
    local shoes = GetPedDrawableVariation(ped, 6)
    local accessory = GetPedDrawableVariation(ped, 7)
    local tshirt = GetPedDrawableVariation(ped, 8)
    local vest = GetPedDrawableVariation(ped, 9)
    local decals = GetPedDrawableVariation(ped, 10)
    local torso = GetPedDrawableVariation(ped, 11)
    
    -- Obter props atuais
    local hat = GetPedPropIndex(ped, 0)
    local glasses = GetPedPropIndex(ped, 1)
    local earrings = GetPedPropIndex(ped, 2)
    local watch = GetPedPropIndex(ped, 6)
    local bracelet = GetPedPropIndex(ped, 7)
    
    -- Mostrar no chat
    print("=== SUAS ROUPAS ATUAIS ===")
    print("Gênero: " .. (isMale and "Masculino" or "Feminino"))
    print("Face: " .. face)
    print("Máscara: " .. mask)
    print("Cabelo: " .. hair)
    print("Braços: " .. arms)
    print("Calças: " .. pants)
    print("Mochila: " .. backpack)
    print("Sapatos: " .. shoes)
    print("Acessório: " .. accessory)
    print("Camiseta: " .. tshirt)
    print("Colete: " .. vest)
    print("Decalque: " .. decals)
    print("Torso: " .. torso)
    print("Chapéu: " .. hat)
    print("Óculos: " .. glasses)
    print("Brinco: " .. earrings)
    print("Relógio: " .. watch)
    print("Pulseira: " .. bracelet)
    
    -- Criar preset completo
    local preset = {
        hat = { item = hat, texture = 0 },
        pants = { item = pants, texture = 0 },
        vest = { item = vest, texture = 0 },
        bracelet = { item = bracelet, texture = 0 },
        backpack = { item = backpack, texture = 0 },
        decals = { item = decals, texture = 0 },
        mask = { item = mask, texture = 0 },
        shoes = { item = shoes, texture = 0 },
        tshirt = { item = tshirt, texture = 0 },
        torso = { item = torso, texture = 0 },
        accessory = { item = accessory, texture = 0 },
        watch = { item = watch, texture = 0 },
        arms = { item = arms, texture = 0 },
        glass = { item = glasses, texture = 0 },
        ear = { item = earrings, texture = 0 }
    }
    
    -- Mostrar formato antigo PRIMEIRO (mais fácil de editar)
    print("\n=== FORMATO ANTIGO (COPIE ESTE) ===")
    print('["pants"] = { item = ' .. pants .. ', texture = 0 },')
    print('["shoes"] = { item = ' .. shoes .. ', texture = 0 },')
    print('["tshirt"] = { item = ' .. tshirt .. ', texture = 0 },')
    print('["torso"] = { item = ' .. torso .. ', texture = 0 },')
    print('["accessory"] = { item = ' .. accessory .. ', texture = 0 },')
    print('["arms"] = { item = ' .. arms .. ', texture = 0 },')
    if hat ~= -1 then
        print('["hat"] = { item = ' .. hat .. ', texture = 0 },')
    else
        print('["hat"] = { item = -1, texture = 0 },')
    end
    if glasses ~= -1 then
        print('["glass"] = { item = ' .. glasses .. ', texture = 0 },')
    else
        print('["glass"] = { item = 0, texture = 0 },')
    end
    
    print("\n=== INSTRUÇÕES ===")
    print("1. Copie TODO o texto do formato antigo acima")
    print("2. Cole no campo 'Preset " .. (isMale and "masculino" or "feminino") .. "' do painel")
    print("3. Clique em SALVAR")
    print("4. Clique em VESTIR")
    print("5. O preset deve ser aplicado!")
    
    TriggerEvent("Notify", "verde", "Preset gerado! Copie o FORMATO ANTIGO e cole no painel!", 5000)
end, false)

-- Comando para testar preset específico
RegisterCommand('testarpreset', function(source, args)
    if #args < 3 then
        print("Uso: /testarpreset [componente] [numero] [textura]")
        print("Componentes: pants, shoes, tshirt, torso, accessory, arms, hat, glass, mask, vest")
        return
    end
    
    local component = args[1]
    local item = tonumber(args[2])
    local texture = tonumber(args[3]) or 0
    local ped = PlayerPedId()
    
    if component == "pants" then
        SetPedComponentVariation(ped, 4, item, texture, 0)
    elseif component == "shoes" then
        SetPedComponentVariation(ped, 6, item, texture, 0)
    elseif component == "tshirt" then
        SetPedComponentVariation(ped, 8, item, texture, 0)
    elseif component == "torso" then
        SetPedComponentVariation(ped, 11, item, texture, 0)
    elseif component == "accessory" then
        SetPedComponentVariation(ped, 7, item, texture, 0)
    elseif component == "arms" then
        SetPedComponentVariation(ped, 3, item, texture, 0)
    elseif component == "hat" then
        SetPedPropIndex(ped, 0, item, texture, true)
    elseif component == "glass" then
        SetPedPropIndex(ped, 1, item, texture, true)
    elseif component == "mask" then
        SetPedComponentVariation(ped, 1, item, texture, 0)
    elseif component == "vest" then
        SetPedComponentVariation(ped, 9, item, texture, 0)
    else
        print("Componente inválido!")
        return
    end
    
    print("Aplicado: " .. component .. " = " .. item .. " (textura: " .. texture .. ")")
end, false)

-- Comando para listar roupas disponíveis
RegisterCommand('listarroupas', function(source, args)
    if #args < 1 then
        print("Uso: /listarroupas [componente]")
        print("Componentes: pants, shoes, tshirt, torso, accessory, arms, hat, glass, mask, vest")
        return
    end
    
    local component = args[1]
    local ped = PlayerPedId()
    local maxItems = 0
    
    -- Definir número máximo de itens por componente
    if component == "pants" then
        maxItems = GetNumberOfPedDrawableVariations(ped, 4)
    elseif component == "shoes" then
        maxItems = GetNumberOfPedDrawableVariations(ped, 6)
    elseif component == "tshirt" then
        maxItems = GetNumberOfPedDrawableVariations(ped, 8)
    elseif component == "torso" then
        maxItems = GetNumberOfPedDrawableVariations(ped, 11)
    elseif component == "accessory" then
        maxItems = GetNumberOfPedDrawableVariations(ped, 7)
    elseif component == "arms" then
        maxItems = GetNumberOfPedDrawableVariations(ped, 3)
    elseif component == "hat" then
        maxItems = GetNumberOfPedPropDrawableVariations(ped, 0)
    elseif component == "glass" then
        maxItems = GetNumberOfPedPropDrawableVariations(ped, 1)
    elseif component == "mask" then
        maxItems = GetNumberOfPedDrawableVariations(ped, 1)
    elseif component == "vest" then
        maxItems = GetNumberOfPedDrawableVariations(ped, 9)
    else
        print("Componente inválido!")
        return
    end
    
    print("=== ROUPAS DISPONÍVEIS: " .. component .. " ===")
    print("Total de itens: " .. maxItems)
    print("Use /testarpreset " .. component .. " [numero] 0 para testar")
end, false)

-- COMANDOS SUPER SIMPLES PARA PRESETS
-- ===================================

-- Comando para aplicar preset de polícia
RegisterCommand('presetpolicia', function()
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    local isMale = (model == GetHashKey("mp_m_freemode_01"))
    
    if isMale then
        -- Preset polícia masculino
        SetPedComponentVariation(ped, 4, 23, 0, 0)  -- Calça preta
        SetPedComponentVariation(ped, 6, 25, 0, 0)  -- Sapato preto
        SetPedComponentVariation(ped, 8, 24, 0, 0)  -- Camiseta azul
        SetPedComponentVariation(ped, 11, 24, 0, 0) -- Torso azul
        SetPedComponentVariation(ped, 7, 20, 0, 0)  -- Acessório
        SetPedComponentVariation(ped, 9, 16, 0, 0)  -- Colete
        SetPedPropIndex(ped, 0, -1, 0, true)        -- Sem chapéu
        SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
    else
        -- Preset polícia feminino
        SetPedComponentVariation(ped, 4, 17, 0, 0)  -- Calça preta
        SetPedComponentVariation(ped, 6, 25, 0, 0)  -- Sapato preto
        SetPedComponentVariation(ped, 8, 22, 0, 0)  -- Camiseta azul
        SetPedComponentVariation(ped, 11, 23, 0, 0) -- Torso azul
        SetPedComponentVariation(ped, 7, 14, 0, 0)  -- Acessório
        SetPedComponentVariation(ped, 9, 18, 0, 0)  -- Colete
        SetPedPropIndex(ped, 0, -1, 0, true)        -- Sem chapéu
        SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
    end
    
    TriggerEvent("Notify", "verde", "Preset de Polícia aplicado! Use /minhasroupas para ver os números.", 5000)
end, false)

-- Comando para aplicar preset de bombeiro
RegisterCommand('presetbombeiro', function()
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    local isMale = (model == GetHashKey("mp_m_freemode_01"))
    
    if isMale then
        -- Preset bombeiro masculino
        SetPedComponentVariation(ped, 4, 30, 0, 0)  -- Calça vermelha
        SetPedComponentVariation(ped, 6, 35, 0, 0)  -- Bota de bombeiro
        SetPedComponentVariation(ped, 8, 30, 0, 0)  -- Camiseta vermelha
        SetPedComponentVariation(ped, 11, 30, 0, 0) -- Torso vermelho
        SetPedComponentVariation(ped, 7, 25, 0, 0)  -- Acessório
        SetPedComponentVariation(ped, 9, 25, 0, 0)  -- Colete vermelho
        SetPedPropIndex(ped, 0, 45, 0, true)        -- Capacete
        SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
    else
        -- Preset bombeiro feminino
        SetPedComponentVariation(ped, 4, 28, 0, 0)  -- Calça vermelha
        SetPedComponentVariation(ped, 6, 35, 0, 0)  -- Bota de bombeiro
        SetPedComponentVariation(ped, 8, 28, 0, 0)  -- Camiseta vermelha
        SetPedComponentVariation(ped, 11, 28, 0, 0) -- Torso vermelho
        SetPedComponentVariation(ped, 7, 22, 0, 0)  -- Acessório
        SetPedComponentVariation(ped, 9, 22, 0, 0)  -- Colete vermelho
        SetPedPropIndex(ped, 0, 45, 0, true)        -- Capacete
        SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
    end
    
    TriggerEvent("Notify", "verde", "Preset de Bombeiro aplicado! Use /minhasroupas para ver os números.", 5000)
end, false)

-- Comando para aplicar preset de médico
RegisterCommand('presetmedico', function()
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    local isMale = (model == GetHashKey("mp_m_freemode_01"))
    
    if isMale then
        -- Preset médico masculino
        SetPedComponentVariation(ped, 4, 20, 0, 0)  -- Calça branca
        SetPedComponentVariation(ped, 6, 15, 0, 0)  -- Sapato branco
        SetPedComponentVariation(ped, 8, 15, 0, 0)  -- Camiseta branca
        SetPedComponentVariation(ped, 11, 15, 0, 0) -- Torso branco
        SetPedComponentVariation(ped, 7, 10, 0, 0)  -- Acessório
        SetPedComponentVariation(ped, 9, 12, 0, 0)  -- Colete branco
        SetPedComponentVariation(ped, 1, 50, 0, 0)  -- Máscara médica
        SetPedPropIndex(ped, 0, -1, 0, true)        -- Sem chapéu
        SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
    else
        -- Preset médico feminino
        SetPedComponentVariation(ped, 4, 18, 0, 0)  -- Calça branca
        SetPedComponentVariation(ped, 6, 15, 0, 0)  -- Sapato branco
        SetPedComponentVariation(ped, 8, 18, 0, 0)  -- Camiseta branca
        SetPedComponentVariation(ped, 11, 18, 0, 0) -- Torso branco
        SetPedComponentVariation(ped, 7, 10, 0, 0)  -- Acessório
        SetPedComponentVariation(ped, 9, 15, 0, 0)  -- Colete branco
        SetPedComponentVariation(ped, 1, 50, 0, 0)  -- Máscara médica
        SetPedPropIndex(ped, 0, -1, 0, true)        -- Sem chapéu
        SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
    end
    
    TriggerEvent("Notify", "verde", "Preset de Médico aplicado! Use /minhasroupas para ver os números.", 5000)
end, false)

-- Comando para aplicar preset de mecânico
RegisterCommand('presetmecanico', function()
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    local isMale = (model == GetHashKey("mp_m_freemode_01"))
    
    if isMale then
        -- Preset mecânico masculino
        SetPedComponentVariation(ped, 4, 35, 0, 0)  -- Calça azul
        SetPedComponentVariation(ped, 6, 40, 0, 0)  -- Bota de trabalho
        SetPedComponentVariation(ped, 8, 35, 0, 0)  -- Camiseta azul
        SetPedComponentVariation(ped, 11, 35, 0, 0) -- Torso azul
        SetPedComponentVariation(ped, 7, 30, 0, 0)  -- Acessório
        SetPedComponentVariation(ped, 9, -1, 0, 0)  -- Sem colete
        SetPedPropIndex(ped, 0, -1, 0, true)        -- Sem chapéu
        SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
    else
        -- Preset mecânico feminino
        SetPedComponentVariation(ped, 4, 32, 0, 0)  -- Calça azul
        SetPedComponentVariation(ped, 6, 40, 0, 0)  -- Bota de trabalho
        SetPedComponentVariation(ped, 8, 32, 0, 0)  -- Camiseta azul
        SetPedComponentVariation(ped, 11, 32, 0, 0) -- Torso azul
        SetPedComponentVariation(ped, 7, 30, 0, 0)  -- Acessório
        SetPedComponentVariation(ped, 9, -1, 0, 0)  -- Sem colete
        SetPedPropIndex(ped, 0, -1, 0, true)        -- Sem chapéu
        SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
    end
    
    TriggerEvent("Notify", "verde", "Preset de Mecânico aplicado! Use /minhasroupas para ver os números.", 5000)
end, false)

-- Comando para testar preset do painel
RegisterCommand('testarpresetpainel', function(source, args)
    if #args < 1 then
        print("Uso: /testarpresetpainel [preset_json]")
        print("Exemplo: /testarpresetpainel {\"pants\":{\"item\":23,\"texture\":0}}")
        return
    end
    
    local presetString = table.concat(args, " ")
    print("Testando preset:", presetString)
    
    local success, preset = pcall(json.decode, presetString)
    if success and type(preset) == "table" then
        ApplyPresetToPlayer(preset)
        TriggerEvent("Notify", "verde", "Preset testado com sucesso!", 3000)
        print("Preset aplicado com sucesso!")
    else
        TriggerEvent("Notify", "vermelho", "Erro ao interpretar preset! Verifique o formato JSON.", 3000)
        print("Erro ao interpretar preset. Verifique o formato JSON.")
    end
end, false)

-- Comando para mostrar exemplo de preset correto
RegisterCommand('exemplopreset', function()
    print("=== EXEMPLO DE PRESET CORRETO ===")
    local exemplo = {
        hat = { item = -1, texture = 0 },
        pants = { item = 23, texture = 0 },
        vest = { item = 16, texture = 0 },
        bracelet = { item = -1, texture = 0 },
        backpack = { item = 0, texture = 0 },
        decals = { item = -1, texture = 0 },
        mask = { item = 121, texture = 0 },
        shoes = { item = 25, texture = 0 },
        tshirt = { item = 24, texture = 0 },
        torso = { item = 24, texture = 0 },
        accessory = { item = 20, texture = 0 },
        watch = { item = -1, texture = 0 },
        arms = { item = 0, texture = 0 },
        glass = { item = 0, texture = 0 },
        ear = { item = -1, texture = 0 }
    }
    
    local exemploJson = json.encode(exemplo)
    print("COPIE EXATAMENTE ISTO:")
    print(exemploJson)
    print("\nCole este texto no campo do painel das organizações!")
end, false)

-- Comando para aplicar preset feminino de exemplo
RegisterCommand('presetfeminino', function()
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    local isMale = (model == GetHashKey("mp_m_freemode_01"))
    
    if isMale then
        TriggerEvent("Notify", "vermelho", "Você é masculino! Use /presetmasculino", 3000)
        return
    end
    
    -- Preset feminino de exemplo
    SetPedComponentVariation(ped, 4, 17, 0, 0)  -- Calça preta
    SetPedComponentVariation(ped, 6, 25, 0, 0)  -- Sapato preto
    SetPedComponentVariation(ped, 8, 22, 0, 0)  -- Camiseta azul
    SetPedComponentVariation(ped, 11, 23, 0, 0) -- Torso azul
    SetPedComponentVariation(ped, 7, 14, 0, 0)  -- Acessório
    SetPedComponentVariation(ped, 9, 18, 0, 0)  -- Colete
    SetPedPropIndex(ped, 0, -1, 0, true)        -- Sem chapéu
    SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
    
    TriggerEvent("Notify", "verde", "Preset feminino aplicado! Use /minhasroupas para ver os números.", 5000)
end, false)

-- Comando para aplicar preset masculino de exemplo
RegisterCommand('presetmasculino', function()
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    local isMale = (model == GetHashKey("mp_m_freemode_01"))
    
    if not isMale then
        TriggerEvent("Notify", "vermelho", "Você é feminino! Use /presetfeminino", 3000)
        return
    end
    
    -- Preset masculino de exemplo
    SetPedComponentVariation(ped, 4, 23, 0, 0)  -- Calça preta
    SetPedComponentVariation(ped, 6, 25, 0, 0)  -- Sapato preto
    SetPedComponentVariation(ped, 8, 24, 0, 0)  -- Camiseta azul
    SetPedComponentVariation(ped, 11, 24, 0, 0) -- Torso azul
    SetPedComponentVariation(ped, 7, 20, 0, 0)  -- Acessório
    SetPedComponentVariation(ped, 9, 16, 0, 0)  -- Colete
    SetPedPropIndex(ped, 0, -1, 0, true)        -- Sem chapéu
    SetPedPropIndex(ped, 1, 0, 0, true)         -- Sem óculos
    
    TriggerEvent("Notify", "verde", "Preset masculino aplicado! Use /minhasroupas para ver os números.", 5000)
end, false)



-- Comando para testar marcação de localização com nome do grupo
RegisterCommand('marcarlocalizacao', function(source, args)
    -- Obter coordenadas atuais do jogador
    local coords = GetEntityCoords(PlayerPedId())
    local x, y, z = coords.x, coords.y, coords.z
    
    -- Obter nome do grupo do jogador
    local groupName = "Grupo"
    local user = vRP.getUser(source)
    if user then
        -- Tentar diferentes campos possíveis
        if user.group then
            groupName = user.group
        elseif user.groupType then
            groupName = user.groupType
        elseif user.groupName then
            groupName = user.groupName
        elseif user.faction then
            groupName = user.faction
        elseif user.org then
            groupName = user.org
        end
    end
    
    -- Criar nome personalizado da localização
    local locationName = "Localização " .. groupName
    
    -- Tentar marcar no mapa de diferentes formas
    local success = false
    
    -- Método 1: SetNewWaypoint
    success = SetNewWaypoint(x, y)
    
    -- Método 2: Alternativa usando SetWaypointOff
    if not success then
        SetWaypointOff()
        Wait(100)
        success = SetNewWaypoint(x, y)
    end
    
    -- Método 3: Usar coordenadas de blip
    if not success then
        local blip = AddBlipForCoord(x, y, z)
        if blip and DoesBlipExist(blip) then
            SetBlipSprite(blip, 1)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.8)
            SetBlipColour(blip, 3)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(locationName)
            EndTextCommandSetBlipName(blip)
            success = true
        end
    end
    
    -- Notificar o jogador
    if success then
        TriggerEvent("Notify", "verde", locationName .. " marcada no mapa!", 5000)
    else
        TriggerEvent("Notify", "vermelho", "Erro ao marcar localização no mapa!", 3000)
    end
end, false)

-- Comando para debug do nome do grupo
RegisterCommand('debuggrupo', function()
    local user = vRP.getUser(source)
    if user then
        print("=== DEBUG DO GRUPO ===")
        print("User:", json.encode(user))
        print("Group:", user.group)
        print("GroupType:", user.groupType)
        if user.group then
            TriggerEvent("Notify", "verde", "Grupo: " .. user.group, 5000)
        elseif user.groupType then
            TriggerEvent("Notify", "verde", "GroupType: " .. user.groupType, 5000)
        else
            TriggerEvent("Notify", "vermelho", "Nenhum grupo encontrado", 3000)
        end
    else
        TriggerEvent("Notify", "vermelho", "Usuário não encontrado", 3000)
    end
end, false)

-- Comando para aplicar preset diretamente (SOLUÇÃO SIMPLES)
RegisterCommand('aplicarpreset', function()
    print("=== APLICANDO PRESET DIRETAMENTE ===")
    
    -- Seu preset no formato antigo
    local seuPreset = [[["pants"] = { item = 11, texture = 0 },
["shoes"] = { item = 60, texture = 0 },
["tshirt"] = { item = 15, texture = 0 },
["torso"] = { item = 40, texture = 0 },
["accessory"] = { item = 0, texture = 0 },
["arms"] = { item = 0, texture = 0 },
["hat"] = { item = -1, texture = 0 },
["glass"] = { item = 24, texture = 0 },]]
    
    print("Preset a ser aplicado:", seuPreset)
    
    -- Converter e aplicar diretamente
    local convertedPreset = ParseOldFormatPreset(seuPreset)
    if convertedPreset then
        print("Preset convertido com sucesso!")
        print("Aplicando no personagem...")
        ApplyPresetToPlayer(convertedPreset)
        TriggerEvent("Notify", "verde", "Preset aplicado diretamente!", 3000)
        print("Preset aplicado com sucesso!")
    else
        print("Erro ao converter preset!")
        TriggerEvent("Notify", "vermelho", "Erro ao converter preset!", 3000)
    end
end, false)

-- Comando para testar botão vestir especificamente
RegisterCommand('testarbotaovestir', function()
    print("=== TESTANDO BOTÃO VESTIR ===")
    
    -- Seu preset no formato antigo
    local seuPreset = [[["pants"] = { item = 11, texture = 0 },
["shoes"] = { item = 60, texture = 0 },
["tshirt"] = { item = 15, texture = 0 },
["torso"] = { item = 40, texture = 0 },
["accessory"] = { item = 0, texture = 0 },
["arms"] = { item = 0, texture = 0 },
["hat"] = { item = -1, texture = 0 },
["glass"] = { item = 24, texture = 0 },]]
    
    print("1. Simulando clique no botão VESTIR...")
    print("Preset a ser aplicado:", seuPreset)
    
    -- Simular dados que vêm do painel quando clica vestir
    local testData = {
        preset = {
            male = seuPreset,
            female = ""
        }
    }
    
    print("2. Dados simulados:", json.encode(testData))
    
    -- Simular callback SetCostume diretamente
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    local isMale = (model == GetHashKey("mp_m_freemode_01"))
    local preset = isMale and testData.preset.male or testData.preset.female
    
    print("3. Gênero:", isMale and "Masculino" or "Feminino")
    print("4. Preset selecionado:", preset)
    
    if preset and preset ~= "" then
        print("5. Convertendo preset...")
        local convertedPreset = ParseOldFormatPreset(preset)
        if convertedPreset then
            print("6. Preset convertido com sucesso!")
            print("7. Aplicando no personagem...")
            ApplyPresetToPlayer(convertedPreset)
            TriggerEvent("Notify", "verde", "Botão vestir testado com sucesso!", 3000)
        else
            print("6. Erro ao converter preset!")
            TriggerEvent("Notify", "vermelho", "Erro ao converter preset!", 3000)
        end
    else
        print("5. Preset vazio!")
        TriggerEvent("Notify", "vermelho", "Preset vazio!", 3000)
    end
end, false)

-- Comando para testar fluxo completo
RegisterCommand('testarfluxocompleto', function()
    print("=== TESTANDO FLUXO COMPLETO ===")
    
    -- Seu preset no formato antigo
    local seuPreset = [[["pants"] = { item = 11, texture = 0 },
["shoes"] = { item = 60, texture = 0 },
["tshirt"] = { item = 15, texture = 0 },
["torso"] = { item = 40, texture = 0 },
["accessory"] = { item = 0, texture = 0 },
["arms"] = { item = 0, texture = 0 },
["hat"] = { item = -1, texture = 0 },
["glass"] = { item = 24, texture = 0 },]]
    
    print("1. Testando salvamento...")
    print("Preset a ser salvo:", seuPreset)
    
    -- Simular salvamento via callback
    local testData = {
        male = seuPreset,
        female = ""
    }
    
    -- Chamar callback SetPreset
    SendNUIMessage({
        type = "callback",
        callback = "SetPreset",
        data = testData
    })
    
    print("2. Aguardando 3 segundos para salvamento...")
    Wait(3000)
    
    print("3. Recarregando dados do painel...")
    SendNUIMessage({
        type = "callback",
        callback = "GetPainelInfos",
        data = {}
    })
    
    print("4. Aguardando 2 segundos para carregamento...")
    Wait(2000)
    
    print("5. Testando aplicação...")
    
    -- Simular aplicação via SetCostume
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    local isMale = (model == GetHashKey("mp_m_freemode_01"))
    
    local convertedPreset = ParseOldFormatPreset(seuPreset)
    if convertedPreset then
        print("Preset convertido com sucesso!")
        ApplyPresetToPlayer(convertedPreset)
        TriggerEvent("Notify", "verde", "Fluxo completo testado!", 3000)
    else
        print("Erro ao converter preset!")
        TriggerEvent("Notify", "vermelho", "Erro no fluxo completo!", 3000)
    end
end, false)

-- Comando para recarregar dados do painel
RegisterCommand('recarregarpainel', function()
    print("=== RECARREGANDO DADOS DO PAINEL ===")
    
    -- Forçar recarregamento dos dados
    SendNUIMessage({
        type = "callback",
        callback = "GetPainelInfos",
        data = {}
    })
    
    TriggerEvent("Notify", "verde", "Dados do painel recarregados!", 3000)
    print("Dados do painel recarregados!")
end, false)

-- Comando para testar salvamento e aplicação
RegisterCommand('testarsalvamento', function()
    print("=== TESTANDO SALVAMENTO E APLICAÇÃO ===")
    
    -- Seu preset no formato antigo
    local seuPreset = [[["pants"] = { item = 88, texture = 0 },
["shoes"] = { item = 5, texture = 0 },
["tshirt"] = { item = 15, texture = 0 },
["torso"] = { item = 108, texture = 0 },
["accessory"] = { item = 0, texture = 0 },
["arms"] = { item = 15, texture = 0 },
["hat"] = { item = -1, texture = 0 },
["glass"] = { item = 0, texture = 0 },]]
    
    print("1. Testando salvamento...")
    print("Preset a ser salvo:", seuPreset)
    
    -- Simular salvamento
    local testData = {
        male = seuPreset,
        female = ""
    }
    
    print("Dados para salvamento:", json.encode(testData))
    
    -- Chamar callback SetPreset
    SendNUIMessage({
        type = "callback",
        callback = "SetPreset",
        data = testData
    })
    
    print("2. Aguardando 2 segundos...")
    Wait(2000)
    
    print("3. Testando aplicação...")
    
    -- Simular aplicação
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    local isMale = (model == GetHashKey("mp_m_freemode_01"))
    
    local convertedPreset = ParseOldFormatPreset(seuPreset)
    if convertedPreset then
        print("Preset convertido com sucesso!")
        ApplyPresetToPlayer(convertedPreset)
        TriggerEvent("Notify", "verde", "Teste completo realizado!", 3000)
    else
        print("Erro ao converter preset!")
        TriggerEvent("Notify", "vermelho", "Erro no teste!", 3000)
    end
end, false)

-- Comando para testar seu preset específico
RegisterCommand('testarumpreset', function()
    print("=== TESTANDO SEU PRESET ===")
    
    -- Seu preset no formato antigo
    local seuPreset = [[["pants"] = { item = 88, texture = 0 },
["shoes"] = { item = 5, texture = 0 },
["tshirt"] = { item = 15, texture = 0 },
["torso"] = { item = 108, texture = 0 },
["accessory"] = { item = 0, texture = 0 },
["arms"] = { item = 15, texture = 0 },
["hat"] = { item = -1, texture = 0 },
["glass"] = { item = 0, texture = 0 },]]
    
    print("Preset original:", seuPreset)
    
    -- Converter para formato novo
    local convertedPreset = ParseOldFormatPreset(seuPreset)
    
    if convertedPreset then
        print("Preset convertido com sucesso!")
        print("Aplicando no personagem...")
        ApplyPresetToPlayer(convertedPreset)
        TriggerEvent("Notify", "verde", "Seu preset foi aplicado com sucesso!", 3000)
    else
        print("Erro ao converter preset!")
        TriggerEvent("Notify", "vermelho", "Erro ao converter seu preset!", 3000)
    end
end, false)

-- Comando para verificar dados do painel
RegisterCommand('verificardados', function()
    print("=== VERIFICANDO DADOS DO PAINEL ===")
    
    -- Simular callback GetPainelInfos
    local testData = {
        preset = {
            male = '{"pants":{"item":6,"texture":0},"shoes":{"item":5,"texture":0},"tshirt":{"item":15,"texture":0},"torso":{"item":15,"texture":0},"accessory":{"item":0,"texture":0},"arms":{"item":15,"texture":0},"hat":{"item":-1,"texture":0},"glass":{"item":0,"texture":0}}',
            female = ""
        }
    }
    
    print("Dados simulados:", json.encode(testData))
    
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    local isMale = (model == GetHashKey("mp_m_freemode_01"))
    local preset = isMale and testData.preset.male or testData.preset.female
    
    print("Gênero:", isMale and "Masculino" or "Feminino")
    print("Preset selecionado:", preset)
    print("Tipo do preset:", type(preset))
    
    if preset and preset ~= "" then
        local success, parsed = pcall(json.decode, preset)
        if success and type(parsed) == "table" then
            print("Preset parseado com sucesso:", json.encode(parsed))
            print("Aplicando preset...")
            ApplyPresetToPlayer(parsed)
            TriggerEvent("Notify", "verde", "Preset verificado e aplicado!", 3000)
        else
            print("Erro ao parsear preset:", parsed)
            TriggerEvent("Notify", "vermelho", "Erro ao parsear preset!", 3000)
        end
    else
        print("Preset vazio ou inválido")
        TriggerEvent("Notify", "vermelho", "Preset vazio para " .. (isMale and "masculino" or "feminino") .. "!", 3000)
    end
end, false)

-- Comando para testar preset diretamente
RegisterCommand('testarpresetdireto', function()
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    local isMale = (model == GetHashKey("mp_m_freemode_01"))
    
    print("=== TESTE DIRETO DE PRESET ===")
    print("Gênero:", isMale and "Masculino" or "Feminino")
    
    -- Preset de teste direto
    local testPreset = {
        hat = { item = -1, texture = 0 },
        pants = { item = 6, texture = 0 },
        vest = { item = -1, texture = 0 },
        bracelet = { item = -1, texture = 0 },
        backpack = { item = 0, texture = 0 },
        decals = { item = -1, texture = 0 },
        mask = { item = -1, texture = 0 },
        shoes = { item = 5, texture = 0 },
        tshirt = { item = 15, texture = 0 },
        torso = { item = 15, texture = 0 },
        accessory = { item = 0, texture = 0 },
        watch = { item = -1, texture = 0 },
        arms = { item = 15, texture = 0 },
        glass = { item = 0, texture = 0 },
        ear = { item = -1, texture = 0 }
    }
    
    print("Aplicando preset de teste diretamente...")
    local success = ApplyPresetToPlayer(testPreset)
    
    if success ~= false then
        TriggerEvent("Notify", "verde", "Preset de teste aplicado com sucesso!", 3000)
        print("Preset de teste aplicado com sucesso!")
    else
        TriggerEvent("Notify", "vermelho", "Erro ao aplicar preset de teste!", 3000)
        print("Erro ao aplicar preset de teste!")
    end
end, false)

-- Comando para testar preset do painel
RegisterCommand('testarpresetpainel', function()
    -- Simular o que acontece quando clica no botão vestir
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    local isMale = (model == GetHashKey("mp_m_freemode_01"))
    
    print("=== TESTE DE PRESET DO PAINEL ===")
    print("Gênero:", isMale and "Masculino" or "Feminino")
    
    -- Simular dados que vêm do painel
    local testData = {
        preset = {
            male = isMale and '{"pants":{"item":6,"texture":0},"shoes":{"item":5,"texture":0},"tshirt":{"item":15,"texture":0},"torso":{"item":15,"texture":0},"accessory":{"item":0,"texture":0},"arms":{"item":15,"texture":0},"hat":{"item":-1,"texture":0},"glass":{"item":0,"texture":0}}' or "",
            female = not isMale and '{"pants":{"item":6,"texture":0},"shoes":{"item":5,"texture":0},"tshirt":{"item":15,"texture":0},"torso":{"item":15,"texture":0},"accessory":{"item":0,"texture":0},"arms":{"item":15,"texture":0},"hat":{"item":-1,"texture":0},"glass":{"item":0,"texture":0}}' or ""
        }
    }
    
    print("Dados de teste:", json.encode(testData))
    
    -- Aplicar o teste
    local preset = isMale and testData.preset.male or testData.preset.female
    if preset and preset ~= "" then
        local success, parsed = pcall(json.decode, preset)
        if success and type(parsed) == "table" then
            ApplyPresetToPlayer(parsed)
            TriggerEvent("Notify", "verde", "Teste de preset aplicado com sucesso!", 3000)
            print("Preset de teste aplicado com sucesso!")
        else
            TriggerEvent("Notify", "vermelho", "Erro ao interpretar preset de teste!", 3000)
            print("Erro ao interpretar preset de teste")
        end
    else
        TriggerEvent("Notify", "vermelho", "Nenhum preset configurado para " .. (isMale and "masculino" or "feminino") .. "!", 3000)
        print("Nenhum preset configurado para " .. (isMale and "masculino" or "feminino"))
    end
end, false)

-- Comando para converter formato de preset
RegisterCommand('converterpreset', function(source, args)
    if #args < 1 then
        print("Uso: /converterpreset [preset_texto]")
        print("Exemplo: /converterpreset [\"pants\"] = { item = 6, texture = 0 }")
        return
    end
    
    local presetText = table.concat(args, " ")
    print("Convertendo preset:", presetText)
    
    -- Tentar converter formato antigo para novo
    local convertedPreset = {}
    
    -- Extrair valores usando regex simples
    local pants = presetText:match('"pants".-item%s*=%s*(%d+)')
    local shoes = presetText:match('"shoes".-item%s*=%s*(%d+)')
    local tshirt = presetText:match('"tshirt".-item%s*=%s*(%d+)')
    local torso = presetText:match('"torso".-item%s*=%s*(%d+)')
    local accessory = presetText:match('"accessory".-item%s*=%s*(%d+)')
    local arms = presetText:match('"arms".-item%s*=%s*(%d+)')
    local hat = presetText:match('"hat".-item%s*=%s*(%-?%d+)')
    local glass = presetText:match('"glass".-item%s*=%s*(%-?%d+)')
    
    if pants then convertedPreset.pants = { item = tonumber(pants), texture = 0 } end
    if shoes then convertedPreset.shoes = { item = tonumber(shoes), texture = 0 } end
    if tshirt then convertedPreset.tshirt = { item = tonumber(tshirt), texture = 0 } end
    if torso then convertedPreset.torso = { item = tonumber(torso), texture = 0 } end
    if accessory then convertedPreset.accessory = { item = tonumber(accessory), texture = 0 } end
    if arms then convertedPreset.arms = { item = tonumber(arms), texture = 0 } end
    if hat then convertedPreset.hat = { item = tonumber(hat), texture = 0 } end
    if glass then convertedPreset.glass = { item = tonumber(glass), texture = 0 } end
    
    -- Adicionar valores padrão para campos ausentes
    convertedPreset.vest = convertedPreset.vest or { item = -1, texture = 0 }
    convertedPreset.bracelet = convertedPreset.bracelet or { item = -1, texture = 0 }
    convertedPreset.backpack = convertedPreset.backpack or { item = 0, texture = 0 }
    convertedPreset.decals = convertedPreset.decals or { item = -1, texture = 0 }
    convertedPreset.mask = convertedPreset.mask or { item = -1, texture = 0 }
    convertedPreset.watch = convertedPreset.watch or { item = -1, texture = 0 }
    convertedPreset.ear = convertedPreset.ear or { item = -1, texture = 0 }
    
    local presetJson = json.encode(convertedPreset)
    print("PRESET CONVERTIDO:")
    print(presetJson)
    print("\nCopie este texto e cole no painel das organizações!")
    
    -- Aplicar o preset convertido
    ApplyPresetToPlayer(convertedPreset)
    TriggerEvent("Notify", "verde", "Preset convertido e aplicado com sucesso!", 3000)
end, false)

RegisterNUICallback('ConnectRadio', function(data, cb)
    if data and data.radio and tonumber(data.radio) then
        -- Ação do rádio aqui
        TriggerEvent("Notify", "verde", "Entrou na frequência <b>"..data.radio.."</b>.", 5000)
        exports["pma-voice"]:setRadioChannel(data.radio)
        TriggerEvent("sounds:source", "radioon", 0.5)
        TriggerEvent("hud:Radio", data.radio)
        cb(true)
    else
        print('Radio: Insira um Numero não uma STRING.')
        cb(false)
    end
end)

RegisterNUICallback('SetLocation', function(data, cb)
    -- Obter coordenadas atuais do jogador
    local coords = GetEntityCoords(PlayerPedId())
    local x, y, z = coords.x, coords.y, coords.z
    
    -- Obter nome do grupo do jogador
    local groupName = "Grupo"
    
    -- Tentar obter nome do grupo via vRP
    local user = vRP.getUser(source)
    if user then
        -- Tentar diferentes campos possíveis
        if user.group then
            groupName = user.group
        elseif user.groupType then
            groupName = user.groupType
        elseif user.groupName then
            groupName = user.groupName
        elseif user.faction then
            groupName = user.faction
        elseif user.org then
            groupName = user.org
        end
    end
    
    -- Criar nome personalizado da localização
    local locationName = "Localização " .. groupName
    
    -- Tentar marcar no mapa de diferentes formas
    local success = false
    
    -- Método 1: SetNewWaypoint
    success = SetNewWaypoint(x, y)
    
    -- Método 2: Alternativa usando SetWaypointOff
    if not success then
        SetWaypointOff()
        Wait(100)
        success = SetNewWaypoint(x, y)
    end
    
    -- Método 3: Usar coordenadas de blip
    if not success then
        local blip = AddBlipForCoord(x, y, z)
        if blip and DoesBlipExist(blip) then
            SetBlipSprite(blip, 1)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.8)
            SetBlipColour(blip, 3)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(locationName)
            EndTextCommandSetBlipName(blip)
            success = true
        end
    end
    
    -- Notificar o jogador
    if success then
        TriggerEvent("Notify", "verde", locationName .. " marcada no mapa!", 5000)
    else
        TriggerEvent("Notify", "vermelho", "Erro ao marcar localização no mapa!", 3000)
    end
    
    cb(success)
end)