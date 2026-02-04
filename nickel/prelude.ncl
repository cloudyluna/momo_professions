let schema = import "profession-schema.ncl" in
let { transform_profession } = import "utilities.ncl" in

{
  include schema,
  include transform_profession
}
