RegisterNetEvent('bs_spray:remove')
AddEventHandler('bs_spray:remove', function(sprayId)
    local source = source
    local user_id = vRP.getUserId(source)
    
    if sprayId and user_id then
        -- Remove from database
        MySQL.Async.execute("DELETE FROM bs_spray WHERE id = @id AND user_id = @user_id", {
            ['@id'] = sprayId,
            ['@user_id'] = user_id
        }, function(affectedRows)
            if affectedRows > 0 then
                -- Remove from local table
                for i, spray in pairs(SPRAYS) do
                    if spray.id == sprayId then
                        table.remove(SPRAYS, i)
                        break
                    end
                end
                
                -- Update all clients
                TriggerClientEvent('bs_spray:setSprays', -1, SPRAYS)
                print("Graffiti removed from database with ID: " .. sprayId)
            end
        end)
    end
end)

-- Function to remove spray by coordinates (utility)
RegisterNetEvent('bs_spray:removeAtCoords')
AddEventHandler('bs_spray:removeAtCoords', function(coords)
    local source = source
    local user_id = vRP.getUserId(source)
    
    for i, spray in ipairs(SPRAYS) do
        if spray.location and coords and #(spray.location - coords) < 1.0 then
            if spray.user_id == user_id or user_id == 1 then -- Allow removal by admin or owner
                MySQL.Async.execute("DELETE FROM bs_spray WHERE id = @id", {
                    ['@id'] = spray.id
                }, function(affectedRows)
                    if affectedRows > 0 then
                        table.remove(SPRAYS, i)
                        TriggerClientEvent('bs_spray:setSprays', -1, SPRAYS)
                    end
                end)
                break
            end
        end
    end
end)
