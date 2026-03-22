OpenClientFunctions = {
    CanJoinRace = function(raceData)
        return true
    end,

    JoinRace = function(activeRaceData)
        return
    end,

    RaceLeave = function(activeRaceData)
        return
    end,

    CheckpointPassed = function(activeRaceData, checkpointIndex)
        return
    end,

    LapComplete = function(activeRaceData, lapNumber)
        return
    end,

    RaceFinish = function(activeRaceData, position, finishData)
        return
    end,

    CanStartRaceCreator = function(raceType, existingMapData)
        return true
    end,
}