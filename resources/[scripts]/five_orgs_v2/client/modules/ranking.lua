RegisterNUICallback('GetRanking', function(_, cb)
    -- { name: "Ska Pablo", time: 35, player: !0, pos: 35 },
    -- { name: "João Silva", time: 437453745, player: !1 },
    -- { name: "Maria Santos", time: 3242, player: !1 },
    -- { name: "Pedro Oliveira", time: 422, player: !1 },
    -- { name: "Ana Costa", time: 600, player: !1 },

    local result = vTunnel.getFactionRanking()
    if result then
        cb(result)
    else
        cb({})
    end
end)

RegisterNUICallback('GetRankingPart', function(_, cb)
    --   {
    --     id: 1337,
    --     name: "João Sembraco",
    --     timePlayed: 1234,
    --     money: 5678,
    --     farm: 910,
    --   },

    local result = vTunnel.GetFactionRankinPart()
    if result then
        cb(result)
    else
        cb({})
    end
end)