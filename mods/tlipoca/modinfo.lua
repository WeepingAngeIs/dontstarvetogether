name = "特莉波卡 Tlipoca-test"
description = [[测试反馈群：1022372994。目前模组还在测试版本，有内容不全、潜在bug等问题，请见谅]]
author = "特莉波卡图图图"
api_version = 10
dst_compatible = true
all_clients_require_mod = true
client_only_mod = false
icon_atlas = "modicon.xml"
icon = "modicon.tex"
server_filter_tags = {"tlipoca", "character"}
version = "0.1.7"

local keylist = {
    {
        description = "Minus",
        data = 45
    },
    {
        description = "Alt",
        data = 400
    },
    {
        description = "Ctrl",
        data = 401
    },
    {
        description = "Shift",
        data = 402
    },
    {
        description = "Slash",
        data = 47
    },
    {
        description = "LeftBracket",
        data = 91
    },
    {
        description = "BackSlash",
        data = 92
    },
    {
        description = "RightBracket",
        data = 93
    },
    {
        description = "Tilde",
        data = 96
    },
    {
        description = "A",
        data = 97
    },
    {
        description = "B",
        data = 98
    },
    {
        description = "C",
        data = 99
    },
    {
        description = "D",
        data = 100
    },
    {
        description = "E",
        data = 101
    },
    {
        description = "F",
        data = 102
    },
    {
        description = "G",
        data = 103
    },
    {
        description = "H",
        data = 104
    },
    {
        description = "I",
        data = 105
    },
    {
        description = "J",
        data = 106
    },
    {
        description = "K",
        data = 107
    },
    {
        description = "L",
        data = 108
    },
    {
        description = "M",
        data = 109
    },
    {
        description = "N",
        data = 110
    },
    {
        description = "O",
        data = 111
    },
    {
        description = "P",
        data = 112
    },
    {
        description = "Q",
        data = 113
    },
    {
        description = "R",
        data = 114
    },
    {
        description = "S",
        data = 115
    },
    {
        description = "T",
        data = 116
    },
    {
        description = "U",
        data = 117
    },
    {
        description = "V",
        data = 118
    },
    {
        description = "W",
        data = 119
    },
    {
        description = "X",
        data = 120
    },
    {
        description = "Y",
        data = 121
    },
    {
        description = "Z",
        data = 122
    },
    {
        description = "F1",
        data = 282
    },
    {
        description = "F2",
        data = 283
    },
    {
        description = "F3",
        data = 284
    },
    {
        description = "F4",
        data = 285
    },
    {
        description = "F5",
        data = 286
    },
    {
        description = "F6",
        data = 287
    },
    {
        description = "F7",
        data = 288
    },
    {
        description = "F8",
        data = 289
    },
    {
        description = "F9",
        data = 290
    },
    {
        description = "F10",
        data = 291
    },
    {
        description = "F11",
        data = 292
    },
    {
        description = "F12",
        data = 293
    },

    {
        description = "Up",
        data = 273
    },
    {
        description = "Down",
        data = 274
    },
    {
        description = "Right",
        data = 275
    },
    {
        description = "Left",
        data = 276
    },
    {
        description = "PageUp",
        data = 280
    },
    {
        description = "PageDown",
        data = 281
    },

    {
        description = "0",
        data = 48
    },
    {
        description = "1",
        data = 49
    },
    {
        description = "2",
        data = 50
    },
    {
        description = "3",
        data = 51
    },
    {
        description = "4",
        data = 52
    },
    {
        description = "5",
        data = 53
    },
    {
        description = "6",
        data = 54
    },
    {
        description = "7",
        data = 55
    },
    {
        description = "8",
        data = 56
    },
    {
        description = "9",
        data = 57
    }
}

local header_index = 0
local function Header(title)
    header_index = header_index + 1
    return {
        name = "TLIPOCA_HEADER_" .. header_index,
        label = "【" .. title .. "】",
        hover = "",
        options = { { description = "", data = false } },
        default = false,
    }
end

