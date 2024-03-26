# Change Log


All notable changes to the "keithley_instrument_libraries" npm package will be documented in this file.

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!--
Check [Keep a Changelog](http://keepachangelog.com/) for recommendations on how to structure this file.

    Added -- for new features.
    Changed -- for changes in existing functionality.
    Deprecated -- for soon-to-be removed features.
    Removed -- for now removed features.
    Fixed -- for any bug fixes.
    Security -- in case of vulnerabilities.
-->

## [0.15.0]

### Fixed
- Any data type issue has been corrected for all tti models

## [0.14.2]

### Added
- 2600B series SMU language support has been added
### Fixed
- Beta priority command set for 2600B series SMU definitions has been verified and found issue is corrected(TSP-589)
- Enum order issue has been corrected

## [0.14.1]

### Fixed
- TTI model(2450, 2460, 2461, 2470, DMM7510) command set has been verified and found issue is corrected(TSP-569)



## [0.11.2]
### Added
- trigger.model.setblock() documentation fix (TSP-392)
- Model support for 70xB added (TSP-387)
- Generic Parser for all tehe currently supported instruments (TSP-357)
- Language feature has been added for 37XX command set(TSP-341)
- nodeTable.lua definition file has been added for few models(TSP-336)
- Language feature has been added for DAQ6510 and DMM6500 command set(TSP-304)
- Language feature has been added for 24XX and DMM7510 command set(TSP-232)


[0.15.0]: https://github.com/tektronix/tsp-toolkit-json-to-lua/releases/tag/v0.15.0
[0.14.2]: https://github.com/tektronix/tsp-toolkit-json-to-lua/releases/tag/v0.14.2
[0.14.1]: https://github.com/tektronix/tsp-toolkit-json-to-lua/releases/tag/v0.14.1
[0.11.2]: https://github.com/tektronix/tsp-toolkit-json-to-lua/releases/tag/v0.11.2