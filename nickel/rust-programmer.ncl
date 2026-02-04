let { ProfessionSchema, .. } = import "profession-schema.ncl" in
let profession = [
  {
    id = "rust_programmer",
    name = "Rust Programmer",
    description = "Nyan",
    points = 2,
    items = { both = { items = [], entries = [], }, male = [], female = [] }
  }
]
in
profession | Array ProfessionSchema
