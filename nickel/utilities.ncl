let { Profession, .. } = import "profession-schema.ncl" in
let project_name : String = "le_professions" in
let short_project_name : String = "le_prof" in

let transform_profession : Array Profession -> Array Profession = fun profs =>
  let prefix_id = fun old_id => "%{short_project_name}_%{old_id}" in

  profs
  |> std.array.map (fun prof =>
    { id | String | force = prefix_id prof.id } & prof | Profession
  )
in
{
  include transform_profession
}
