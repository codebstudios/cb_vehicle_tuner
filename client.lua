local appliedVehicles = {}

local function copyTable(source)
    local copied = {}

    for key, value in pairs(source or {}) do
        copied[key] = value
    end

    return copied
end

local function mergeTables(baseValues, overrideValues)
    local merged = copyTable(baseValues)

    for key, value in pairs(overrideValues or {}) do
        merged[key] = value
    end

    return merged
end

local function getPresetConfig()
    return {
        baseHandling = CONFIG.baseHandling or CONFIG.handling or {},
        useClassProfiles = CONFIG.useClassProfiles == true,
        useModelProfiles = CONFIG.useModelProfiles == true,
        classProfiles = CONFIG.classProfiles or {},
        modelProfiles = CONFIG.modelProfiles or {}
    }
end

local presetConfig = getPresetConfig()
local modelLookup = {}

local function rebuildModelLookup()
    modelLookup = {}

    for modelName, profile in pairs(presetConfig.modelProfiles or {}) do
        modelLookup[GetHashKey(modelName)] = copyTable(profile)
    end
end

local function applyHandling(vehicle)
    if vehicle == 0 or not DoesEntityExist(vehicle) or GetEntityType(vehicle) ~= 2 then
        return
    end

    local handlingValues = copyTable(presetConfig.baseHandling)

    if presetConfig.useClassProfiles then
        local classProfile = presetConfig.classProfiles[GetVehicleClass(vehicle)]

        if classProfile then
            handlingValues = mergeTables(handlingValues, classProfile)
        end
    end

    if presetConfig.useModelProfiles then
        local modelProfile = modelLookup[GetEntityModel(vehicle)]

        if modelProfile then
            handlingValues = mergeTables(handlingValues, modelProfile)
        end
    end

    if next(handlingValues) == nil then
        return
    end

    for handlingName, value in pairs(handlingValues) do
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', handlingName, value)
    end
end

local function refreshVehicles()
    local vehicles = GetGamePool('CVehicle')
    local activeVehicles = {}

    for index = 1, #vehicles do
        local vehicle = vehicles[index]
        activeVehicles[vehicle] = true

        if not appliedVehicles[vehicle] then
            applyHandling(vehicle)
            appliedVehicles[vehicle] = true
        end
    end

    for vehicle in pairs(appliedVehicles) do
        if not activeVehicles[vehicle] or not DoesEntityExist(vehicle) then
            appliedVehicles[vehicle] = nil
        end
    end
end

AddEventHandler('onClientResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then
        return
    end

    presetConfig = getPresetConfig()
    rebuildModelLookup()

    Wait(1000)
    refreshVehicles()
end)

CreateThread(function()
    rebuildModelLookup()
    Wait(1500)

    while true do
        refreshVehicles()
        Wait(CONFIG.refreshInterval)
    end
end)
