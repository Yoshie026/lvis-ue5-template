{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 5,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 285.0, 144.0, 1237.0, 850.0 ],
        "tallnewobj": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-22",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1266.0, 24.0, 150.0, 33.0 ],
                    "text": "double click this to select your midi device"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 151.0, 457.0, 150.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 121.0, -74.0, 100.0, 20.0 ],
                    "text": "camera"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 136.0, 442.0, 150.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 6.0, -74.0, 100.0, 20.0 ],
                    "text": "scene"
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "items": [ 0, ",", 1, ",", 2, ",", 3, ",", 4, ",", 5 ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1464.0, 74.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 121.0, -52.0, 100.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "items": [ 0, ",", 1, ",", 2, ",", 3, ",", 4, ",", 5 ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1106.0, 82.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 6.0, -52.0, 100.0, 22.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-55",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 461.0, 281.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-50",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 382.0, 276.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-51",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 270.0, 294.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-49",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 179.0, 298.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-48",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 82.0, 298.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 982.5, 675.0, 79.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr ext/amp",
                    "varname": "ext/amp"
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 7,
                    "outlettype": [ "", "", "", "", "", "", "" ],
                    "patching_rect": [ 858.0, 640.0, 520.0, 39.0 ],
                    "text": "route /audio/ext/freq /audio/ext/amp /audio/ext/onset /audio/ext/note /audio/ext/pc /audio/ext/noisiness"
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 679.0, 708.0, 70.0, 20.0 ],
                    "text": "loudness"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 858.0, 675.0, 76.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr ext/freq",
                    "varname": "ext/freq"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 893.0, 956.0, 65.0, 26.0 ],
                    "restore": [ 0.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr midi4",
                    "varname": "midi4"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 893.0, 916.0, 65.0, 26.0 ],
                    "restore": [ 0.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr midi3",
                    "varname": "midi3"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 893.0, 877.0, 65.0, 26.0 ],
                    "restore": [ 0.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr midi2",
                    "varname": "midi2"
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 903.0, 826.0, 65.0, 26.0 ],
                    "restore": [ 0.6377952755905512 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr midi1",
                    "varname": "midi1"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 914.0, 760.0, 177.0, 26.0 ],
                    "text": "route /midi1 /midi2 /midi3 /midi4"
                }
            },
            {
                "box": {
                    "id": "obj-75",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 991.0, 133.0, 60.0, 26.0 ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1017.0, 174.0, 104.0, 22.0 ],
                    "text": "/audio/ext/amp $1"
                }
            },
            {
                "box": {
                    "id": "obj-73",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "float", "float", "" ],
                    "patching_rect": [ 892.0, 54.0, 42.0, 26.0 ],
                    "text": "fzero~"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 685.0, 229.0, 68.0, 26.0 ],
                    "text": "trk_float~ 8"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 598.0, 226.0, 68.0, 26.0 ],
                    "text": "trk_float~ 7"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 424.0, 226.0, 72.0, 26.0 ],
                    "text": "trk_bang~ 5"
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 340.0, 230.0, 72.0, 26.0 ],
                    "text": "trk_bang~ 4"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 240.0, 230.0, 72.0, 26.0 ],
                    "text": "trk_bang~ 3"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 146.0, 230.0, 72.0, 26.0 ],
                    "text": "trk_bang~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-poly-bng",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 40.0, 230.0, 72.0, 26.0 ],
                    "text": "trk_bang~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1265.0, 143.0, 39.0, 26.0 ],
                    "text": "/ 127."
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 431.0, 595.0, 143.0, 26.0 ],
                    "text": "loadmess clientwindow"
                }
            },
            {
                "box": {
                    "id": "obj-route-mix",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 653.0, 435.0, 309.0, 26.0 ],
                    "text": "route /audio/bass /audio/mid /audio/high /audio/loudness"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-bass",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 653.0, 470.0, 60.0, 20.0 ],
                    "text": "bass"
                }
            },
            {
                "box": {
                    "id": "obj-pattr-bass",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 653.0, 490.0, 100.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr bass",
                    "varname": "bass"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-mid",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 653.0, 520.0, 60.0, 20.0 ],
                    "text": "mid"
                }
            },
            {
                "box": {
                    "id": "obj-pattr-mid",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 653.0, 540.0, 100.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr mid",
                    "varname": "mid"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-high",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 653.0, 570.0, 60.0, 20.0 ],
                    "text": "high"
                }
            },
            {
                "box": {
                    "id": "obj-pattr-high",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 653.0, 590.0, 100.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr high",
                    "varname": "high"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-loud",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 653.0, 620.0, 70.0, 20.0 ],
                    "text": "loudness"
                }
            },
            {
                "box": {
                    "id": "obj-pattr-loud",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 653.0, 640.0, 100.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr loudness",
                    "varname": "loudness"
                }
            },
            {
                "box": {
                    "id": "obj-route-trk",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 9,
                    "numoutlets": 9,
                    "outlettype": [ "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 1194.0, 415.0, 421.0, 39.0 ],
                    "text": "route /audio/dt2/trk1/hit /audio/dt2/trk2/hit /audio/dt2/trk3/hit /audio/dt2/trk4/hit /audio/dt2/trk5/hit /audio/dt2/trk6 /audio/dt2/trk7 /audio/dt2/trk8"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-t1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1093.0, 470.0, 70.0, 20.0 ],
                    "text": "trk1 hit"
                }
            },
            {
                "box": {
                    "id": "obj-pattr-t1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1194.0, 495.0, 110.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr trk1hit",
                    "varname": "trk1hit"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-t2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1194.0, 525.0, 70.0, 20.0 ],
                    "text": "trk2 hit"
                }
            },
            {
                "box": {
                    "id": "obj-pattr-t2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1194.0, 545.0, 110.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr trk2hit",
                    "varname": "trk2hit"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-t3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1194.0, 575.0, 70.0, 20.0 ],
                    "text": "trk3 hit"
                }
            },
            {
                "box": {
                    "id": "obj-pattr-t3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1194.0, 595.0, 110.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr trk3hit",
                    "varname": "trk3hit"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-t4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1194.0, 625.0, 70.0, 20.0 ],
                    "text": "trk4 hit"
                }
            },
            {
                "box": {
                    "id": "obj-pattr-t4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1194.0, 645.0, 110.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr trk4hit",
                    "varname": "trk4hit"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-t5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1194.0, 675.0, 70.0, 20.0 ],
                    "text": "trk5"
                }
            },
            {
                "box": {
                    "id": "obj-pattr-t5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1194.0, 695.0, 110.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr trk5",
                    "varname": "trk5"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-t6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1313.0, 470.0, 60.0, 20.0 ],
                    "text": "trk6"
                }
            },
            {
                "box": {
                    "id": "obj-pattr-t6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1414.0, 495.0, 100.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr trk6",
                    "varname": "trk6"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-t7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1414.0, 525.0, 60.0, 20.0 ],
                    "text": "trk7"
                }
            },
            {
                "box": {
                    "id": "obj-pattr-t7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1414.0, 545.0, 100.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr trk7",
                    "varname": "trk7"
                }
            },
            {
                "box": {
                    "id": "obj-lbl-t8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1414.0, 575.0, 60.0, 20.0 ],
                    "text": "trk8"
                }
            },
            {
                "box": {
                    "id": "obj-pattr-t8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1414.0, 595.0, 100.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr trk8",
                    "varname": "trk8"
                }
            },
            {
                "box": {
                    "id": "obj-pattrstorage",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 431.0, 629.0, 312.0, 26.0 ],
                    "saved_object_attributes": {
                        "client_rect": [ 1290, 753, 1696, 1070 ],
                        "parameter_enable": 0,
                        "parameter_mappable": 0,
                        "storage_rect": [ 64, 235, 699, 679 ]
                    },
                    "text": "pattrstorage LVis_Monitor @savemode 0 @autorestore 0",
                    "varname": "LVis_Monitor"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 40.0, 67.0, 65.0, 26.0 ],
                    "text": "adc~ 3 4"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 107.0, 40.0, 26.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-c1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 52.0, 60.0, 20.0 ],
                    "text": "trk1"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 140.0, 67.0, 65.0, 26.0 ],
                    "text": "adc~ 5 6"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 140.0, 107.0, 40.0, 26.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-c2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 140.0, 52.0, 60.0, 20.0 ],
                    "text": "trk2"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 240.0, 67.0, 65.0, 26.0 ],
                    "text": "adc~ 7 8"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 240.0, 107.0, 40.0, 26.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-c3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 240.0, 52.0, 60.0, 20.0 ],
                    "text": "trk3"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 340.0, 67.0, 68.0, 26.0 ],
                    "text": "adc~ 9 10"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 340.0, 107.0, 40.0, 26.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-c4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 340.0, 52.0, 60.0, 20.0 ],
                    "text": "trk4"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 440.0, 67.0, 72.0, 26.0 ],
                    "text": "adc~ 11 12"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 440.0, 107.0, 40.0, 26.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-c5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 440.0, 52.0, 60.0, 20.0 ],
                    "text": "trk5"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 527.0, 67.0, 72.0, 26.0 ],
                    "text": "adc~ 13 14"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 527.0, 107.0, 40.0, 26.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-c6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 527.0, 52.0, 60.0, 20.0 ],
                    "text": "trk6"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 619.0, 69.0, 72.0, 26.0 ],
                    "text": "adc~ 15 16"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 619.0, 109.0, 40.0, 26.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-c7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 619.0, 54.0, 60.0, 20.0 ],
                    "text": "trk7"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 717.0, 74.0, 72.0, 26.0 ],
                    "text": "adc~ 17 18"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 717.0, 113.0, 40.0, 26.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-c8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 760.0, 52.0, 60.0, 20.0 ],
                    "text": "trk8"
                }
            },
            {
                "box": {
                    "id": "obj-cbng",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 142.0, 200.0, 20.0 ],
                    "text": "BANG group (tracks 1-4)"
                }
            },
            {
                "box": {
                    "id": "obj-poly-flt",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 513.0, 226.0, 68.0, 26.0 ],
                    "text": "trk_float~ 6"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 1464.0, 128.0, 48.0, 26.0 ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1464.0, 161.0, 91.0, 22.0 ],
                    "text": "/camera/pos $1"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 5,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 932.0, 515.0, 1050.0, 780.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-9",
                                    "index": 4,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 542.0, 485.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-8",
                                    "index": 3,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 388.0, 489.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-7",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 221.0, 489.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-dac",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 21.0, 115.0, 60.0, 22.0 ],
                                    "text": "adc~ 1 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 21.0, 175.0, 40.0, 22.0 ],
                                    "text": "+~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 21.0, 220.0, 120.0, 20.0 ],
                                    "text": "BASS  20-250 Hz"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-bass-lp",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 21.0, 245.0, 130.0, 22.0 ],
                                    "text": "onepole~ 250"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-bass-abs",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 21.0, 275.0, 40.0, 22.0 ],
                                    "text": "abs~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-bass-avg",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 21.0, 305.0, 80.0, 22.0 ],
                                    "text": "slide~ 1 100"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-bass-snap",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 21.0, 335.0, 90.0, 22.0 ],
                                    "text": "snapshot~ 33"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-bass-scale",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 21.0, 365.0, 160.0, 22.0 ],
                                    "text": "scale 0. 0.5 0. 1. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-bass-msg",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 21.0, 395.0, 120.0, 22.0 ],
                                    "text": "/audio/bass $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 211.0, 220.0, 120.0, 20.0 ],
                                    "text": "MID  250-4k Hz"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-mid-bp",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 211.0, 245.0, 150.0, 22.0 ],
                                    "text": "reson~ 1. 1200 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-mid-abs",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 211.0, 275.0, 40.0, 22.0 ],
                                    "text": "abs~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-mid-avg",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 211.0, 305.0, 80.0, 22.0 ],
                                    "text": "slide~ 1 100"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-mid-snap",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 211.0, 335.0, 90.0, 22.0 ],
                                    "text": "snapshot~ 33"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-mid-scale",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 211.0, 365.0, 160.0, 22.0 ],
                                    "text": "scale 0. 0.5 0. 1. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-mid-msg",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 231.0, 395.0, 120.0, 22.0 ],
                                    "text": "/audio/mid $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 401.0, 220.0, 120.0, 20.0 ],
                                    "text": "HIGH  4k+ Hz"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-high-hp",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 401.0, 245.0, 185.0, 22.0 ],
                                    "text": "onepole~ 4000 @mode highpass"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-high-abs",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 401.0, 275.0, 40.0, 22.0 ],
                                    "text": "abs~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-high-avg",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 401.0, 305.0, 80.0, 22.0 ],
                                    "text": "slide~ 1 100"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-high-snap",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 401.0, 335.0, 90.0, 22.0 ],
                                    "text": "snapshot~ 33"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-high-scale",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 401.0, 365.0, 160.0, 22.0 ],
                                    "text": "scale 0. 0.3 0. 1. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-high-msg",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 401.0, 395.0, 120.0, 22.0 ],
                                    "text": "/audio/high $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 591.0, 220.0, 140.0, 20.0 ],
                                    "text": "LOUDNESS  (full mix)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loud-abs",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 591.0, 245.0, 40.0, 22.0 ],
                                    "text": "abs~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loud-avg",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 591.0, 275.0, 80.0, 22.0 ],
                                    "text": "slide~ 1 150"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loud-snap",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 591.0, 305.0, 90.0, 22.0 ],
                                    "text": "snapshot~ 33"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loud-scale",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 591.0, 335.0, 160.0, 22.0 ],
                                    "text": "scale 0. 0.5 0. 1. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-loud-msg",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 591.0, 365.0, 140.0, 22.0 ],
                                    "text": "/audio/loudness $1"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-1",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 21.0, 489.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-bass-lp", 0 ],
                                    "order": 3,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-high-hp", 0 ],
                                    "order": 1,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-loud-abs", 0 ],
                                    "order": 0,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-mid-bp", 0 ],
                                    "order": 2,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-bass-avg", 0 ],
                                    "source": [ "obj-bass-abs", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-bass-snap", 0 ],
                                    "source": [ "obj-bass-avg", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-bass-abs", 0 ],
                                    "source": [ "obj-bass-lp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-bass-msg", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-bass-msg", 0 ],
                                    "source": [ "obj-bass-scale", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-bass-scale", 0 ],
                                    "source": [ "obj-bass-snap", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 1 ],
                                    "source": [ "obj-dac", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-dac", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-high-avg", 0 ],
                                    "source": [ "obj-high-abs", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-high-snap", 0 ],
                                    "source": [ "obj-high-avg", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-high-abs", 0 ],
                                    "source": [ "obj-high-hp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "source": [ "obj-high-msg", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-high-msg", 0 ],
                                    "source": [ "obj-high-scale", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-high-scale", 0 ],
                                    "source": [ "obj-high-snap", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-loud-avg", 0 ],
                                    "source": [ "obj-loud-abs", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-loud-snap", 0 ],
                                    "source": [ "obj-loud-avg", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-loud-msg", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-loud-msg", 0 ],
                                    "source": [ "obj-loud-scale", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-loud-scale", 0 ],
                                    "source": [ "obj-loud-snap", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-mid-avg", 0 ],
                                    "source": [ "obj-mid-abs", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-mid-snap", 0 ],
                                    "source": [ "obj-mid-avg", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-mid-abs", 0 ],
                                    "source": [ "obj-mid-bp", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-mid-msg", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-mid-msg", 0 ],
                                    "source": [ "obj-mid-scale", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-mid-scale", 0 ],
                                    "source": [ "obj-mid-snap", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 306.0, 386.0, 108.0, 26.0 ],
                    "text": "p MainMixAnalysis"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 1146.5, 133.0, 48.0, 26.0 ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1148.0, 166.0, 61.0, 22.0 ],
                    "text": "/scene $1"
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1177.0, 242.0, 103.0, 26.0 ],
                    "text": "join @triggers 2 1"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1316.0, 173.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1177.0, 202.0, 158.0, 26.0 ],
                    "text": "combine /midi 0 @triggers 1"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 1265.0, 59.0, 40.0, 26.0 ],
                    "text": "ctlin"
                }
            },
            {
                "box": {
                    "id": "obj-extadc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 892.0, 19.0, 52.0, 26.0 ],
                    "text": "adc~ 43"
                }
            },
            {
                "box": {
                    "id": "obj-extchg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 892.0, 133.0, 60.0, 26.0 ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "obj-extmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 886.5, 185.0, 101.0, 22.0 ],
                    "text": "/audio/ext/freq $1"
                }
            },
            {
                "box": {
                    "id": "obj-mainlbl",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 22.0, -8.0, 150.0, 20.0 ],
                    "text": "main src"
                }
            },
            {
                "box": {
                    "id": "obj-udp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 435.0, 220.0, 26.0 ],
                    "text": "udpsend 127.0.0.1 8000"
                }
            },
            {
                "box": {
                    "id": "obj-cc-split",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 1265.0, 100.0, 70.0, 26.0 ],
                    "text": "split 1 8"
                }
            },
            {
                "box": {
                    "id": "obj-cc-if",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1316.0, 121.0, 210.0, 26.0 ],
                    "text": "if $i1 >= 1 && $i1 <= 8 then 1 else 0"
                }
            },
            {
                "box": {
                    "id": "obj-cc-gate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1265.0, 175.0, 50.0, 26.0 ],
                    "text": "gate 1"
                }
            },
            {
                "box": {
                    "id": "ext-on-t",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 860.0, 1044.0, 30.0, 26.0 ],
                    "text": "t b"
                }
            },
            {
                "box": {
                    "id": "ext-on-c",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "int", "", "", "int" ],
                    "patching_rect": [ 860.0, 1072.0, 60.0, 26.0 ],
                    "text": "counter"
                }
            },
            {
                "box": {
                    "id": "ext-on-m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 860.0, 1100.0, 140.0, 22.0 ],
                    "text": "/audio/ext/onset $1"
                }
            },
            {
                "box": {
                    "id": "ext-gate",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1160.0, 1044.0, 140.0, 26.0 ],
                    "text": "if $f1 > 20. then $f1"
                }
            },
            {
                "box": {
                    "id": "ext-ftom",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1160.0, 1072.0, 40.0, 26.0 ],
                    "text": "ftom"
                }
            },
            {
                "box": {
                    "id": "ext-round",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1160.0, 1100.0, 60.0, 26.0 ],
                    "text": "round 1."
                }
            },
            {
                "box": {
                    "id": "ext-nchg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 1160.0, 1128.0, 55.0, 26.0 ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "ext-nmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1160.0, 1156.0, 130.0, 22.0 ],
                    "text": "/audio/ext/note $1"
                }
            },
            {
                "box": {
                    "id": "ext-pc",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1310.0, 1156.0, 45.0, 26.0 ],
                    "text": "% 12"
                }
            },
            {
                "box": {
                    "id": "ext-pcchg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 1310.0, 1184.0, 55.0, 26.0 ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "ext-pcmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1310.0, 1212.0, 120.0, 22.0 ],
                    "text": "/audio/ext/pc $1"
                }
            },
            {
                "box": {
                    "id": "c-noise",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 860.0, 1140.0, 520.0, 20.0 ],
                    "text": "noisiness: zero-crossings per vector. 64 = default signal vector size"
                }
            },
            {
                "box": {
                    "id": "ext-zx",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 860.0, 1164.0, 55.0, 26.0 ],
                    "text": "zerox~"
                }
            },
            {
                "box": {
                    "id": "ext-zsnap",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 860.0, 1192.0, 90.0, 26.0 ],
                    "text": "snapshot~ 50"
                }
            },
            {
                "box": {
                    "id": "ext-zscale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 860.0, 1220.0, 140.0, 26.0 ],
                    "text": "scale 0. 64. 0. 1. 1."
                }
            },
            {
                "box": {
                    "id": "ext-zchg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 860.0, 1248.0, 55.0, 26.0 ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "ext-zmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 860.0, 1276.0, 160.0, 22.0 ],
                    "text": "/audio/ext/noisiness $1"
                }
            },
            {
                "box": {
                    "id": "ext-pattr-0",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1480.0, 1044.0, 150.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr ext/onset",
                    "varname": "ext/onset"
                }
            },
            {
                "box": {
                    "id": "ext-pattr-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1480.0, 1078.0, 150.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr ext/note",
                    "varname": "ext/note"
                }
            },
            {
                "box": {
                    "id": "ext-pattr-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1480.0, 1112.0, 150.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr ext/pc",
                    "varname": "ext/pc"
                }
            },
            {
                "box": {
                    "id": "ext-pattr-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1480.0, 1146.0, 150.0, 26.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr ext/noisiness",
                    "varname": "ext/noisiness"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "ext-round", 0 ],
                    "source": [ "ext-ftom", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-ftom", 0 ],
                    "source": [ "ext-gate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-nmsg", 0 ],
                    "order": 1,
                    "source": [ "ext-nchg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-pc", 0 ],
                    "order": 0,
                    "source": [ "ext-nchg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "order": 0,
                    "source": [ "ext-nmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "ext-nmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-on-m", 0 ],
                    "source": [ "ext-on-c", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "order": 0,
                    "source": [ "ext-on-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "ext-on-m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-on-c", 0 ],
                    "source": [ "ext-on-t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-pcchg", 0 ],
                    "source": [ "ext-pc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-pcmsg", 0 ],
                    "source": [ "ext-pcchg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "order": 0,
                    "source": [ "ext-pcmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "ext-pcmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-nchg", 0 ],
                    "source": [ "ext-round", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-zmsg", 0 ],
                    "source": [ "ext-zchg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "order": 0,
                    "source": [ "ext-zmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "ext-zmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-zchg", 0 ],
                    "source": [ "ext-zscale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-zscale", 0 ],
                    "source": [ "ext-zsnap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-zsnap", 0 ],
                    "source": [ "ext-zx", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 1 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 1 ],
                    "source": [ "obj-11", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-poly-flt", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 1 ],
                    "source": [ "obj-13", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 1 ],
                    "source": [ "obj-15", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cc-if", 0 ],
                    "order": 0,
                    "source": [ "obj-19", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cc-split", 0 ],
                    "order": 1,
                    "source": [ "obj-19", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-poly-bng", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-mix", 0 ],
                    "order": 0,
                    "source": [ "obj-20", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-mix", 0 ],
                    "order": 0,
                    "source": [ "obj-20", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-mix", 0 ],
                    "order": 0,
                    "source": [ "obj-20", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-mix", 0 ],
                    "order": 0,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-20", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-20", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-20", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "source": [ "obj-21", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cc-gate", 1 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-26", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-trk", 0 ],
                    "order": 0,
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "obj-27", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-trk", 0 ],
                    "order": 0,
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "source": [ "obj-28", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-trk", 0 ],
                    "order": 0,
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 1 ],
                    "source": [ "obj-3", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pattrstorage", 0 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "source": [ "obj-33", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-trk", 0 ],
                    "order": 0,
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-trk", 0 ],
                    "order": 0,
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-trk", 0 ],
                    "order": 0,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "source": [ "obj-42", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "source": [ "obj-42", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "source": [ "obj-42", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 1 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "order": 0,
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 1 ],
                    "source": [ "obj-5", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-pattr-0", 0 ],
                    "source": [ "obj-67", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-pattr-1", 0 ],
                    "source": [ "obj-67", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-pattr-2", 0 ],
                    "source": [ "obj-67", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-pattr-3", 0 ],
                    "source": [ "obj-67", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "source": [ "obj-67", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 1 ],
                    "source": [ "obj-7", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-on-t", 0 ],
                    "source": [ "obj-73", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-75", 0 ],
                    "source": [ "obj-73", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-extchg", 0 ],
                    "source": [ "obj-73", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "order": 0,
                    "source": [ "obj-74", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-74", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "source": [ "obj-75", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 1 ],
                    "source": [ "obj-9", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 1 ],
                    "source": [ "obj-cc-gate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-cc-gate", 0 ],
                    "source": [ "obj-cc-if", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "source": [ "obj-cc-split", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-zx", 0 ],
                    "order": 1,
                    "source": [ "obj-extadc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "order": 0,
                    "source": [ "obj-extadc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ext-gate", 0 ],
                    "order": 0,
                    "source": [ "obj-extchg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-extmsg", 0 ],
                    "order": 1,
                    "source": [ "obj-extchg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "order": 0,
                    "source": [ "obj-extmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-extmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "obj-poly-bng", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-trk", 0 ],
                    "order": 0,
                    "source": [ "obj-poly-bng", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-poly-bng", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-trk", 0 ],
                    "order": 0,
                    "source": [ "obj-poly-flt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-udp", 0 ],
                    "order": 1,
                    "source": [ "obj-poly-flt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pattr-bass", 0 ],
                    "source": [ "obj-route-mix", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pattr-high", 0 ],
                    "source": [ "obj-route-mix", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pattr-loud", 0 ],
                    "source": [ "obj-route-mix", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pattr-mid", 0 ],
                    "source": [ "obj-route-mix", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pattr-t1", 0 ],
                    "source": [ "obj-route-trk", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pattr-t2", 0 ],
                    "source": [ "obj-route-trk", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pattr-t3", 0 ],
                    "source": [ "obj-route-trk", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pattr-t4", 0 ],
                    "source": [ "obj-route-trk", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pattr-t5", 0 ],
                    "source": [ "obj-route-trk", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pattr-t6", 0 ],
                    "source": [ "obj-route-trk", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pattr-t7", 0 ],
                    "source": [ "obj-route-trk", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pattr-t8", 0 ],
                    "source": [ "obj-route-trk", 7 ]
                }
            }
        ],
        "autosave": 0
    }
}