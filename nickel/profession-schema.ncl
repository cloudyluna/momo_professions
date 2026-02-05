let SCHEMA_VERSION : Array Number = [0, 9, 1] in
let MAX : Number = 99999 in
{
  include MAX,
  include SCHEMA_VERSION,
  Profession = {
    type
      | String
      | std.contract.from_predicate ((==) "profession")
      | doc "Hardcoded to 'profession'. Leave this alone!"
      = "profession",
    id | String | doc "Unique ID for the profession" | default,
    name | std.contract.any_of [ String, { male : String, female : String }],
    description | String,
    points | Number | default = 0,
    addictions | Array { type : Addictions, intensity : Number } | optional,
    skills | Array Skill | optional,
    traits | Array String | optional,
    cbms | Array String | optional,
    starting_cash | Number | optional,
    npcs | Array String | optional,
    allowed_traits | Array String | optional,
    forbidden_traits | Array String | optional,
    allowed_bionics | Array String | optional,
    forbidden_bionics | Array String | optional,
    forbids_bionics | Bool | optional,
    pets | Array { name : String, amount : Number } | optional,
    items | Items
  },
  Items = {
    both
      | {
        items : Array String,
        entries
          : Array {
            item | String | optional,
            group | String | optional,
            ammo-item | String | optional,
            charges | Number | optional,
            container-item | String | optional,
            group | String | optional,
            contents-group | String | optional,
            custom-flags | Array String | optional,
            variant | String | optional,
          }
      },
    male | Array String | default = [],
    female | Array String | default = []
  },
  Addictions = [|
    'alcohol,
    'amphetamine,
    'caffeine,
    'cocaine,
    'crack,
    'nicotine,
    'opiate,
    '"sleeping pill",
  |],
  Skill = { name | SkillType, level | Number },
  SkillType = [|
    'speech,
    'computer,
    'firstAid,
    'mechanics,
    'traps,
    'driving,
    'swimming,
    'fabrication,
    'cooking,
    'tailor,
    'survival,
    'electronics,
    'archery,
    'gun,
    'launcher,
    'pistol,
    'rifle,
    'smg,
    'throw,
    'melee,
    'bashing,
    'cutting,
    'dodge,
    'stabbing,
    'unarmed,
    'chemistry,
  |],
}
