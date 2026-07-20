$dialog show @s {\
  "type": "minecraft:multi_action",\
  "title": "New Remote",\
  "inputs": [\
    {\
      "type": "minecraft:text",\
      "key": "left_click",\
      "label": "Left Click",\
      "width": 300,\
      "initial": "$(left_click)",\
      "max_length": 999999999,\
      "multiline": {\
        "max_lines": 256,\
        "height": 60\
      }\
    },\
    {\
      "type": "minecraft:text",\
      "key": "right_click",\
      "label": "Right Click",\
      "width": 300,\
      "initial": "$(right_click)",\
      "max_length": 999999999,\
      "multiline": {\
        "max_lines": 256,\
        "height": 60\
      }\
    },\
    {\
      "type": "minecraft:single_option",\
      "key": "right_click_mode",\
      "label": "Right Click Mode",\
      "options": [\
        {\
          "id": "impulse",\
          "display": "Impulse",\
          "initial": $(right_click_mode_impulse_init)\
        },\
        {\
          "id": "constant",\
          "display": "Constant",\
          "initial": $(right_click_mode_constant_init)\
        }\
      ]\
    }\
  ],\
  "after_action": "close",\
  "actions": [\
    {\
      "label": "Edit Remote",\
      "action": {\
        "type": "dynamic/run_command",\
        "template": "function remote_control:edit_remote/build_modifier {left_click:\"\u0024(left_click)\",right_click:\"\u0024(right_click)\",right_click_mode:\"\u0024(right_click_mode)\"}"\
      }\
    }\
  ]\
}