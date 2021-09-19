local weaponReplaceChances = {
    ["weapon_zm_rifle"] = 0.15,
    ["weapon_zm_shotgun"] = 0.15,
    ["weapon_ttt_m16"] = 0.15,
    ["weapon_zm_mac10"] = 0.15,
    ["weapon_zm_revolver"] = 0.15, -- deagle
    ["weapon_ttt_glock"] = 0.15,
    ["weapon_zm_pistol"] = 0.15, -- five seven
    ["weapon_zm_sledge"] = 0.15 -- HUGE
}

hook.Add("PostCleanupMap",  "CFC_TTTWeaponReplacer_ReplaceWeaponsWithRandom", function()
    for _, ent in pairs(ents.GetAll()) do
        local chance = weaponReplaceChances[ent:GetClass()]
        if chance and  math.random() <= chance  then
            local newEnt = ents.Create("ttt_random_weapon")
            newEnt:SetPos(ent:GetPos())
            newEnt:SetAngles(ent:GetAngles())
            ent:Remove()
            newEnt:Spawn()
        end
    end
end)
