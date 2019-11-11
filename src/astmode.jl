let mode = :ast
    function ast_mode_parse(s)
        quote dump(Meta.parse($s)) end
    end

    register() do
        modes[mode] = initrepl(
            ast_mode_parse;
            prompt_text="ast> ",
            prompt_color = :light_blue,
            start_key="",
            mode_name=string(mode)
        )
    end
end