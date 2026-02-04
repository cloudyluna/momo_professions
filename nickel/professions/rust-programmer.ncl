let { schema, transform_profession } = import "../prelude.ncl" in
let { Profession, .. } = schema in

let profession =
  transform_profession [
    {
      id = "rust_programmer",
      name = "Rust Programmer",
      description = "Nyan",
      addictions = [{ type = 'caffeine, intensity = 2 }],
      skills = [{ name = 'computer, level = 3 }, { name = 'electronics, level = 2 }],
      items = {
        both = {
          items = [],
          entries = [],
        }
      }
    }
  ]
in profession | Array Profession
