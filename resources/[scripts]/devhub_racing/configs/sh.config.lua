if not Config then Config = {} end

-- Do you want to enable the skill tree?
-- This script must be ensured after devhub_skillTree
-- If you want to buy our skill tree, you can find it https://store.devhub.gg/product/6440792-1
Config.SkillTreeEnabled = false

Config.Debug = false

Config.DevMode = false -- it will display more dev related information

Config.EnableCheckpointMarkers = true -- Enable/disable the checkpoint marker system with 3D UI and props, disabling it will make resmon lower

Config.RaceBlips = {
    enabled = true, -- Enable/disable race start blips on the map
    showDistance = 2000.0, -- Distance in meters to show race blips (2km default)
    groupingDistance = 50.0, -- Distance in meters to group nearby races into single blip (50m default)
    blipSprite = 315, -- Blip sprite ID for race starts (315 = racing flag)
    blipColor = 46, -- Blip color (1 = red, 2 = green, 3 = blue, etc.)
    blipScale = 1.0, -- Blip scale/size
    blipName = "Race Start", -- Blip display name
}

Config.CheckpointBlips = {
    enabled = true, -- Enable/disable checkpoint blips during active races
    blipScale = 0.8, -- Default blip scale/size
    
    -- Start checkpoint blip settings
    startSprite = 315, -- Blip sprite ID for start checkpoint (315 = racing flag)
    startColor = 3, -- Blip color for start checkpoint (3 = blue)
    startName = "Start", -- Blip display name for start checkpoint
    
    -- Finish checkpoint blip settings
    finishSprite = 38, -- Blip sprite ID for finish checkpoint (38 = finish flag)
    finishColor = 1, -- Blip color for finish checkpoint (1 = red)
    finishName = "Finish", -- Blip display name for finish checkpoint
    
    -- Next checkpoint blip settings
    nextCheckpointSprite = 1, -- Blip sprite ID for next checkpoint (1 = circle)
    nextCheckpointColor = 5, -- Blip color for next checkpoint (5 = yellow)
    nextCheckpointName = "Next Checkpoint", -- Blip display name for next checkpoint
    
    -- Regular checkpoint blip settings (for future use)
    checkpointSprite = 1, -- Blip sprite ID for regular checkpoints (1 = circle)
    checkpointColor = 4, -- Blip color for regular checkpoints (4 = light blue)
    checkpointName = "Checkpoint", -- Blip display name for regular checkpoints
}

-- Waypoint and Checkpoint Highlighting
Config.NextCheckpointWaypoint = {
    enabled = true, -- Enable/disable automatic waypoint setting to next checkpoint
}

Config.NextCheckpointHighlight = {
    enabled = true, -- Enable/disable highlighting next checkpoint props with outline
    outlineColor = {r = 255, g = 255, b = 0}, -- RGB color for the outline (yellow by default)
}

Config.DefaultMmr = 1000 -- default mmr for new players

Config.AllowMrrOnAllRaces = false -- if true, players can earn mmr points on all races

Config.LeaderboardCacheTimeout = 60000 * 15

Config.SyncPlayerPositionInterval = 1000 -- how often to sync player position with other players in milliseconds.

Config.MaxMmrHistory = 7 -- how many max entries in mmr history

Config.MaxRaceHistory = 5 -- how many max entries in race history

Config.MmrForWin = {
    [1] = 50, -- 1st place
    [2] = 25, -- 2nd place
    [3] = 10, -- 3rd place
}

Config.MmrForLost = -25 -- Config.MmrForLost * place

-- set false to not use routing bucket
-- Routing bucket system used from devhub_lib
Config.DefaultRaceBucket = 2000 -- Default routing bucket for races, to make it unique for each race to this number we are adding server id of a first player who joined race
Config.CreatorBucket = 3000 -- Default routing bucket for race creator mode, to make it unique for each creator session we are adding server id of the player

-- In official race player can earn mmr points
-- If official race is missing it will be generated during next script restart

