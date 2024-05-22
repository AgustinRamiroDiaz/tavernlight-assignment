require 'busted.runner' ()
require 'q1'

local setStorageValueCalled = "setStorageValueCalled"

local player = {}

function player.setStorageValue(self, id, value)
    self[id] = value
end

function getStorageValue(self, id)
    self[setStorageValueCalled] = true
    return self[id]
end

local loggedStateThatNeedsRelease = 1000


describe('basic test', function()
    it('releases storage on logout', function()
        local myPlayer = setmetatable({}, player)

        myPlayer:setStorageValue(loggedStateThatNeedsRelease, true)

        onLogout(myPlayer)

        assert.falsy(myPlayer:getStorageValue(loggedStateThatNeedsRelease))
        assert.truthy(myPlayer.getStorageValueCalled)
    end)

    -- it('should not try to release storage when its not set', function()
    --     local myPlayer = setmetatable({}, player)

    --     onLogout(myPlayer)

    --     assert.falsy(myPlayer[setStorageValueCalled])
    -- end)
end)
