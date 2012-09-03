local main_key = KEYS[1]
local from = tonumber(ARGV[1])
local to = tonumber(ARGV[2])
local amount = tonumber(ARGV[3])
local final_set = {}

for counter = from, to do
  for k,v in pairs(redis.call('evalsha','bd8d94deaa1113ee0c1beae00bab6de0cc88be89',1,main_key .. counter,tostring(amount))) do
     final_set[#final_set+1] = v
  end
end

return final_set
