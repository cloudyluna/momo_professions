let { schema, transform_profession } = import "../prelude.ncl" in
let { Profession, .. } = schema in

let profession = [
  {
    id = "rust_programmer",
    name = "Rust Programmer",
    description = "Nyan",
    points = 2,
    skills = [{ name = 'computer, level = 2 }],
    items = {
      both = {
        items = [],
        entries = [],
      }
    }
  }
]
in
transform_profession profession | Array Profession
