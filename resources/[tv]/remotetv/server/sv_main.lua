local CurrentlyWorkingTVs = {}

-- ^^^^^^^^^^^^^^^^--
-- FUNCTIONS START --
---------------------

local function GetCurrentlyWorkingTV(coords)
    for k, v in pairs(CurrentlyWorkingTVs) do
        if #(v3(v.coords) - v3(coords)) < 0.01 then
            return k, v
        end
    end
end

local function SetTelevision(coords, key, value, update)
    local index, data = GetTelevision(coords)

    if (index ~= nil) then
        if (Televisions[index] == nil) then
            Televisions[index] = {}
        end

        Televisions[index][key] = value
    else
        index = os.time()

        while Televisions[index] do
            index = index + 1
            Citizen.Wait(0)
        end

        if (Televisions[index] == nil) then
            Televisions[index] = {}
        end

        Televisions[index][key] = value
    end

    Televisions[index].coords = coords

    if key ~= "volume" and key ~= "paused" then
        Televisions[index].update_time = os.time()
    end

    if (update) then
        TriggerClientEvent("tgg-remotetv:event", -1, Televisions, index, key, value)
    end

    return index
end

local function SetChannel(source, data)
    if data then
        for k, v in pairs(Channels) do
            if (Channels[k].source == source) then
                return
            end
        end

        local index = 1

        while Channels[index] do
            index = index + 1
            Citizen.Wait(0)
        end

        Channels[index] = data
        Channels[index].source = source

        TriggerClientEvent("tgg-remotetv:broadcast", -1, Channels, index)

        return
    else
        for k, v in pairs(Channels) do
            if (Channels[k].source == source) then
                Channels[k] = nil

                TriggerClientEvent("tgg-remotetv:broadcast", -1, Channels, k)

                return
            end
        end
    end
end

-------------------
-- FUNCTIONS END --
-- **************--

-- ^^^^^^^^^^^^^^--
-- THREADS START --
-------------------

CreateThread(function()
    local dependeciesStarted = false;

    local genericStatus = GetResourceState('generic_texture_renderer_gfx')

    if genericStatus == 'started' then
        dependeciesStarted = true
    else
        local repeatCount = 0
        local repeatMax = 10
        -- Wait for the resouce to start.
        while genericStatus == 'starting' do
            print('Aguardando o início de `generic_texture_renderer_gfx`...')

            Wait(500)
            genericStatus = GetResourceState('generic_texture_renderer_gfx')
            repeatCount = repeatCount + 1

            if repeatCount >= repeatMax then
                break
            end
        end

        if genericStatus == 'started' then
            dependeciesStarted = true
        end

        if not dependeciesStarted then
            print('Dependência ausente - `generic_texture_renderer_gfx` (Leia as INSTRUÇÕES)')
        end
    end
end)

-----------------
-- THREADS END --
-- ************--

-- ^^^^^^^^^^^^^^^^^--q
-- NET EVENTS START --
----------------------

RegisterNetEvent("tgg-remotetv:update-currently-working-tv-app", function(coords, currentApp)
    local key, value = GetCurrentlyWorkingTV(coords)

    CurrentlyWorkingTVs[key].currentApp = currentApp

    TriggerClientEvent("tgg-remotetv:sync-currently-working-tvs", -1, CurrentlyWorkingTVs)
end)

RegisterNetEvent("tgg-remotetv:update-currently-working-tv-volume", function(coords, volume)
    local key, value = GetCurrentlyWorkingTV(coords)

    CurrentlyWorkingTVs[key].volume = volume

    TriggerClientEvent("tgg-remotetv:sync-currently-working-tvs", -1, CurrentlyWorkingTVs)
end)

RegisterNetEvent("tgg-remotetv:update-currently-working-tvs", function(tv)
    local key, value = GetCurrentlyWorkingTV(tv.coords)
    if not value then
        tv.volume = 0.5
        tv.currentApp = 'home'

        table.insert(CurrentlyWorkingTVs, tv)
    elseif value then
        table.remove(CurrentlyWorkingTVs, key)

        TriggerClientEvent("tgg-remotetv:remove-current-tv", -1)
    end

    TriggerClientEvent("tgg-remotetv:sync-currently-working-tvs", -1, CurrentlyWorkingTVs)
end)

RegisterNetEvent("tgg-remotetv:request-sync-currently-working-tvs", function()
    TriggerClientEvent("tgg-remotetv:sync-currently-working-tvs", -1, CurrentlyWorkingTVs)
end)

RegisterNetEvent("tgg-remotetv:request-sync-currently-working-tvs-local", function(source)
    local _source = source

    TriggerClientEvent("tgg-remotetv:sync-currently-working-tvs", _source, CurrentlyWorkingTVs)
end)

RegisterNetEvent("tgg-remotetv:requestSync", function(coords)
    local _source = source

    TriggerClientEvent("tgg-remotetv:requestSync", _source, coords, {
        current_time = os.time()
    })
end)

RegisterNetEvent("tgg-remotetv:event", function(data, key, value)
    SetTelevision(data.coords, key, value, true)
end)

RegisterNetEvent("tgg-remotetv:broadcast", function(data)
    local _source = source

    SetChannel(_source, data)
end)

RegisterNetEvent("tgg-remotetv:requestUpdate", function()
    local _source = source

    TriggerClientEvent("tgg-remotetv:requestUpdate", _source, {
        Televisions = Televisions,
        Channels = Channels
    })
end)