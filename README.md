# cb_vehicle_tuner

`cb_vehicle_tuner` is a standalone FiveM resource for shaping vehicle handling into something more deliberate, more stable, and easier to tune at scale.

It applies a global handling base to streamed vehicles and can layer preset-specific class and model overrides on top for different driving styles.

## Overview

| Item | Details |
| --- | --- |
| Resource type | Standalone FiveM resource |
| Dependency | None |
| Handling side | Client |
| Version checking | Server |
| License | GNU GPL v3.0 only |

## Features

- Standalone and framework-free
- Named preset packs for different driving styles
- Optional class-specific tuning for broad vehicle groups
- Optional model-specific tuning for vanilla and addon vehicles
- Fixed server-side version checker
- Console startup message when the resource loads

## Presets

- `northstar` - balanced road handling with mild stability support
- `ironwake` - heavier and more planted for larger vehicles
- `driftline` - looser and more responsive for street and performance cars
- `trailforge` - tuned for rougher surfaces and utility-style driving

## Installation

1. Place the `cb_vehicle_tuner` folder in your server resources.
2. Add `ensure cb_vehicle_tuner` to your server startup config.
3. Edit `config.lua` and choose the preset you want to use.
4. Publish a plain-text `version.txt` file in the GitHub repository used by the checker.

## Configuration

The main control point is `activePreset` in `config.lua`.

Each preset can define:

- `baseHandling` - the default handling values applied to every vehicle
- `useClassProfiles` - whether class overrides are layered on top of the base tune
- `useModelProfiles` - whether model overrides are layered on top of the base tune
- `classProfiles` - GTA vehicle class-specific handling values
- `modelProfiles` - vehicle model-specific handling values for vanilla or addon cars

## Version Checking

The version checker is fixed in `server.lua`. It compares the installed manifest version to the raw GitHub version file for the `codebstudios/cb_vehicle_tuner` repository.

When the resource starts, the server prints a startup message. Shortly after that, it checks the remote version and reports whether the resource is current or an update is available.

## Tuning Notes

If vehicles still turn too sharply, lower `fSteeringLock` in the active preset. If they slide too much, raise the traction values slightly.

If you want heavier vehicles to feel more planted, reduce steering lock and keep traction conservative. If you want sportier cars to feel sharper, keep traction a little higher and reduce steering lock less aggressively.

## GitHub Publishing

If you want the version checker to work, publish the resource under the `codebstudios` organization and expose a plain-text `version.txt` file at the raw URL used in `server.lua`.

Example:

```text
https://raw.githubusercontent.com/codebstudios/cb_vehicle_tuner/main/version.txt
```

## License

This project is licensed under the GNU GPL v3.0 only. See [LICENSE](LICENSE) for the license notice and the GNU website for the full text.
