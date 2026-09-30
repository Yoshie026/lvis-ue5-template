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
        "rect": [
            149.0,
            231.0,
            700.0,
            400.0
        ],
        "boxes": [
            {
                "box": {
                    "comment": "",
                    "id": "obj-4",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        40.0,
                        301.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-2",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        40.0,
                        10.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        40.0,
                        55.0,
                        40.0,
                        22.0
                    ],
                    "text": "abs~"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [
                        "signal"
                    ],
                    "patching_rect": [
                        40.0,
                        90.0,
                        80.0,
                        22.0
                    ],
                    "text": "slide~ 1 120"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "float"
                    ],
                    "patching_rect": [
                        40.0,
                        120.0,
                        90.0,
                        22.0
                    ],
                    "text": "snapshot~ 33"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40.0,
                        150.0,
                        160.0,
                        22.0
                    ],
                    "text": "scale 0. 0.5 0. 1. 1."
                }
            },
            {
                "box": {
                    "id": "obj-cthresh",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        72.0,
                        19.0,
                        288.0,
                        20.0
                    ],
                    "text": "only passes when value > 0.01 - no OSC while silent"
                }
            },
            {
                "box": {
                    "id": "obj-round",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40.0,
                        230.0,
                        70.0,
                        22.0
                    ],
                    "text": "round 0.01"
                }
            },
            {
                "box": {
                    "id": "obj-chg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "int",
                        "int"
                    ],
                    "patching_rect": [
                        120.0,
                        230.0,
                        60.0,
                        22.0
                    ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "obj-floatmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40.0,
                        265.0,
                        200.0,
                        22.0
                    ],
                    "text": "/audio/dt2/trk8 $1"
                }
            },
            {
                "box": {
                    "id": "obj-patcherargs",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        462.0,
                        64.0,
                        72.0,
                        22.0
                    ],
                    "text": "patcherargs"
                }
            },
            {
                "box": {
                    "id": "obj-lb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        378.0,
                        18.0,
                        70.0,
                        22.0
                    ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-sprintf-float",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        400.0,
                        220.0,
                        154.0,
                        22.0
                    ],
                    "text": "sprintf /audio/dt2/trk%ld \\$1"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-float",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        400.0,
                        250.0,
                        80.0,
                        22.0
                    ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-gate",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        40.0,
                        180.0,
                        140.0,
                        22.0
                    ],
                    "text": "if $f1 > 0.01 then $f1"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [
                        "obj-6",
                        0
                    ],
                    "source": [
                        "obj-2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-7",
                        0
                    ],
                    "source": [
                        "obj-6",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-8",
                        0
                    ],
                    "source": [
                        "obj-7",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-9",
                        0
                    ],
                    "source": [
                        "obj-8",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-floatmsg",
                        0
                    ],
                    "source": [
                        "obj-chg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-4",
                        0
                    ],
                    "source": [
                        "obj-floatmsg",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-patcherargs",
                        0
                    ],
                    "source": [
                        "obj-lb",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-sprintf-float",
                        0
                    ],
                    "source": [
                        "obj-patcherargs",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-floatmsg",
                        0
                    ],
                    "source": [
                        "obj-prepend-float",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-chg",
                        0
                    ],
                    "source": [
                        "obj-round",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-prepend-float",
                        0
                    ],
                    "source": [
                        "obj-sprintf-float",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-gate",
                        0
                    ],
                    "source": [
                        "obj-9",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-round",
                        0
                    ],
                    "source": [
                        "obj-gate",
                        0
                    ]
                }
            }
        ]
    }
}