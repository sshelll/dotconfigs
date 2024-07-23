local common = {}

function common.inputOrDefault(default, prompt)
    local input = vim.fn.input(prompt)
    if input == '' then
        return default
    end
    return input
end

function common.readInput(prompt)
    local cancelreturn = 'NEOVIM_COMMON_READ_INPUT_CANCEL'
    local canceled = false
    local input = vim.fn.input({
        prompt = prompt,
        cancelreturn = cancelreturn,
    })
    if input == cancelreturn then
        canceled = true
        input = nil
    end
    return { canceled = canceled, input = input }
end

function common.split(str, sep)
    local fields = {}
    local pattern = string.format("([^%s]+)", sep)
    str:gsub(pattern, function(c) fields[#fields + 1] = c end)
    return fields
end

return common