Config.OfficialRaceGenerator = { -- if u want want to use set to false
    ['Monday'] = { -- Use only english names
        {
            start = {hour = 18, minute = 0}, -- 24 hour format
            mapId = "random", -- "random" verified map or NUMBER "mapId"
            winnerReward = 10000, -- number or false
            vehicleClass = "ALL", -- "ALL", "S", "A", "B", "C", "D"
            collisions = true, -- true or false (player vehicle collisions, props are always collision-free)
            fpv = false, -- true or false
            laps = 3, -- number of laps if selected map has loop raceType
            entryFee = 0, -- number or false
        },
    },
    ['Tuesday'] = {
        {
            start = {hour = 18, minute = 0},
            mapId = "random",
            winnerReward = 10000,
            vehicleClass = "ALL",
            collisions = true, -- true or false (player vehicle collisions, props are always collision-free)
            fpv = false, -- true or false
            laps = 3,
            entryFee = 0,
        },
    },
    ['Wednesday'] = {
        {
            start = {hour = 18, minute = 0},
            mapId = "random",
            winnerReward = 10000,
            vehicleClass = "ALL",
            collisions = true, -- true or false (player vehicle collisions, props are always collision-free)
            fpv = false, -- true or false
            laps = 3,
            entryFee = 0,
        },
    },
    ['Thursday'] = {
        {
            start = {hour = 18, minute = 0},
            mapId = "random",
            winnerReward = 10000,
            vehicleClass = "ALL",
            collisions = true, -- true or false (player vehicle collisions, props are always collision-free)
            fpv = false, -- true or false
            laps = 3,
            entryFee = 0,
        },
    },
    ['Friday'] = {
        {
            start = {hour = 18, minute = 0},
            mapId = "random",
            winnerReward = 10000,
            vehicleClass = "ALL",
            collisions = true, -- true or false (player vehicle collisions, props are always collision-free)
            fpv = false, -- true or false
            laps = 3,
            entryFee = 0,
        },
    },
    ['Saturday'] = {
        {
            start = {hour = 18, minute = 0},
            mapId = "random",
            winnerReward = 10000,
            vehicleClass = "ALL",
            collisions = true, -- true or false (player vehicle collisions, props are always collision-free)
            fpv = false, -- true or false
            laps = 3,
            entryFee = 0,
        },
    },
    ['Sunday'] = {
        {
            start = {hour = 18, minute = 00},
            mapId = "random",
            winnerReward = 10000,
            vehicleClass = "ALL",
            collisions = true, -- true or false (player vehicle collisions, props are always collision-free)
            fpv = false,
            laps = 3,
            entryFee = 0,
        },
    }
}

Config.DisableLocalVehicleDuringRace = true -- Disable all local vehicles and traffic while in

Config.EntryFeePaidVia = 'cash' -- 'cash' or 'bank'

Config.MoneyRewardPaidVia = 'cash' -- 'cash' or 'bank', how to pay the money reward to the user (entry fee reward and winner reward)

Config.EntryFeeRewardMultiplier = 1.0 -- Multiplier for entry fee reward, you can make it give more then users paid or less, 1.0 = same amount as paid

Config.IsAdminPermissionRequired = { -- To check if user is admin we use Core.IsPlayerAdmin from devhub_lib
    ['verifyMap'] = true,
    ['createMap'] = true,
    ['createRace'] = false,
    ['editMap'] = false, -- Set to false to allow users to edit their own maps
    ['editAnyMap'] = true, -- Admins can edit any map
}

Config.RaceMusic = {
    enabled = true, -- Enable/disable race music system
    volume = 0.2, -- Music volume (0.0 to 1.0)
    fadeInDuration = 1000, -- Fade in duration in milliseconds
    fadeOutDuration = 2000, -- Fade out duration in milliseconds
    
    -- YouTube music tracks to play during races
    -- Note: Some tracks may not be embeddable due to copyright restrictions
    -- The system will automatically try the next track if one fails
    tracks = {
        "https://www.youtube.com/watch?v=GUgFiIvLKxk&list=PL9gwn6TnEFaXmUW4LXz9MLd0ySv1kmQlR",
        "https://www.youtube.com/watch?v=8APux0hf-6M&list=PL9gwn6TnEFaXmUW4LXz9MLd0ySv1kmQlR",
        "https://www.youtube.com/watch?v=nOMPQU0-4KE&list=PL9gwn6TnEFaXmUW4LXz9MLd0ySv1kmQlR&index=21",
        "https://www.youtube.com/watch?v=4RWWOAusvzc&list=PL9gwn6TnEFaXmUW4LXz9MLd0ySv1kmQlR&index=31",
    }
}

Config.OnRaceEndTeleportToStart = true -- Teleport players to the start position when the race ends

Config.LaptopApp = {
    label = "Racing",
    img = "https://cfx-nui-devhub_laptop/html/images/apps/racing.png",
    path = "https://cfx-nui-devhub_racing/html/index.html",
    category = "premium",
    rating = 5,
    description = "Racing application for racing games",
    longDescription = "A competitive racing platform where you can join, host, and track races with detailed statistics and leaderboards.",
    size = 52,
    downloads = 1000,
    reviews = {
        {
            user = "SpeedRacer",
            rating = 5,
            comment = "Amazing racing platform! Great graphics and smooth gameplay.",
            date = "2025-08-13"
        },
        {
            user = "RacingPro",
            rating = 5,
            comment = "Best racing app I've used. Love the competitive features and leaderboards.",
            date = "2025-08-12"
        }
    }
}

Config.Text3dFont = 4 -- Set the font for 3D text (0-7 are valid GTA V font IDs)

Config.JoinRace = {
    showRaceUi = 85.0, -- Distance to show the join race UI
    showJoinButton = 7.5, -- Distance to press the button to join the race
}

-- UPDATE 1.0.4

Config.DisableShootingInRace = true -- Disable shooting in race

Config.DisableVehicleRadioInRace = true -- Disable vehicle radio in race

-- UPDATE 1.0.7

-- Time in seconds before the race starts, max 5 options
Config.RaceStartDelay = {
    86400, -- 24h
    18000, -- 5h
    3600, -- 1h
    300, -- 5min
    60, -- 1min
}

Config.MaxPreRacePlayerShowcase = 10 -- Maximum number of players to showcase before the race starts, sorted by mmr , set to 999 to show all players