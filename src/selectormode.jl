let mode = :selector
    function switch!(s)
        enter_mode!(s)
        nothing
    end
    function selector_mode_parse(s)
        quote
            modes = $modes
            s = Symbol($s)
            if haskey(modes, s)
                $switch!(modes[s])
            else
                println("avaliable modes:")
                for each in keys(modes)
                    println(each)
                end
            end
        end
    end

    register() do
        modes[mode] = initrepl(
            selector_mode_parse;
            prompt_text="selector> ",
            prompt_color = :light_blue,
            start_key="\\",
            mode_name=string(mode)
        )
    end
end