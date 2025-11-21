
class! @into_collectible("collect") State(@default_to("") value), {
  init(){
    self._on_set = {}
    self.on_set = function(val)
      for _, f in ipairs(self._on_set) do
        f(val)
      end
    end
  }
  format(str){
    return self:map(function(e)
      return str:gsub("{}", e):gsub("{{}}", "{}")
    end)
  }
  
  bool(tstr, fstr){
    return self:map(function(e)
      if e then
        return tstr
      else
        return fstr
      end
    end)
  }

  inverse(){
    return self:map(function(e)
      return not e
    end)
  }

  inside(thing){
    return self:map(function(e)
      if instanceof(thing, State) then
        return thing:get()[e]
      else
        return thing[e]
      end
    end)
  }

  named(thing){
    return self:map(function(e)
      return e[thing]
    end)
  }
  
  is(thing){
    return self:map(function(e)
      return e == thing
    end)
  }

  is_not(thing){
    return self:map(function(e)
      return e ~= thing
    end)
  }
  
  map(formatter){
    local s = State(formatter(self.value))
    table.insert(self._on_set, function(val)
      s:set(formatter(val))
    end)
    return s
  }

  get(){
    return self.value
  }

  set(val){
    self.value = val
    if self.on_set then
      self.on_set(val)
    end
    return self
  }

  toggle(){
    self:set(not self.value)
    return self
  }

  toggle_from(case1, case2){
    if self.value == case2 then
      self:set(case1)
    else
      self:set(case2)
    end
    return self
  }

  toggle_as(bool, case1, case2){
    local is_true = bool
    if instanceof(bool, State) then
      is_true = bool:get()
    end
    if is_true then
      self:set(case1)
    else
      self:set(case2)
    end
    return self
  }

  key(key, val){
    self.value[key] = val
    if self.on_set then
      self.on_set(val)
    end
    return self
  }

  push(val){
    self.value:push(val)
    if self.on_set then
      self.on_set(val)
    end
    return self
  }

  add(val){
    if type(self.value) == "string" then
      self:set(self.value .. val)
    elseif type(self.value) == "number" then
      self:set(self.value + val)
    elseif instanceof(self.value, Vec) then
      self.value:push(val)
      self:set(self.value)
    elseif type(self.value) == "table" then
      table.insert(self.value, val)
      self:set(self.value)
    end
    return self
  }
  
  sub(val){
    if type(self.value) == "number" then
      self:set(self.value - val)
    end
    return self
  }

  reemit(){
    self.on_set(self.value)
    return self
  }

  is_empty(){
    return self:map(function(v)
      if instanceof(v, Vec) then
        return v:len() < 1
      elseif type(v) == "table" then
        return #v < 1
      else
        return true
      end
    end)
  }

  has_items(){
    return self:map(function(v)
      if instanceof(v, Vec) then
        return v:len() > 0
      elseif type(v) == "table" then
        return #v > 0
      else
        return false
      end
    end)
  }

  bind_to(widget, option){
    local setter = f"set_{option}"
    local getter = f"get_{option}"
    table.insert(self._on_set, function(val)
      if widget[setter] then
        widget[setter](widget, val)
      end
    end)
    return self.value
  }
}


local function get_state_value(self, option, v)
  if instanceof(v, State) then
    return v:bind_to(self, option)
  end
  return v
end

return collect! {
  get_state_value,
  State
}