local configuration = {
    Header("三维属性"),
    {
        name = "TLIPOCA_HEALTH",
        label = "生命值",
        hover = "由于生死流转机制，实际血量约为设置量的2倍",
        default = 75,
        options = {
            {description = "37.5", data = 37.5},
            {description = "50", data = 50},
            {description = "75 (默认)", data = 75},
            {description = "100", data = 100},
            {description = "150", data = 150},
            {description = "200", data = 200},
        },
    },
    {
        name = "TLIPOCA_HUNGER",
        label = "饥饿值",
        default = 100,
        options = {
            {description = "75", data = 75},
            {description = "100 (默认)", data = 100},
            {description = "125", data = 125},
            {description = "150", data = 150},
            {description = "200", data = 200},
        },
    },
    {
        name = "TLIPOCA_SANITY",
        label = "理智值",
        default = 150,
        options = {
            {description = "75", data = 75},
            {description = "100", data = 100},
            {description = "150 (默认)", data = 150},
            {description = "200", data = 200},
        },
    },

    Header("开局设置"),
    {
        name = "TLIPOCA_START_MODE",
        label = "初始携带物品",
        default = "normal",
        options = {
            {description = "新手", data = "easy_noob", hover = "4纯净灵魂+死神斗篷+重生护符"},
            {description = "简单", data = "easy", hover = "2纯净灵魂+2灵魂碎片+重生护符"},
            {description = "普通 (默认)", data = "normal", hover = "4灵魂碎片"},
            {description = "困难", data = "hard", hover = "1灵魂碎片"},
        },
    },

    Header("状态切换阈值"),
    {
        name = "TLIPOCA_RELAX_SANITY_THRESHOLD",
        label = "清醒状态理智阈值",
        hover = "理智大于等于此百分比时进入清醒状态",
        default = 0.8,
        options = {
            {description = "70%", data = 0.7},
            {description = "80% (默认)", data = 0.8},
            {description = "90%", data = 0.9},
            {description = "100%", data = 1.0},
        },
    },
    {
        name = "TLIPOCA_HUNTER_SANITY_THRESHOLD",
        label = "屠杀状态理智阈值",
        hover = "理智小于此百分比时进入屠杀状态",
        default = 0.3,
        options = {
            {description = "10%", data = 0.1},
            {description = "20%", data = 0.2},
            {description = "30% (默认)", data = 0.3},
            {description = "40%", data = 0.4},
        },
    },

    Header("清醒状态效果"),
    {
        name = "TLIPOCA_RELAX_SPEED_BONUS",
        label = "清醒状态移速加成",
        default = 0.1,
        options = {
            {description = "0%", data = 0},
            {description = "5%", data = 0.05},
            {description = "10% (默认)", data = 0.1},
            {description = "15%", data = 0.15},
            {description = "20%", data = 0.2},
        },
    },
    {
        name = "TLIPOCA_RELAX_DMG_REDUCTION",
        label = "清醒状态受伤减免",
        default = 0.2,
        options = {
            {description = "无", data = 0},
            {description = "10%", data = 0.1},
            {description = "20% (默认)", data = 0.2},
            {description = "30%", data = 0.3},
            {description = "40%", data = 0.4},
        },
    },
    {
        name = "TLIPOCA_RELAX_ATK_MULT",
        label = "清醒状态攻击倍率",
        default = 0.8,
        options = {
            {description = "0.6", data = 0.6},
            {description = "0.8 (默认)", data = 0.8},
            {description = "1.0 (不降低)", data = 1.0},
        },
    },

    Header("屠杀状态效果"),
    {
        name = "TLIPOCA_HUNTER_SPEED_BONUS",
        label = "屠杀状态移速加成",
        default = 0.2,
        options = {
            {description = "10%", data = 0.1},
            {description = "20% (默认)", data = 0.2},
            {description = "30%", data = 0.3},
        },
    },
    {
        name = "TLIPOCA_HUNTER_ATK_BONUS",
        label = "屠杀状态额外攻击力",
        default = 0.5,
        options = {
            {description = "0.3", data = 0.3},
            {description = "0.5 (默认)", data = 0.5},
            {description = "0.7", data = 0.7},
        },
    },
    {
        name = "TLIPOCA_HUNTER_DMG_TAKEN",
        label = "屠杀状态受伤倍率",
        default = 1.5,
        options = {
            {description = "1.2", data = 1.2},
            {description = "1.5 (默认)", data = 1.5},
            {description = "2.0", data = 2.0},
            {description = "1.0 (不增加)", data = 1.0},
        },
    },
    {
        name = "TLIPOCA_NO_NIGHTVISION_CC",
        label = "夜视无滤镜",
        hover = "开启后，特莉波卡的夜视不再使用鼹鼠帽滤镜，保留正常的色彩，原版滤镜不受影响",
        default = true,
        options = {
            {description = "开启 (默认)", data = true},
            {description = "关闭", data = false},
        },
    },
    {
        name = "TLIPOCA_SOUL_CONVERT_INTERVAL",
        label = "灵魂转换间隔(秒)",
        hover = "屠杀状态下每设定的秒数将4个灵魂碎片自动合成为1个纯净灵魂",
        default = 5,
        options = {
            {description = "1", data = 1},
            {description = "3", data = 3},
            {description = "5 (默认)", data = 5},
            {description = "8", data = 8},
            {description = "10", data = 10},
        },
    },

    Header("灵魂失控外溢"),
    {
        name = "TLIPOCA_SELFBOMB_RADIUS",
        label = "自爆半径",
        default = 6,
        options = {
            {description = "4", data = 4},
            {description = "6 (默认)", data = 6},
            {description = "8", data = 8},
        },
    },
    {
        name = "TLIPOCA_SELFBOMB_FEAR_DURATION",
        label = "自爆恐惧持续(秒)",
        default = 10,
        options = {
            {description = "5", data = 5},
            {description = "10 (默认)", data = 10},
            {description = "15", data = 15},
        },
    },
    {
        name = "TLIPOCA_SELFBOMB_FRIENDLY_FIRE",
        label = "自爆友伤",
        hover = "是否对友方玩家造成伤害",
        default = true,
        options = {
            {description = "开启 (默认)", data = true},
            {description = "关闭", data = false},
        },
    },
    {
        name = "TLIPOCA_SELFBOMB_WANDER_DMG_REDUCTION",
        label = "自爆前减伤",
        hover = "随机走动期间的伤害减免，不影响自爆伤害",
        default = 0.25,
        options = {
            {description = "无减伤", data = 0},
            {description = "10%", data = 0.1},
            {description = "25% (默认)", data = 0.25},
            {description = "50%", data = 0.5},
            {description = "99%", data = 0.99},
        },
    },

    Header("生死流转"),
    {
        name = "TLIPOCA_FLOW_HOLD_SECONDS",
        label = "流转满血稳定时长(秒)",
        hover = "生死流转期间回满血后还要保持设定的时间才能回到第一条命",
        default = 5,
        options = {
            {description = "0 (满血立刻退出)", data = 0},
            {description = "2", data = 2},
            {description = "3", data = 3},
            {description = "5 (默认)", data = 5},
            {description = "8", data = 8},
            {description = "10", data = 10},
        },
    },

    Header("生命逆转法阵"),
    {
        name = "TLIPOCA_GUARDIAN_COOLDOWN2HM",
        label = "法阵恢复时间",
        hover = "领取灵魂结晶后法阵自然恢复的时间；提交一枚结晶碎片可以提前恢复",
        default = 960,
        options = {
            {description = "4分钟", data = 240},
            {description = "8分钟", data = 480},
            {description = "16分钟 (默认)", data = 960},
            {description = "24分钟", data = 1440},
            {description = "32分钟", data = 1920},
            {description = "48分钟", data = 2880},
            {description = "64分钟", data = 3840},
        },
    },

    Header("死亡的恐惧"),
    {
        name = "TLIPOCA_FEAR_DMG_PER_TICK",
        label = "恐惧伤害",
        hover = "由特莉波卡赋予的恐惧每0.5秒造成一次无来源真实伤害，对于巨兽生物拥有四倍伤害，谨慎设置",
        default = 25,
        options = {
            {description = "1", data = 1},
            {description = "5", data = 5},
            {description = "10", data = 10},
            {description = "25 (默认)", data = 25},
            {description = "50", data = 50},
            {description = "100", data = 100},
        },
    },

    Header("理智变动"),
    {
        name = "TLIPOCA_SANITY_REGEN_RATE",
        label = "每分钟理智回复/启迪损失",
        default = 6,
        options = {
            {description = "0", data = 0},
            {description = "3", data = 3},
            {description = "6 (默认)", data = 6},
            {description = "12", data = 12},
            {description = "18", data = 18},
        },
    },
    {
        name = "TLIPOCA_KILL_SANITY_PENALTY",
        label = "造成击杀损失理智/增加启迪",
        default = 10,
        options = {
            {description = "0", data = 0},
            {description = "5", data = 5},
            {description = "10 (默认)", data = 10},
            {description = "15", data = 15},
        },
    },

    Header("灵魂碎片"),
    {
        name = "TLIPOCA_SOUL_FRAGMENT_SPAWN_CHANCE",
        label = "灵魂碎片生成几率",
        hover = "周围有生物死亡时生成灵魂碎片的几率",
        default = 0.5,
        options = {
            {description = "25%", data = 0.25},
            {description = "50% (默认)", data = 0.5},
            {description = "75%", data = 0.75},
            {description = "100%", data = 1.0},
        },
    },
    {
        name = "TLIPOCA_SOUL_FRAGMENT_SPOIL_TIME",
        label = "灵魂碎片保鲜期(秒)",
        default = 480,
        options = {
            {description = "240 (半日)", data = 240},
            {description = "480 (默认)", data = 480},
            {description = "960 (两日)", data = 960},
        },
    },
    {
        name = "TLIPOCA_SOUL_FRAGMENT_REFRESH_PERCENT",
        label = "新灵魂碎片恢复其他碎片新鲜度百分比",
        hover = "获得灵魂碎片时，恢复物品栏内每组碎片一定新鲜度，每个碎片仅能触发一次，独立生效",
        default = 0.1,
        options = {
            {description = "关闭 (0%)", data = 0},
            {description = "5%", data = 0.05},
            {description = "10% (默认)", data = 0.1},
            {description = "20%", data = 0.2},
            {description = "50%", data = 0.5},
            {description = "100%", data = 1},
        },
    },

    Header("灵魂锁定"),
    {
        name = "TLIPOCA_SOUL_LOCK_MAX",
        label = "灵魂锁定层数上限",
        hover = "设定对于同一目标的灵魂锁定最多层数",
        default = 10,
        options = {
            {description = "3", data = 3},
            {description = "5", data = 5},
            {description = "8", data = 8},
            {description = "10 (默认)", data = 10},
            {description = "15", data = 15},
            {description = "20", data = 20},
        },
    },
    {
        name = "TLIPOCA_SOUL_LOCK_DMG_OUT",
        label = "每层加伤",
        hover = "特莉波卡每层对被锁定目标的伤害加成",
        default = 0.05,
        options = {
            {description = "0%", data = 0},
            {description = "2%", data = 0.02},
            {description = "3%", data = 0.03},
            {description = "5% (默认)", data = 0.05},
            {description = "8%", data = 0.08},
            {description = "10%", data = 0.1},
        },
    },
    {
        name = "TLIPOCA_SOUL_LOCK_DMG_IN",
        label = "每层减伤",
        hover = "特莉波卡每层受到被锁定目标造成的伤害减免",
        default = 0.05,
        options = {
            {description = "0%", data = 0},
            {description = "1%", data = 0.01},
            {description = "2%", data = 0.02},
            {description = "3%", data = 0.03},
            {description = "5% (默认)", data = 0.05},
            {description = "8%", data = 0.08},
        },
    },
    {
        name = "TLIPOCA_SOUL_LOCK_DURATION",
        label = "掉层触发时间(秒)",
        hover = "停止攻击目标一段时间后开始掉层；一旦开始掉层，之后每秒掉 1 层。继续攻击会重置这个时间",
        default = 10,
        options = {
            {description = "不限时", data = 0,},
            {description = "3", data = 3},
            {description = "5", data = 5},
            {description = "8", data = 8},
            {description = "10 (默认)", data = 10},
            {description = "15", data = 15},
            {description = "20", data = 20},
        },
    },
    {
        name = "TLIPOCA_SOUL_LOCK_CHANCE_HIT",
        label = "命中叠层概率",
        hover = "攻击命中目标时对其叠加一层灵魂锁定的概率",
        default = 0.25,
        options = {
            {description = "不叠层", data = 0},
            {description = "10%", data = 0.1},
            {description = "15%", data = 0.15},
            {description = "20%", data = 0.2},
            {description = "25% (默认)", data = 0.25},
            {description = "35%", data = 0.35},
            {description = "50%", data = 0.5},
            {description = "必定叠层", data = 1},
        },
    },
    {
        name = "TLIPOCA_SOUL_LOCK_CHANCE_HURT",
        label = "受击叠层概率",
        hover = "被击中时对其叠加一层灵魂锁定的概率",
        default = 1,
        options = {
            {description = "不叠层", data = 0},
            {description = "25%", data = 0.25},
            {description = "50%", data = 0.5},
            {description = "75%", data = 0.75},
            {description = "100% (默认)", data = 1},
        },
    },

    Header("化灵魂碎片为力量"),
    {
        name = "TLIPOCA_INFUSE_WEAPON_PLANAR",
        label = "灌注对于近战武器位面伤害加成",
        hover = "注意：如果选择增加，会使原本无位面伤害的武器获得位面伤害，可能导致触发某些机制",
        default = 1,
        options = {
            {description = "不增加", data = 0},
            {description = "1 (默认)", data = 1},
            {description = "5", data = 5},
            {description = "10", data = 10},
            {description = "20", data = 20},
            {description = "30", data = 30},
        },
    },
    {
        name = "TLIPOCA_INFUSE_ARMOR_PLANAR",
        label = "头盔/护甲位面防御加成",
        hover = "注意：如果选择增加，会使原本无位面防御的装备获得位面防御，可能导致触发某些机制",
        default = 1,
        options = {
            {description = "不增加", data = 0},
            {description = "1 (默认)", data = 1},
            {description = "5", data = 5},
            {description = "10", data = 10},
            {description = "20", data = 20},
        },
    },
    {
        name = "TLIPOCA_INFUSE_TOOL_WORK",
        label = "灌注对于工具工作效率加成",
        hover = "提示：可与蜂蜜水晶等玩家侧加成叠加",
        default = 0.5,
        options = {
            {description = "不增加效率", data = 0},
            {description = "+25%", data = 0.25},
            {description = "+50% (默认)", data = 0.5},
            {description = "+100%", data = 1},
            {description = "+200%", data = 2},
        },
    },
    {
        name = "TLIPOCA_INFUSE_DURATION",
        label = "灌注持续(秒)",
        hover = "持续期间内无法对同一物品施加灌注",
        default = 10,
        options = {
            {description = "5", data = 5},
            {description = "10 (默认)", data = 10},
            {description = "20", data = 20},
            {description = "40", data = 40},
            {description = "60", data = 60},
            {description = "120", data = 120},
            {description = "300", data = 300},
        },
    },
    {
        name = "TLIPOCA_INFUSE_FRESH_AS_FULL",
        label = "灌注期间以新鲜度为耐久的装备视为满新鲜值",
        hover = "火腿棒这类装备的伤害随新鲜度下降；开启后灌注期间按满新鲜值结算（新鲜度条也显示为满，实际数值冻结不衰减）。关闭则只冻结新鲜度，伤害仍按当前新鲜度",
        default = true,
        options = {
            {description = "视为满新鲜值 (默认)", data = true},
            {description = "只冻结新鲜度", data = false},
        },
    },

    Header("化纯净灵魂为物品"),
    {
        name = "TLIPOCA_LIVINGLOG_SOUL_COST",
        label = "用纯净灵魂制造1个活木消耗纯净灵魂数量",
        hover = "与下一个选项配合",
        default = 2,
        options = {
            {description = "关闭配方", data = 0},
            {description = "1", data = 1},
            {description = "2 (默认)", data = 2},
            {description = "3", data = 3},
            {description = "4", data = 4},
        },
    },
    {
        name = "TLIPOCA_LIVINGLOG_LOG_COST",
        label = "制造1个活木消耗木头数量",
        hover = "与上一个选项配合。若上一个选项选择“关闭配方”则此项失效",
        default = 8,
        options = {
            {description = "4", data = 4},
            {description = "8 (默认)", data = 8},
            {description = "12", data = 12},
            {description = "16", data = 16},
        },
    },

    Header("你最熟悉的“小红”"),
    {
        name = "TLIPOCA_SCYTHE_DMG",
        label = "物理攻击力",
        default = 51,
        options = {
            {description = "17", data = 17},
            {description = "34", data = 34},
            {description = "51 (默认)", data = 51},
            {description = "68", data = 68},
            {description = "85", data = 85},
            {description = "102", data = 102},
        },
    },
    {
        name = "TLIPOCA_SCYTHE_PLANAR_DMG",
        label = "位面攻击力",
        default = 5,
        options = {
            {description = "0", data = 0},
            {description = "1", data = 1},
            {description = "5 (默认)", data = 5},
            {description = "10", data = 10},
            {description = "20", data = 20},
            {description = "30", data = 30},
        },
    },
    {
        name = "TLIPOCA_SCYTHE_DURABILITY",
        label = "镰刀耐久(攻击次数)",
        default = 100,
        options = {
            {description = "50", data = 50},
            {description = "100 (默认)", data = 100},
            {description = "200", data = 200},
            {description = "300", data = 300},
            {description = "无限", data = -1},
        },
    },
    {
        name = "TLIPOCA_SCYTHE_REFUEL_PCT",
        label = "纯净灵魂补充镰刀耐久百分比",
        default = 0.25,
        options = {
            {description = "10%", data = 0.1},
            {description = "25% (默认)", data = 0.25},
            {description = "50%", data = 0.5},
            {description = "100%", data = 1},
        },
    },
    {
        name = "TLIPOCA_SCYTHE_SOUL_BONUS_COUNT",
        label = "镰刀灵魂加成计数上限",
        hover = "物品栏内每5个纯净灵魂提升镰刀10%物理攻击力，此选项为提升的最大百分比",
        default = 50,
        options = {
            {description = "最多提升50%", data = 25},
            {description = "最多提升100% (默认)", data = 50},
            {description = "最多提升200%", data = 100},
        },
    },

    Header("死神斗篷"),
    {
        name = "TLIPOCA_CLOAK_DURABILITY",
        label = "死神斗篷耐久",
        default = 600,
        options = {
            {description = "300", data = 300},
            {description = "600 (默认)", data = 600},
            {description = "900", data = 900},
            {description = "无限", data = -1},
        },
    },
    {
        name = "TLIPOCA_CLOAK_DEFENSE",
        label = "死神斗篷防御力",
        default = 0.8,
        options = {
            {description = "70%", data = 0.7},
            {description = "80% (默认)", data = 0.8},
            {description = "90%", data = 0.9},
            {description = "95%", data = 0.95},
        },
    },
    {
        name = "TLIPOCA_CLOAK_PLANAR_DEFENSE",
        label = "死神斗篷位面防御",
        default = 5,
        options = {
            {description = "0", data = 0},
            {description = "1", data = 1},
            {description = "5 (默认)", data = 5},
            {description = "10", data = 10},
            {description = "20", data = 20},
        },
    },

    Header("“就冠”"),
    {
        name = "TLIPOCA_CROWN_PLANAR_BONUS",
        label = "皇冠额外位面加成",
        hover = "佩戴皇冠时增加 镰刀位面攻击力/拟态甲位面防御 的数值",
        default = 20,
        options = {
            {description = "1", data = 1},
            {description = "5", data = 5},
            {description = "10", data = 10},
            {description = "20 (默认)", data = 20},
            {description = "30", data = 30},
            {description = "50", data = 50},
        },
    },
    {
        name = "TLIPOCA_ARMOR_DURABILITY",
        label = "灵魂拟态甲耐久",
        default = 500,
        options = {
            {description = "300", data = 300},
            {description = "500 (默认)", data = 500},
            {description = "700", data = 700},
            {description = "900", data = 900},
            {description = "无限", data = -1},
        },
    },
    {
        name = "TLIPOCA_CROWN_HALVE_SOUL_COST",
        label = "佩戴皇冠时释放部分技能消耗是否减半",
        hover = "数量不会低于1。影响范围：纯净灵魂轮盘技能与收割。制作物品、镰刀传送、血影步不受影响",
        default = true,
        options = {
            {description = "关闭", data = false},
            {description = "开启 (默认)", data = true},
        },
    },
    {
        name = "TLIPOCA_SCYTHE_TELEPORT_COST_FUEL",
        label = "使用梦境裂缝消耗镰刀耐久百分比",
        default = 0.5,
        options = {
            {description = "1%", data = 0.01},
            {description = "10%", data = 0.1},
            {description = "25%", data = 0.25},
            {description = "50% (默认)", data = 0.5},
            {description = "75%", data = 0.75},
            {description = "99%", data = 0.99},
        },
    },
    {
        name = "TLIPOCA_SCYTHE_TELEPORT_COST_SOULS",
        label = "使用梦境裂缝消耗纯净灵魂数量",
        default = 10,
        options = {
            {description = "1", data = 1},
            {description = "5", data = 5},
            {description = "10 (默认)", data = 10},
            {description = "20", data = 20},
        },
    },
    {
        name = "TLIPOCA_SCYTHE_TELEPORT_COOLDOWN",
        label = "梦境裂缝冷却(秒)",
        default = 240,
        options = {
            {description = "10", data = 10},
            {description = "60", data = 60},
            {description = "120", data = 120},
            {description = "240 (默认)", data = 240},
            {description = "360", data = 360},
            {description = "480", data = 480},
            {description = "600", data = 600},
        },
    },

    Header("技能按键"),
    {
        name = "TLIPOCA_KEY_HARVEST",
        label = "灵魂收割按键",
        options = keylist,
        default = 103,
    },
    {
        name = "TLIPOCA_KEY_DODGE",
        label = "血红暗影按键",
        options = keylist,
        default = 118,
    },
    {
        name = "TLIPOCA_KEY_REPOSITION",
        label = "镰刀移位按键",
        options = keylist,
        default = 120,
    },

    Header("灵魂汲取/收割"),
    {
        name = "TLIPOCA_HARVEST_DMG",
        label = "收割伤害",
        hover = "灵魂汲取的伤害为该值的一半",
        default = 200,
        options = {
            {description = "34", data = 34},
            {description = "68", data = 68},
            {description = "100", data = 100},
            {description = "200 (默认)", data = 200},
            {description = "300", data = 300},
            {description = "500", data = 500},
            {description = "1000", data = 1000},
        },
    },
    {
        name = "TLIPOCA_HARVEST_THRESHOLD",
        label = "收割阈值",
        hover = "血量低于此百分比时直接斩杀",
        default = 0.2,
        options = {
            {description = "5%", data = 0.05},
            {description = "10%", data = 0.1},
            {description = "20% (默认)", data = 0.2},
            {description = "30%", data = 0.3},
            {description = "50%", data = 0.5},
        },
    },
    {
        name = "TLIPOCA_HARVEST_COST",
        label = "收割消耗纯净灵魂",
        default = 2,
        options = {
            {description = "1", data = 1},
            {description = "2 (默认)", data = 2},
            {description = "4", data = 4},
        },
    },
    {
        name = "TLIPOCA_HARVEST_COOLDOWN",
        label = "收割冷却(秒)",
        hover = "本体/镰刀收割的基础冷却；灵魂汲取固定为此数值的一半，三种技能仍共用冷却",
        default = 60,
        options = {
            {description = "10", data = 10},
            {description = "30", data = 30},
            {description = "60 (默认)", data = 60},
            {description = "90", data = 90},
        },
    },
    {
        name = "TLIPOCA_HARVEST_FEAR_DURATION",
        label = "收割恐惧时长(秒)",
        hover = "本体/镰刀收割命中后, 对存活目标施加恐惧",
        default = 6,
        options = {
            {description = "不施加恐惧", data = 0},
            {description = "2", data = 2},
            {description = "4", data = 4},
            {description = "6 (默认)", data = 6},
            {description = "8", data = 8},
            {description = "10", data = 10},
        },
    },

    Header("血红暗影"),
    {
        name = "TLIPOCA_DODGE_PARRY_DURATION",
        label = "闪避架势持续时间(秒)",
        hover = "在架势期间受击，才能触发技能",
        default = 0.5,
        options = {
            {description = "0.1", data = 0.1},
            {description = "0.3", data = 0.3},
            {description = "0.5 (默认)", data = 0.5},
            {description = "0.8", data = 0.8},
            {description = "1", data = 1},
        },
    },
    {
        name = "TLIPOCA_DODGE_COOLDOWN",
        label = "招架冷却(秒)",
        hover = "成功招架不进入危险状态，仅手持灵魂镰刀清空冷却；失败后整个冷却期间受伤翻倍，首次受伤重置一次冷却",
        default = 10,
        options = {
            {description = "3", data = 3},
            {description = "5", data = 5},
            {description = "10 (默认)", data = 10},
            {description = "15", data = 15},
            {description = "20", data = 20},
            {description = "30", data = 30},
        },
    },
    {
        name = "TLIPOCA_DODGE_FREE_RESET_LIMIT",
        label = "镰刀连续重置冷却次数",
        hover = "手持灵魂镰刀闪避清空冷却，最多连续清空的次数，之后进入冷却",
        default = 3,
        options = {
            {description = "不重置", data = 0, hover = "每次招架成功都要进冷却"},
            {description = "1 次", data = 1},
            {description = "2 次", data = 2},
            {description = "3 次 (默认)", data = 3},
            {description = "4 次", data = 4},
            {description = "5 次", data = 5},
            {description = "8 次", data = 8},
            {description = "不限", data = -1},
        },
    },
    {
        name = "TLIPOCA_DODGE_LEAP_DMG_PCT",
        label = "闪避反击伤害倍率",
        hover = "潜行技能的破隐一击倍率为此值的两倍",
        default = 1.5,
        options = {
            {description = "50%", data = 0.5},
            {description = "100%", data = 1},
            {description = "150% (默认)", data = 1.5},
            {description = "200%", data = 2},
            {description = "250%", data = 2.5},
        },
    },
    {
        name = "TLIPOCA_DODGE_LEAP_RADIUS",
        label = "闪避反击范围半径",
        default = 4,
        options = {
            {description = "较小", data = 2, hover = "几乎不能攻击到主目标以外的敌人"},
            {description = "默认", data = 4},
            {description = "较大", data = 6},
            {description = "大", data = 8},
        },
    },

    Header("死神之眼"),
    {
        name = "TLIPOCA_FORCE_HUNTER_DURATION",
        label = "死神之眼持续(秒)",
        default = 30,
        options = {
            {description = "15", data = 15},
            {description = "30 (默认)", data = 30},
            {description = "45", data = 45},
            {description = "60", data = 60},
        },
    },
    {
        name = "TLIPOCA_FORCE_HUNTER_ATK_BONUS_PER_SANITY",
        label = "死神之眼额外攻击加成",
        hover = "扣除理智超过50后，每多扣1理智获得一层此攻击加成，最多叠加50层，即扣除100理智达到最大值",
        default = 0.01,
        options = {
            {description = "0.5%", data = 0.005},
            {description = "1% (默认)", data = 0.01},
            {description = "1.5%", data = 0.015},
            {description = "2%", data = 0.02},
            {description = "5%", data = 0.05},
        },
    },
    {
        name = "TLIPOCA_FORCE_HUNTER_COST",
        label = "死神之眼消耗纯净灵魂",
        default = 10,
        options = {
            {description = "4", data = 4},
            {description = "6", data = 6},
            {description = "8", data = 8},
            {description = "10 (默认)", data = 10},
            {description = "12", data = 12},
            {description = "14", data = 14},
            {description = "16", data = 16},
        },
    },
    {
        name = "TLIPOCA_FORCE_HUNTER_MERIT_DAMAGE",
        label = "死神之眼叠层所需伤害",
        hover = "每对大型生物/巨兽累计造成该伤害叠加1层",
        default = 300,
        options = {
            {description = "100", data = 100},
            {description = "200", data = 200},
            {description = "300 (默认)", data = 300},
            {description = "400", data = 400},
            {description = "600", data = 600},
            {description = "1000", data = 1000},
        },
    },
    {
        name = "TLIPOCA_FORCE_HUNTER_COOLDOWN",
        label = "死神之眼冷却(秒)",
        default = 60,
        options = {
            {description = "10", data = 10},
            {description = "30", data = 30},
            {description = "60 (默认)", data = 60},
            {description = "90", data = 90},
        },
    },

    Header("灵魂潜行"),
    {
        name = "TLIPOCA_STEALTH_SPEED_PENALTY",
        label = "潜行减速",
        default = 0.2,
        options = {
            {description = "不减速", data = 0},
            {description = "5%", data = 0.05},
            {description = "10%", data = 0.1},
            {description = "20% (默认)", data = 0.2},
            {description = "30%", data = 0.3},
        },
    },
    {
        name = "TLIPOCA_STEALTH_DURATION",
        label = "潜行持续(秒)",
        default = 30,
        options = {
            {description = "15", data = 15},
            {description = "30 (默认)", data = 30},
            {description = "45", data = 45},
            {description = "60", data = 60},
        },
    },
    {
        name = "TLIPOCA_STEALTH_COST",
        label = "灵魂潜行消耗纯净灵魂",
        default = 4,
        options = {
            {description = "2", data = 2},
            {description = "4 (默认)", data = 4},
            {description = "6", data = 6},
        },
    },
    {
        name = "TLIPOCA_STEALTH_COOLDOWN",
        label = "灵魂潜行冷却(秒)",
        default = 60,
        options = {
            {description = "10", data = 10},
            {description = "30", data = 30},
            {description = "60 (默认)", data = 60},
            {description = "90", data = 90},
        },
    },

    Header("灵魂双生"),
    {
        name = "TLIPOCA_TWIN_COST",
        label = "灵魂双生消耗纯净灵魂",
        default = 10,
        options = {
            {description = "6", data = 6},
            {description = "10 (默认)", data = 10},
            {description = "14", data = 14},
        },
    },
    {
        name = "TLIPOCA_TWIN_DMG_PCT",
        label = "分身伤害百分比",
        hover = "分身造成的普攻伤害以镰刀当前的伤害为基准",
        default = 0.8,
        options = {
            {description = "60%", data = 0.6},
            {description = "80% (默认)", data = 0.8},
            {description = "100%", data = 1.0},
        },
    },
    {
        name = "TLIPOCA_TWIN_COOLDOWN",
        label = "灵魂双生/切换冷却(秒)",
        hover = "这个值没什么用，只是为了防止连续点击而已",
        default = 3,
        options = {
            {description = "1", data = 1},
            {description = "3 (默认)", data = 3},
            {description = "5", data = 5},
        },
    },

    Header("血影步"),
    {
        name = "TLIPOCA_SHADEWALK_COST_INITIAL",
        label = "血影步开启消耗纯净灵魂数量",
        hover = "按住右键启动血影步时立即消耗的纯净灵魂，不足则无法启动",
        default = 4,
        options = {
            {description = "2", data = 2},
            {description = "4 (默认)", data = 4},
            {description = "6", data = 6},
            {description = "8", data = 8},
        },
    },
    {
        name = "TLIPOCA_SHADEWALK_COST_PER_SECOND",
        label = "血影步每秒消耗纯净灵魂数量",
        hover = "持续期间每个整秒消耗的纯净灵魂; 灵魂不足会立刻中断",
        default = 4,
        options = {
            {description = "1", data = 1},
            {description = "2", data = 2},
            {description = "4 (默认)", data = 4},
            {description = "6", data = 6},
            {description = "8", data = 8},
        },
    },
    {
        name = "TLIPOCA_SHADEWALK_DURATION",
        label = "血影步持续(秒)",
        hover = "最长持续时间, 到点自动结束并进入冷却",
        default = 5,
        options = {
            {description = "3", data = 3},
            {description = "5 (默认)", data = 5},
            {description = "8", data = 8},
            {description = "10", data = 10},
            {description = "15", data = 15},
        },
    },
    {
        name = "TLIPOCA_SHADEWALK_COOLDOWN",
        label = "血影步冷却(秒)",
        default = 60,
        options = {
            {description = "15", data = 15},
            {description = "30", data = 30},
            {description = "60 (默认)", data = 60},
            {description = "90", data = 90},
            {description = "120", data = 120},
        },
    },
    {
        name = "TLIPOCA_SHADEWALK_SPEED_MULT",
        label = "血影步速度",
        hover = "对比正常走路的速度",
        default = 3,
        options = {
            {description = "150%", data = 1.5},
            {description = "200%", data = 2},
            {description = "300% (默认)", data = 3},
            {description = "400%", data = 4},
            {description = "500%", data = 5},
        },
    },

    Header("聆听神谕"),
    {
        name = "TLIPOCA_ORACLE_LAYOUT",
        label = "神谕界面布局",
        default = "arch",
        options = {
            {description = "拱门 (默认)", data = "arch"},
            {description = "祭坛", data = "altar"},
        },
    },
    {
        name = "TLIPOCA_ORACLE_BACKGROUND",
        label = "神谕界面背景",
        default = "cookbook",
        options = {
            {description = "残页", data = "cookbook"},
            {description = "书本", data = "plantregistry"},
        },
    },
    {
        name = "TLIPOCA_POOL_THRESHOLDS",
        label = "卡池升级所需存活天数",
        default = 1,
        options = {
            {description = "10, 15, 20, 25, 30 (默认)", data = 1},
            {description = "20, 15, 20, 15, 20", data = 2},
            {description = "每10天提升一级", data = 3},
            {description = "每天提升一级", data = 4},
        },
    },
    {
        name = "TLIPOCA_SUPREME_PITY_STEP",
        label = "至高保底增幅",
        hover = "3级卡池起，距上次至高神谕超过10次抽取后，每次额外提高的至高出现概率",
        default = 1,
        options = {
            {description = "+0.5%", data = 0.5},
            {description = "+1% (默认)", data = 1},
            {description = "+2%", data = 2},
            {description = "+3%", data = 3},
            {description = "+5%", data = 5},
        },
    },
    {
        name = "TLIPOCA_NEGATIVE_ENABLED",
        label = "负面神谕入池",
        hover = "开启后负面神谕自3级卡池起占5%出现（从空白概率挪出）；关闭则完全不加入卡池",
        default = false,
        options = {
            {description = "关闭 (默认)", data = false},
            {description = "开启", data = true},
        },
    },

    Header("杂项"),
    {
        name = "TLIPOCA_SLEEP_REQUIRED_SOULS",
        label = "灵魂债务焦虑症",
        hover = "未佩戴夜之皇冠时，若身上的纯净灵魂不超过此数量时不能睡觉",
        default = 40,
        options = {
            {description = "关闭限制", data = 0},
            {description = "10", data = 10},
            {description = "20", data = 20},
            {description = "40 (默认)", data = 40},
            {description = "60", data = 60},
            {description = "80", data = 80},
        },
    },
    {
        name = "TLIPOCA_NO_MONKEY_CURSE",
        label = "特莉波卡免疫变猴",
        hover = "开启后诅咒饰品不会选择特莉波卡作为目标，不会被诅咒变猴，但仍可拾取诅咒饰品作为普通物品",
        default = false,
        options = {
            {description = "开启", data = true},
            {description = "关闭 (默认)", data = false},
        },
    },
    {
        name = "TLIPOCA_COOK_FAIL_CHANCE",
        label = "烹饪低手特莉波卡",
        hover = "特莉波卡点火烹饪时，无论成品本该是什么，都有概率做成一锅潮湿黏糊",
        default = 0.2,
        options = {
            {description = "实则烹饪高手！(0%)", data = 0},
            {description = "10%", data = 0.1},
            {description = "15%", data = 0.15},
            {description = "20% (默认)", data = 0.2},
            {description = "30%", data = 0.3},
            {description = "50%", data = 0.5},
            {description = "75%", data = 0.75},
            {description = "99%", data = 0.99},
        },
    },
}
configuration_options = configuration
