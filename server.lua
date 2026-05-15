local versionUrl = 'https://raw.githubusercontent.com/codebstudios/cb_vehicle_tuner/main/version.txt'

local function getCurrentVersion()
    return GetResourceMetadata(GetCurrentResourceName(), 'version', 0) or 'unknown'
end

local function checkVersion()
    local currentVersion = getCurrentVersion()

    PerformHttpRequest(versionUrl, function(statusCode, body)
        if statusCode ~= 200 or not body or body == '' then
            print(('^1[%s]^7 version check failed: HTTP %s'):format(GetCurrentResourceName(), tostring(statusCode)))
            return
        end

        local latestVersion = body:gsub('%s+', '')

        if latestVersion == currentVersion then
            print(('^2[%s]^7 is up to date (%s).'):format(GetCurrentResourceName(), currentVersion))
            return
        end

        print(('^3[%s]^7 update available. Current: %s | Latest: %s'):format(GetCurrentResourceName(), currentVersion, latestVersion))
    end, 'GET')
end

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then
        return
    end

    print(('^2[%s]^7 started successfully.'):format(GetCurrentResourceName()))

    CreateThread(function()
        Wait(3000)
        checkVersion()
    end)
end)
