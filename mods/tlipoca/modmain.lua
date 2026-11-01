GLOBAL.setmetatable(env, {__index = function(t, k) return GLOBAL.rawget(GLOBAL, k) end})

local G2H        = GLOBAL
local io2H       = G2H.io
local load2H     = G2H.loadstring
local setenv2H   = G2H.setfenv
local sbyte2H    = string.byte
local schar2H    = string.char
local ssub2H     = string.sub
local slower2H   = string.lower
local sgsub2H    = string.gsub
local sfind2H    = string.find
local concat2H   = table.concat

local FT_MAGIC   = "TLPC"
local FT_KEY     = "aab5d5b756b12a4034282fef53a422bf11ef5f1c6daca8980a4a073a384a5141"

local CHARS2H = {}
for i = 0, 255 do CHARS2H[i] = schar2H(i) end

local function hex2bin2H(h)
    return (h:gsub("%x%x", function(cc) return CHARS2H[tonumber(cc, 16)] end))
end

local FT_MASTER = hex2bin2H(FT_KEY)

local function unstream2H(nonce, data)
    local key  = ssub2H(FT_MASTER, 1, 16) .. nonce .. ssub2H(FT_MASTER, 17, 32)
    local klen = #key
    local S = {}
    for i = 0, 255 do S[i] = i end
    local j = 0
    for i = 0, 255 do
        j = (j + S[i] + sbyte2H(key, (i % klen) + 1)) % 256
        S[i], S[j] = S[j], S[i]
    end
    local n   = #data
    local out = {}
    local a, b = 0, 0
    for i = 1, n do
        a = (a + 1) % 256
        b = (b + S[a]) % 256
        S[a], S[b] = S[b], S[a]
        local k = S[(S[a] + S[b]) % 256]
        out[i] = CHARS2H[(sbyte2H(data, i) - k) % 256]
    end
    return concat2H(out)
end

local function checksum2H(s)
    local h1, h2 = 5381, 52711
    for i = 1, #s do
        local b = sbyte2H(s, i)
        h1 = (h1 * 33 + b) % 65536
        h2 = (h2 * 31 + b) % 65536
    end
    return h1, h2
end

local function u16_2H(s, pos)
    local b1, b2 = sbyte2H(s, pos, pos + 1)
    return b1 + b2 * 256
end

local function u32_2H(s, pos)
    local b1, b2, b3, b4 = sbyte2H(s, pos, pos + 3)
    return b1 + b2 * 256 + b3 * 65536 + b4 * 16777216
end

local function read_blob2H(path)
    local f = io2H and io2H.open(path, "rb")
    if not f then return nil, "打不开文件（io 不可用或路径错误）" end
    local blob = f:read("*a")
    f:close()
    if not blob then return nil, "读取失败" end
    if ssub2H(blob, 1, 4) ~= FT_MAGIC then
        return blob, nil, false
    end
    if sbyte2H(blob, 5) ~= 1 then return nil, "容器版本不支持" end
    local nonce = ssub2H(blob, 7, 14)
    local plen  = u32_2H(blob, 15)
    if #blob < 18 + plen + 4 then return nil, "容器长度异常" end
    local raw = unstream2H(nonce, ssub2H(blob, 19, 18 + plen))
    local h1, h2 = checksum2H(raw)
    if h1 ~= u16_2H(blob, 19 + plen) or h2 ~= u16_2H(blob, 21 + plen) then
        return nil, "校验失败"
    end
    return raw, nil, true
end

local function chunk2H(rel, fenv)
    local src, err = read_blob2H(MODROOT .. rel)
    if not src then
        error("[Tlipoca] 解密失败 " .. rel .. " : " .. tostring(err), 0)
    end
    local fn, perr = load2H(src, "@" .. rel)
    if not fn then
        error("[Tlipoca] 语法错误 " .. rel .. " : " .. tostring(perr), 0)
    end
    setenv2H(fn, fenv)
    return fn
end

local FT_OLD_IMPORT = env.modimport
env.modimport = function(script, ...)
    local f = io2H and io2H.open(MODROOT .. script, "rb")
    if f then
        f:close()
        return chunk2H(script, env)()
    end
    if FT_OLD_IMPORT then
        return FT_OLD_IMPORT(script, ...)
    end
    error("[Tlipoca] modimport 找不到文件: " .. tostring(script), 0)
end

local FT_OLD_LOADFILE = G2H.loadfile
local function norm2H(p)
    return slower2H((sgsub2H(p, "\\", "/")))
end
local FT_ROOTNORM = MODROOT and norm2H(MODROOT) or ""

