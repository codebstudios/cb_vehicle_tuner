CONFIG = {
    refreshInterval = 2000,
    activePreset = "northstar",
    presets = {
        northstar = {
            label = "Northstar",
            baseHandling = {
                fSteeringLock = 28.0,
                fTractionCurveMax = 2.55,
                fTractionCurveMin = 2.20,
                fTractionLossMult = 0.85,
                fLowSpeedTractionLossMult = 1.10
            },
            useClassProfiles = true,
            useModelProfiles = true,
            classProfiles = {
                [0] = {
                    fSteeringLock = 29.5,
                    fTractionCurveMax = 2.60,
                    fTractionCurveMin = 2.28
                },
                [2] = {
                    fSteeringLock = 27.0,
                    fTractionCurveMax = 2.70,
                    fTractionCurveMin = 2.34,
                    fTractionLossMult = 0.80
                },
                [4] = {
                    fSteeringLock = 26.0,
                    fTractionCurveMax = 2.48,
                    fTractionCurveMin = 2.18,
                    fTractionLossMult = 0.88
                },
                [8] = {
                    fSteeringLock = 24.0,
                    fTractionCurveMax = 2.35,
                    fTractionCurveMin = 2.05,
                    fLowSpeedTractionLossMult = 1.02
                },
                [18] = {
                    fSteeringLock = 30.0,
                    fTractionCurveMax = 2.62,
                    fTractionCurveMin = 2.30
                }
            },
            modelProfiles = {
                police = {
                    fSteeringLock = 29.0,
                    fTractionCurveMax = 2.58
                },
                police2 = {
                    fSteeringLock = 29.0,
                    fTractionCurveMax = 2.58
                },
                sultanrs = {
                    fSteeringLock = 26.5,
                    fTractionCurveMax = 2.72,
                    fTractionCurveMin = 2.36,
                    fTractionLossMult = 0.78
                },
                adder = {
                    fSteeringLock = 25.0,
                    fTractionCurveMax = 2.80,
                    fTractionCurveMin = 2.42,
                    fTractionLossMult = 0.76
                }
            }
        },
        ironwake = {
            label = "Ironwake",
            baseHandling = {
                fSteeringLock = 26.0,
                fTractionCurveMax = 2.42,
                fTractionCurveMin = 2.12,
                fTractionLossMult = 0.90,
                fLowSpeedTractionLossMult = 1.14
            },
            useClassProfiles = true,
            classProfiles = {
                [10] = {
                    fSteeringLock = 23.5,
                    fTractionCurveMax = 2.30,
                    fTractionCurveMin = 2.02
                },
                [11] = {
                    fSteeringLock = 24.0,
                    fTractionCurveMax = 2.34,
                    fTractionCurveMin = 2.05
                },
                [14] = {
                    fSteeringLock = 27.0,
                    fTractionCurveMax = 2.48,
                    fTractionCurveMin = 2.16
                },
                [20] = {
                    fSteeringLock = 22.5,
                    fTractionCurveMax = 2.22,
                    fTractionCurveMin = 1.98
                }
            }
        },
        driftline = {
            label = "Driftline",
            baseHandling = {
                fSteeringLock = 31.0,
                fTractionCurveMax = 2.72,
                fTractionCurveMin = 2.36,
                fTractionLossMult = 0.78,
                fLowSpeedTractionLossMult = 0.96
            },
            useModelProfiles = true,
            modelProfiles = {
                comet2 = {
                    fSteeringLock = 33.0,
                    fTractionCurveMax = 2.80,
                    fTractionCurveMin = 2.42,
                    fTractionLossMult = 0.74
                },
                banshee = {
                    fSteeringLock = 32.5,
                    fTractionCurveMax = 2.78,
                    fTractionCurveMin = 2.40,
                    fTractionLossMult = 0.75
                },
                sultan = {
                    fSteeringLock = 31.5,
                    fTractionCurveMax = 2.74,
                    fTractionCurveMin = 2.38,
                    fTractionLossMult = 0.77
                }
            }
        },
        trailforge = {
            label = "Trailforge",
            baseHandling = {
                fSteeringLock = 25.0,
                fTractionCurveMax = 2.35,
                fTractionCurveMin = 2.08,
                fTractionLossMult = 0.92,
                fLowSpeedTractionLossMult = 1.08
            },
            useClassProfiles = true,
            classProfiles = {
                [2] = {
                    fSteeringLock = 24.5,
                    fTractionCurveMax = 2.32,
                    fTractionCurveMin = 2.04
                },
                [3] = {
                    fSteeringLock = 24.0,
                    fTractionCurveMax = 2.30,
                    fTractionCurveMin = 2.00
                },
                [6] = {
                    fSteeringLock = 23.0,
                    fTractionCurveMax = 2.26,
                    fTractionCurveMin = 1.98
                }
            }
        }
    }
}
