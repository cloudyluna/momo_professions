{
  ProfessionSchema = {
    id | String,
    name | String,
    description | String,
    points | Number,
    skills | Array { level : Number, name : String, },
    traits | Array String,
    items
      | {
        both
          : {
            items : Array String,
            entries
              : Array {
                item : String | optional,
                ammo-item : String | optional,
                charges : Number | optional,
                container-item : String | optional,
                group : String | optional,
                contents-group : String | optional,
                custom-flags : Array String | optional,
              }
          },
        male : Array String,
        female : Array String
      }
  },
}
