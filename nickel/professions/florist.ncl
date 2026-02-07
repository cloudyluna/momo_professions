let { schema, transform_profession, mk_n_item, mk_item } = import "../prelude.ncl" in
let { Profession, MAX, .. } = schema in

let profession =
  transform_profession [
    {
      id = "florist",
      name = "Florist",
      description = "Gotta cultivate those post-apocalyptic flowers.",
      skills = [{ name = 'survival, level = 2 }],
      items = {
        both = {
          items = [
            "technician_shirt_gray",
            "gloves_work",
            "boots",
            "backpack",
            "shovel",
            "g_shovel",
            "energy_drink"
          ],
          entries =
            [
              mk_item "smart_phone" { charges = MAX },
              mk_item "fertilizer_liquid" { charges = MAX },
              mk_item "seed_sunflower" { charges = 20, container-item = "bag_plastic" },
              mk_item "seed_chamomile" { charges = 10, container-item = "bag_plastic" },
              mk_item "granola" { charges = 15 }
            ]
            @ mk_n_item 5 "water_clean" { charges = MAX }
        },
        male = ["camisole", "pants_cargo", "boy_shorts"],
        female = ["sports_bra", "pants_cargo", "panties"],
      }
    }
  ]
in profession | Array Profession
