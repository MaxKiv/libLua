-- object to return
local M = {}

-- setup function registers all the lib functions and returns M
local function setup()

  -- tostring a table
  function M.to_string(tab)
    assert(type(tab) == "table", "ERROR in to_string, input must be table but is: " .. type(tab))
    local str = ""
    for key, value in pairs(tab) do
      str = str .. "[" .. tostring(key) .. "] = " .. tostring(value) .. "\n"
    end
    return str
  end

  -- Create directory
  function M.createDir(name)
    assert(type(name) == "string", "ERROR in createDir, name must be of type string")
    os.execute("mkdir " .. name)
  end

  -- Subset a table
  function M.table_subset(tab, start, last)
    return { table.unpack(tab, start, last) }
  end

  -- Map a function on a table
  function M.map(func, tab)
    assert(type(func) == "function", "BAD")
    assert(type(tab) == "table", "BAD")
    assert(func(tab)), "BAD")
    for key, value in pairs(tab) do
      tab[key] = func(value)
    end
    return tab
  end

  return M

end
