json.array!(@coordinators) do | coordinator |
  json.partial! "show", coordinator: coordinator
end