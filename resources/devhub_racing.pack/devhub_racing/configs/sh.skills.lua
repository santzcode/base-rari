Config.XpForFinishingRace = {
    [1] = 100, -- 1st place
    [2] = 50,  -- 2nd place
    [3] = 25,  -- 3rd place
    [4] = 10,  -- 4th place
    [5] = 5,   -- 5th place
    -- all other places 0
}

Config.SkillsCategory = {
    skill = 'racing', 
    title = 'Racing'
}

Config.SkillsList = {
    ["racing"] = {
        {
            uid = "class_s",
            index = 26,
            title = "Class S Racing",
            icon = "fas fa-flag-checkered",
            img = "https://upload.devhub.gg/dh_upload/racing/skillTree/class_s.webp",
            description = "Unlock the ability to participate in <strong>Class S</strong> races. The most prestigious racing category with the fastest cars.",
            points = 1,
            lines = { leftBottom = false, rightBottom = false, },
        },
        {
            lines = { bottom = false, right = false, },
            index = 43 ,
        },
        {
            lines = { left = false, right = false, rightTop = false, },
            index = 44 ,
        },
        {
            lines = { left = false, right = false, },
            index = 45 ,
        },
        {
            lines = { left = false, rightBottom = false, leftTop = false, },
            index = 46 ,
        },
        {
            uid = "more_mmr_2",
            index = 62,
            title = "More MMR II",
            icon = "fas fa-chart-line",
            img = "https://upload.devhub.gg/dh_upload/racing/skillTree/mmr_cash.webp",
            description = "Gain <strong>+10% more MMR</strong> from every race.",
            points = 1,
            effect = 10,
            lines = { top = false, right = false, bottom = false, },
        },
        {
            lines = { bottom = false, left = false, },
            index = 63 ,
        },
        {
            uid = "more_cash_2",
            index = 66,
            title = "More Cash II",
            icon = "fas fa-coins",
            img = "https://upload.devhub.gg/dh_upload/racing/skillTree/mmr_cash.webp",
            description = "Earn <strong>+10% more cash</strong> rewards from races.",
            points = 1,
            effect = 10,
            lines = { leftTop = false, rightBottom = false, },
        },
        {
            lines = { leftBottom = false, right = false, },
            index = 68 ,
        },
        {
            lines = { left = false, bottom = false, },
            index = 69 ,
        },
        {
            lines = { top = false, right = false, },
            index = 81 ,
        },
        {
            uid = "class_a",
            index = 82,
            title = "Class A Racing",
            icon = "fas fa-flag-checkered",
            img = "https://upload.devhub.gg/dh_upload/racing/skillTree/class_a.webp",
            description = "Unlock the ability to participate in <strong>Class A</strong> races. High performance racing cars with great balance.",
            points = 1,
            lines = { top = false, bottom = false, left = false, },
        },
        {
            lines = { leftTop = false, rightTop = false, rightBottom = false, },
            index = 86 ,
        },
        {
            uid = "class_b",
            index = 88,
            title = "Class B Racing",
            icon = "fas fa-flag-checkered",
            img = "https://upload.devhub.gg/dh_upload/racing/skillTree/class_b.webp",
            description = "Unlock the ability to participate in <strong>Class B</strong> races. A balanced category for competitive drivers.",
            points = 1,
            lines = { top = false, bottom = false, leftBottom = false, },
        },
        {
            lines = { top = false, rightBottom = false, },
            index = 101 ,
        },
        {
            lines = { leftTop = false, rightTop = false, },
            index = 106 ,
        },
        {
            lines = { top = false, bottom = false, },
            index = 107 ,
        },
        {
            uid = "more_cash_1",
            index = 121,
            title = "More Cash I",
            icon = "fas fa-coins",
            img = "https://upload.devhub.gg/dh_upload/racing/skillTree/mmr_cash.webp",
            description = "Earn <strong>+10% more cash</strong> rewards from races.",
            points = 1,
            effect = 10,
            lines = { right = false, leftTop = false, },
        },
        {
            lines = { rightBottom = false, left = false, },
            index = 122 ,
        },
        {
            lines = { leftBottom = false, right = false, },
            index = 124 ,
        },
        {
            lines = { left = false, right = false, },
            index = 125 ,
        },
        {
        uid = "more_mmr_1",
        index = 126,
        title = "More MMR I",
        icon = "fas fa-chart-line",
        img = "https://upload.devhub.gg/dh_upload/racing/skillTree/mmr_cash.webp",
        description = "Gain <strong>+10% more MMR</strong> from every race.",
            points = 1,
            effect = 10,
            lines = { left = false, top = false, },
        },
        {
            uid = "class_c",
            index = 142,
            unLockable = true,
            title = "Class C Racing",
            icon = "fas fa-flag-checkered",
            img = "https://upload.devhub.gg/dh_upload/racing/skillTree/class_c.webp",
            description = "Unlock the ability to participate in <strong>Class C</strong> races. Beginner-friendly category for all drivers.",
            points = 1,
            lines = { leftTop = false, rightTop = false, },
        },
    }
}