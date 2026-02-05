let { schema, transform_profession } = import "../prelude.ncl" in
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
              { item = "rainbow_flag", custom-flags = ["no_auto_equip"] },
              { item = "trans_flag", custom-flags = ["no_auto_equip"] },
              { item = "smart_phone", charges = MAX },
              { item = "eink_tablet_pc", charges = MAX },
              { item = "laptop", charges = MAX },
              { item = "granola", charges = MAX, container-item = "jar_glass_sealed" }
            ]
            @ std.array.replicate 2 { item = "coffee_raw", charges = MAX, container-item = "jar_glass_sealed" }
            @ std.array.replicate 5 { item = "energy_drink" }
            @ std.array.replicate 3 { item = "light_battery_cell", charges = MAX },
        },
        male = ["camisole", "shorts_denim", "boy_shorts"],
        female = ["sports_bra", "skirt", "panties"],
      }
    }
  ]
in profession | Array Profession
