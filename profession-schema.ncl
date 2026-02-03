{

  ProfessionSchema = {
    type | String | default = "profession",
    id | String,
    name | std.contract.any_of [ String, { male : String, female : String }],
    description | String,
    points | Number,
    addictions | Array { type : String, intensity : Number } | optional,
    skills | Array { level : Number, name : String, } | optional,
    traits | Array String | optional,
    cbms | Array String | optional,
    starting_cash | Number | optional,
    npcs | Array String | optional,
    # TODO: Type these.
    allowed_traits | Array String | optional,
    forbidden_traits | Array String | optional,
    allowed_bionics | Array String | optional,
    forbidden_bionics | Array String | optional,
    forbids_bionics | Bool | optional,
    pets | Array String | optional,

    items
      | {
        both
          : {
            items : Array String,
            entries
              : Array {
                item | String | optional,
                ammo-item | String | optional,
                charges | Number | optional,
                container-item | String | optional,
                group | String | optional,
                contents-group | String | optional,
                custom-flags | Array String | optional,
              }
          },
        male : Array String,
        female : Array String
      },
  },
}
