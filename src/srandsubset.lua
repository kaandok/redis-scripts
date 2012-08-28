local key = KEYS[1]
local desired_size = tonumber(ARGV[1])
local member_controller = {}
local member_controller_count = 0
local final_set = {}
local setSize = tonumber(redis.call('scard',key))

if setSize <= desired_size then 
  final_set = redis.call('smembers',key)
else
  repeat
    local candidate = redis.call('srandmember',key)
    if not member_controller[candidate] then
      member_controller[candidate] = true
      member_controller_count = member_controller_count + 1
    end
  until member_controller_count == desired_size
  for k,_ in pairs(member_controller) do final_set[#final_set+1] = k end
end

return final_set
