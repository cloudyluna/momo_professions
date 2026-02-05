let schema = import "profession-schema.ncl" in
let { transform_profession, mk_n_item, mk_item } = import "utilities.ncl" in

{
  include schema,
  include transform_profession,
  include mk_n_item,
  include mk_item,
}
