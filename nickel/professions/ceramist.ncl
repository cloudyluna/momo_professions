let { schema, transform_profession, mk_n_item, mk_item } = import "../prelude.ncl" in
let { Profession, MAX, .. } = schema in

let profession =
  transform_profession [
    {
      id = "ceramist",
      name = "Ceramist",
      description = "The bowls and plates won't make themselves.",
      skills = [{ name = 'fabrication, level = 3 }],
      items = {
        both = {
          items = [
            "technician_shirt_gray",
            "gloves_work",
            "boots",
            "backpack",
            "energy_drink"
          ],
          entries =
            [
              mk_item "smart_phone" { charges = MAX },
              mk_item "granola" { charges = 15 }
            ]
            @ mk_n_item 5 "water_clean" { charges = MAX }
            @ mk_n_item 5 "clay_lump" {}
        },
        male = ["camisole", "pants_cargo", "boy_shorts"],
        female = ["sports_bra", "pants_cargo", "panties"],
      }
    }
  ]
in profession | Array Profession
