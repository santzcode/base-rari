function Notify(data)
  lib.notify({
    title = data.title,
    description = data.description,
    type = data.type
  })
end