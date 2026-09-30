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
        "rect": [ 1282.0, 313.0, 700.0, 555.0 ],
        "boxes": [
            {
                "box": {
                    "comment": "",
                    "id": "obj-10",
                    "index": 2,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 177.0, 370.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 298.0, 31.0, 74.0, 22.0 ],
                    "text": "patcherargs"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 298.0, 4.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-3",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 370.0, 30.0, 30.0 ]
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
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 12.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 55.0, 40.0, 22.0 ],
                    "text": "abs~"
                }
            },
            {
                "box": {
                    "id": "obj-slide",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 40.0, 90.0, 80.0, 22.0 ],
                    "text": "slide~ 1 100"
                }
            },
            {
                "box": {
                    "id": "obj-hitsnap",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 40.0, 120.0, 90.0, 22.0 ],
                    "text": "snapshot~ 33"
                }
            },
            {
                "box": {
                    "id": "obj-hitscale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 150.0, 150.0, 22.0 ],
                    "text": "scale 0. 0.5 0. 1. 1."
                }
            },
            {
                "box": {
                    "id": "obj-hitthresh",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 40.0, 180.0, 42.0, 22.0 ],
                    "text": "> 0.05"
                }
            },
            {
                "box": {
                    "id": "obj-hitchange",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 40.0, 210.0, 60.0, 22.0 ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "obj-hitsel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 40.0, 240.0, 50.0, 22.0 ],
                    "text": "sel 1"
                }
            },
            {
                "box": {
                    "id": "obj-hitmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 320.0, 160.0, 22.0 ],
                    "text": "/audio/dt2/trk1/hit 1"
                }
            },
            {
                "box": {
                    "id": "obj-sprintf-hit",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 90.0, 160.0, 22.0 ],
                    "text": "sprintf /audio/dt2/trk%ld/hit 1"
                }
            },
            {
                "box": {
                    "id": "obj-prepend-hit",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 120.0, 80.0, 22.0 ],
                    "text": "prepend set"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-slide", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sprintf-hit", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-hitsel", 0 ],
                    "source": [ "obj-hitchange", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-hitmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-hitthresh", 0 ],
                    "source": [ "obj-hitscale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "order": 0,
                    "source": [ "obj-hitsel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-hitmsg", 0 ],
                    "order": 1,
                    "source": [ "obj-hitsel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-hitscale", 0 ],
                    "source": [ "obj-hitsnap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-hitchange", 0 ],
                    "source": [ "obj-hitthresh", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-hitmsg", 0 ],
                    "source": [ "obj-prepend-hit", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-hitsnap", 0 ],
                    "source": [ "obj-slide", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-prepend-hit", 0 ],
                    "source": [ "obj-sprintf-hit", 0 ]
                }
            }
        ]
    }
}