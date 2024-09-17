*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

class zcl_earth definition.
    public section.
        METHODS start_engine RETURNING value(r_value) type string.
        METHODS leave_orbit RETURNING value(r_value) type string.
ENDCLASS.
class zcl_earth IMPLEMENTATION.
        method start_engine.
            r_value = 'We take off from planet Earth for mission Mars'.
        ENDMETHOD.
        method leave_orbit.
            r_value = 'We leave earth orbit'.
        ENDMETHOD.
ENDCLASS.

class zcl_planet1 definition.
    PUBLIC SECTION.
        METHODS enter_orbit RETURNING value(r_value) type string.
        METHODS leave_orbit RETURNING value(r_value) type string.
ENDCLASS.
class zcl_planet1 IMPLEMENTATION.
        method enter_orbit.
            r_value = 'We enter planet 1 orbit'.
        ENDMETHOD.
        method leave_orbit.
            r_value = 'We leave planet1 orbit'.
        ENDMETHOD.
ENDCLASS.

class zcl_mars definition.
    PUBLIC SECTION.
        METHODS enter_orbit RETURNING value(r_value) type string.
        METHODS explore_mars RETURNING value(r_value) type string.
ENDCLASS.
class zcl_mars IMPLEMENTATION.
        method enter_orbit.
            r_value = 'We enter in Mars orbit'.
        ENDMETHOD.
        method explore_mars.
            r_value = 'Roger! we found water on mars'.
        ENDMETHOD.
ENDCLASS.