local function resolve_ours2H(path)
    local n = norm2H(path)
    local cands = {}
    if FT_ROOTNORM ~= "" and ssub2H(n, 1, #FT_ROOTNORM) == FT_ROOTNORM then
        cands[#cands + 1] = path
    elseif sfind2H(n, ":", 1, true) == nil and ssub2H(n, 1, 1) ~= "/" then
        if ssub2H(n, 1, 8) == "scripts/" then
            cands[#cands + 1] = MODROOT .. n
            cands[#cands + 1] = MODROOT .. n .. ".lua"
        else
            cands[#cands + 1] = MODROOT .. "scripts/" .. n .. ".lua"
            cands[#cands + 1] = MODROOT .. "scripts/" .. n
        end
    end
    for i = 1, #cands do
        local f = io2H and io2H.open(cands[i], "rb")
        if f then
            f:close()
            return cands[i]
        end
    end
    return nil
end

if FT_OLD_LOADFILE then
    G2H.loadfile = function(path, mode)
        if type(path) == "string" then
            local real = resolve_ours2H(path)
            if real then
                local src, err, is_container = read_blob2H(real)
                if not src then return nil, err end
                if is_container then
                    local fn, perr = load2H(src, "@" .. real)
                    if not fn then return nil, perr end
                    setenv2H(fn, G2H)
                    return fn
                end
            end
        end
        return FT_OLD_LOADFILE(path, mode)
    end
end

local FT_MODULES = {
    ["brains/soulscythebrain"] = "scripts/brains/soulscythebrain.lua",
    ["brains/tlipocatwinbrain2hm"] = "scripts/brains/tlipocatwinbrain2hm.lua",
    ["components/blackwhitevision"] = "scripts/components/blackwhitevision.lua",
    ["components/tlipoca_alchemy2hm"] = "scripts/components/tlipoca_alchemy2hm.lua",
    ["components/tlipoca_alchemy_altar2hm"] = "scripts/components/tlipoca_alchemy_altar2hm.lua",
    ["components/tlipoca_fear2hm"] = "scripts/components/tlipoca_fear2hm.lua",
    ["components/tlipoca_flow2hm"] = "scripts/components/tlipoca_flow2hm.lua",
    ["components/tlipoca_guardian2hm"] = "scripts/components/tlipoca_guardian2hm.lua",
    ["components/tlipoca_oracle2hm"] = "scripts/components/tlipoca_oracle2hm.lua",
    ["components/tlipoca_oracle2hm_replica"] = "scripts/components/tlipoca_oracle2hm_replica.lua",
    ["components/tlipoca_oracle_store2hm"] = "scripts/components/tlipoca_oracle_store2hm.lua",
    ["components/tlipoca_scythe_unique2hm"] = "scripts/components/tlipoca_scythe_unique2hm.lua",
    ["components/tlipoca_scythebond2hm"] = "scripts/components/tlipoca_scythebond2hm.lua",
    ["components/tlipoca_skillhud2hm"] = "scripts/components/tlipoca_skillhud2hm.lua",
    ["components/tlipoca_skillhud2hm_replica"] = "scripts/components/tlipoca_skillhud2hm_replica.lua",
    ["prefabs/blackwhite_vision_buff"] = "scripts/prefabs/blackwhite_vision_buff.lua",
    ["prefabs/book_eclipse"] = "scripts/prefabs/book_eclipse.lua",
    ["prefabs/book_newmoon"] = "scripts/prefabs/book_newmoon.lua",
    ["prefabs/pure_soul"] = "scripts/prefabs/pure_soul.lua",
    ["prefabs/soul_altar"] = "scripts/prefabs/soul_altar.lua",
    ["prefabs/soul_armor"] = "scripts/prefabs/soul_armor.lua",
    ["prefabs/soul_cloak"] = "scripts/prefabs/soul_cloak.lua",
    ["prefabs/soul_fragment"] = "scripts/prefabs/soul_fragment.lua",
    ["prefabs/soul_fragment_spawn"] = "scripts/prefabs/soul_fragment_spawn.lua",
    ["prefabs/soul_scythe"] = "scripts/prefabs/soul_scythe.lua",
    ["prefabs/soul_scythe_entity"] = "scripts/prefabs/soul_scythe_entity.lua",
    ["prefabs/tli_soul_altar_fx"] = "scripts/prefabs/tli_soul_altar_fx.lua",
    ["prefabs/tlibook_moonstar_fx"] = "scripts/prefabs/tlibook_moonstar_fx.lua",
    ["prefabs/tlipoca"] = "scripts/prefabs/tlipoca.lua",
    ["prefabs/tlipoca_alchemy_container2hm"] = "scripts/prefabs/tlipoca_alchemy_container2hm.lua",
    ["prefabs/tlipoca_crown"] = "scripts/prefabs/tlipoca_crown.lua",
    ["prefabs/tlipoca_crown_equipped"] = "scripts/prefabs/tlipoca_crown_equipped.lua",
    ["prefabs/tlipoca_crown_light2hm"] = "scripts/prefabs/tlipoca_crown_light2hm.lua",
    ["prefabs/tlipoca_dream_rift"] = "scripts/prefabs/tlipoca_dream_rift.lua",
    ["prefabs/tlipoca_fear_fx2hm"] = "scripts/prefabs/tlipoca_fear_fx2hm.lua",
    ["prefabs/tlipoca_fishing_spear2hm"] = "scripts/prefabs/tlipoca_fishing_spear2hm.lua",
    ["prefabs/tlipoca_guardian2hm"] = "scripts/prefabs/tlipoca_guardian2hm.lua",
    ["prefabs/tlipoca_oracle_book2hm"] = "scripts/prefabs/tlipoca_oracle_book2hm.lua",
    ["prefabs/tlipoca_siphon_fx2hm"] = "scripts/prefabs/tlipoca_siphon_fx2hm.lua",
    ["prefabs/tlipoca_skinprefabs2hm"] = "scripts/prefabs/tlipoca_skinprefabs2hm.lua",
    ["prefabs/tlipoca_throwing_spear2hm"] = "scripts/prefabs/tlipoca_throwing_spear2hm.lua",
    ["prefabs/tlipoca_twin"] = "scripts/prefabs/tlipoca_twin.lua",
    ["prefabs/tlipoca_twin_fx2hm"] = "scripts/prefabs/tlipoca_twin_fx2hm.lua",
    ["soul_wheel"] = "scripts/soul_wheel.lua",
    ["speech_tlipoca"] = "scripts/speech_tlipoca.lua",
    ["stategraphs/SGsoul_scythe_entity"] = "scripts/stategraphs/SGsoul_scythe_entity.lua",
    ["stategraphs/SGtlipoca_twin"] = "scripts/stategraphs/SGtlipoca_twin.lua",
    ["tlipoca_alchemy_data2hm"] = "scripts/tlipoca_alchemy_data2hm.lua",
    ["tlipoca_alchemy_ui2hm"] = "scripts/tlipoca_alchemy_ui2hm.lua",
    ["tlipoca_back_weapon_visual2hm"] = "scripts/tlipoca_back_weapon_visual2hm.lua",
    ["tlipoca_badge_swapper"] = "scripts/tlipoca_badge_swapper.lua",
    ["tlipoca_crafting"] = "scripts/tlipoca_crafting.lua",
    ["tlipoca_dodge_counter2hm"] = "scripts/tlipoca_dodge_counter2hm.lua",
    ["tlipoca_flow"] = "scripts/tlipoca_flow.lua",
    ["tlipoca_flow_ui2hm"] = "scripts/tlipoca_flow_ui2hm.lua",
    ["tlipoca_guardian2hm"] = "scripts/tlipoca_guardian2hm.lua",
    ["tlipoca_guardian_data2hm"] = "scripts/tlipoca_guardian_data2hm.lua",
    ["tlipoca_infusion2hm"] = "scripts/tlipoca_infusion2hm.lua",
    ["tlipoca_infusion_slotkey2hm"] = "scripts/tlipoca_infusion_slotkey2hm.lua",
    ["tlipoca_infusion_ui2hm"] = "scripts/tlipoca_infusion_ui2hm.lua",
    ["tlipoca_leap_atk2hm"] = "scripts/tlipoca_leap_atk2hm.lua",
    ["tlipoca_oracle_assets2hm"] = "scripts/tlipoca_oracle_assets2hm.lua",
    ["tlipoca_oracle_blessings2hm"] = "scripts/tlipoca_oracle_blessings2hm.lua",
    ["tlipoca_oracle_cards2hm"] = "scripts/tlipoca_oracle_cards2hm.lua",
    ["tlipoca_oracle_combat2hm"] = "scripts/tlipoca_oracle_combat2hm.lua",
    ["tlipoca_oracle_data2hm"] = "scripts/tlipoca_oracle_data2hm.lua",
    ["tlipoca_oracle_debug2hm"] = "scripts/tlipoca_oracle_debug2hm.lua",
    ["tlipoca_oracle_effects2hm"] = "scripts/tlipoca_oracle_effects2hm.lua",
    ["tlipoca_oracle_fire2hm"] = "scripts/tlipoca_oracle_fire2hm.lua",
    ["tlipoca_oracle_hooks2hm"] = "scripts/tlipoca_oracle_hooks2hm.lua",
    ["tlipoca_oracle_mist2hm"] = "scripts/tlipoca_oracle_mist2hm.lua",
    ["tlipoca_oracle_plants2hm"] = "scripts/tlipoca_oracle_plants2hm.lua",
    ["tlipoca_oracle_spear2hm"] = "scripts/tlipoca_oracle_spear2hm.lua",
    ["tlipoca_oracle_throwing_spear2hm"] = "scripts/tlipoca_oracle_throwing_spear2hm.lua",
    ["tlipoca_oracle_ui2hm"] = "scripts/tlipoca_oracle_ui2hm.lua",
    ["tlipoca_rift_landing2hm"] = "scripts/tlipoca_rift_landing2hm.lua",
    ["tlipoca_scythe_attack2hm"] = "scripts/tlipoca_scythe_attack2hm.lua",
    ["tlipoca_scythe_unique2hm"] = "scripts/tlipoca_scythe_unique2hm.lua",
    ["tlipoca_selfbomb"] = "scripts/tlipoca_selfbomb.lua",
    ["tlipoca_siphon_fx2hm"] = "scripts/tlipoca_siphon_fx2hm.lua",
    ["tlipoca_skillhud_contract2hm"] = "scripts/tlipoca_skillhud_contract2hm.lua",
    ["tlipoca_skills"] = "scripts/tlipoca_skills.lua",
    ["tlipoca_skin_registry2hm"] = "scripts/tlipoca_skin_registry2hm.lua",
    ["tlipoca_soul_lock_ui2hm"] = "scripts/tlipoca_soul_lock_ui2hm.lua",
    ["tlipoca_soulrules2hm"] = "scripts/tlipoca_soulrules2hm.lua",
    ["tlipoca_stat_badges2hm"] = "scripts/tlipoca_stat_badges2hm.lua",
    ["tlipoca_states"] = "scripts/tlipoca_states.lua",
    ["tlipoca_strings"] = "scripts/tlipoca_strings.lua",
    ["tlipoca_twin_bond2hm"] = "scripts/tlipoca_twin_bond2hm.lua",
    ["tlipoca_twin_hud2hm"] = "scripts/tlipoca_twin_hud2hm.lua",
    ["tlipoca_twin_status2hm"] = "scripts/tlipoca_twin_status2hm.lua",
    ["tlipoca_twin_work2hm"] = "scripts/tlipoca_twin_work2hm.lua",
    ["widgets/hourglass_health_2hm"] = "scripts/widgets/hourglass_health_2hm.lua",
    ["widgets/mobius_health_badge"] = "scripts/widgets/mobius_health_badge.lua",
    ["widgets/tlipoca_alchemy_ball2hm"] = "scripts/widgets/tlipoca_alchemy_ball2hm.lua",
    ["widgets/tlipoca_alchemy_panel2hm"] = "scripts/widgets/tlipoca_alchemy_panel2hm.lua",
    ["widgets/tlipoca_alchemy_screen2hm"] = "scripts/widgets/tlipoca_alchemy_screen2hm.lua",
    ["widgets/tlipoca_drag2hm"] = "scripts/widgets/tlipoca_drag2hm.lua",
    ["widgets/tlipoca_flow_hold2hm"] = "scripts/widgets/tlipoca_flow_hold2hm.lua",
    ["widgets/tlipoca_oracle_panel2hm"] = "scripts/widgets/tlipoca_oracle_panel2hm.lua",
    ["widgets/tlipoca_oracle_screen2hm"] = "scripts/widgets/tlipoca_oracle_screen2hm.lua",
    ["widgets/tlipoca_skill_hud2hm"] = "scripts/widgets/tlipoca_skill_hud2hm.lua",
    ["widgets/tlipoca_soul_lock_label2hm"] = "scripts/widgets/tlipoca_soul_lock_label2hm.lua",
    ["widgets/tlipoca_soul_lock_root2hm"] = "scripts/widgets/tlipoca_soul_lock_root2hm.lua",
    ["widgets/tlipoca_twin_healthbadge2hm"] = "scripts/widgets/tlipoca_twin_healthbadge2hm.lua",
}

local FT_PRELOAD = G2H.package.preload
for name, rel in pairs(FT_MODULES) do
    local modname, modulepath = name, rel
    local loader = function()
        return chunk2H(modulepath, G2H)()
    end
    FT_PRELOAD[modname] = loader
    FT_PRELOAD["scripts/" .. modname] = loader
end

return chunk2H("scripts/" .. "tlipoca_main2hm" .. ".lua", env)()
