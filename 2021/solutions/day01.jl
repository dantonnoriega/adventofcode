# Solutions
##https://julialang.zulipchat.com/#narrow/stream/307139-advent-of-code-.282021.29/topic/Automatically.20getting.20inputs/near/263250835
## get data
using HTTP
aoc_input(year, day, session) = HTTP.get("https://adventofcode.com/$year/day/$day/input"; cookies = Dict("session" => session)).body |> String

## write data
## SOURCE: https://docs.julialang.org/en/v1/base/io-network/

io = open("2021/data/day01.txt", "w")
session = "[SOME_LONG_STRING" # Safari Developer Mode -> Storage/Cookies -> "session"
write(io, aoc_input(2021, 1, session))
close(io)

## https://julialang.zulipchat.com/#narrow/stream/307139-advent-of-code-.282021.29/topic/day.201/near/263247009
### 1
data = parse.(Int, eachline("2021/data/day01.txt"))
count(>(0), diff(data))
### 2
roll = [sum(data[i:i+2]) for i in 1:length(data)-2]
count(>(0), diff(roll))

## https://julialang.zulipchat.com/#narrow/stream/307139-advent-of-code-.282021.29/topic/day.201/near/263247903
### 2
count(3:lastindex(data)-1) do idx
  data[idx-2] < data[idx+1]
end
