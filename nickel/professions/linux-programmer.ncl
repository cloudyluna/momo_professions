let { schema, transform_profession, mk_n_item, mk_item } = import "../prelude.ncl" in
let { Profession, MAX, .. } = schema in

let profession =
  transform_profession [
    {
      id = "linux_programmer",
      name = "Linux Programmer",
      description = "Too deep in the system to stop distro hopping and building GNOME applications.",
      addictions = [{ type = 'caffeine, intensity = 2 }],
      skills = [{ name = 'computer, level = 3 }, { name = 'electronics, level = 1 }],
      items = {
        both = {
          items = [
            "linuxtshirt",
            "arm_warmers",
            "sneakers",
            "backpack",
            "spoon",
            "ceramic_mug"
          ],
          entries =
            [
              mk_item "rainbow_flag" { custom-flags = ["no_auto_equip"] },
              mk_item "trans_flag" { custom-flags = ["no_auto_equip"] },
              mk_item "smart_phone" { charges = MAX },
              mk_item "eink_tablet_pc" { charges = MAX },
              mk_item "laptop" { charges = MAX },
            ]
            @ mk_n_item 2 "coffee_raw" { charges = MAX, container-item = "jar_glass_sealed" }
            @ mk_n_item 5 "energy_drink" {}
            @ mk_n_item 3 "light_battery_cell" { charges = MAX }
            @ mk_n_item 2 "mobile_memory_card_used" {}
        },
        male = ["camisole", "shorts_denim", "boy_shorts"],
        female = ["sports_bra", "skirt", "panties"],
      }
    }
  ]
in profession | Array Profession
