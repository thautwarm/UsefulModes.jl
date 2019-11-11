module UsefulModes
export link_start!

using DataStructures
using ReplMaker
using REPL.LineEdit
# a bug of julia? workaround:
modes = Dict{Symbol, Any}()
fs = Function[]
register(f) = push!(fs, f)

include("astmode.jl")
include("selectormode.jl")

register() do
    enter_mode!(modes[:selector])
end

link_start!() = begin
    for each in fs
        each()
    end
    println("available modes:")
    for each in keys(modes)
        print(each, " ")
    end
end
end # module
