let { Profession, Entry, MAX, .. } = import "profession-schema.ncl" in

let id_name | String = "momo_professions" in
let short_id_name | String = "momo_prof" in
let mk_n_item | Number -> String -> Entry -> Array Entry =
    fun n name entry => std.array.replicate n (entry & { item = name }) in
let mk_item | String -> Entry -> Entry = fun name entry => entry & { item = name } in

let transform_profession : Array Profession -> Array Profession = fun profs =>
  let mk_id_prefix = fun old_id => "%{short_id_name}_%{old_id}" in
    profs |> std.array.map (fun prof =>
        prof & {
            id | String | force = mk_id_prefix prof.id,
            items.both.entries | force = prof.items.both.entries
                @ mk_n_item 5 "water_clean" { charges = MAX }
                @ mk_n_item 1 "granola" { charges = 15
            }
        } | Profession
    )
in
{
  include transform_profession,
  include mk_n_item,
  include mk_item,
}
