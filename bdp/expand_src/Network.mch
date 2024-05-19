/* Network
 * Author: thayt
 * Creation date: 15/05/2024
 */
MACHINE
    Network

SETS
    USERS ;
    GENDERS

ABSTRACT_VARIABLES
    users ,
    getGender

INVARIANT
    users <: USERS &
    getGender : users --> GENDERS


INITIALISATION
    users := {} ||
    getGender := {}


OPERATIONS
    // Gender operations
    SetGender ( user , gender ) =
    PRE
        user : users & gender : GENDERS
    THEN
        getGender := getGender <+ { ( user |-> gender ) }
    END ;

    AddUser ( user , gender ) =
    PRE
        user : USERS & user /: users & gender : GENDERS
    THEN
        users := users \/ { user } ||
        getGender := getGender <+ { ( user |-> gender ) }
    END ;

    DeleteUser ( user ) =
    PRE
        user : USERS & user : users
    THEN
        users := users - { user } ||
        getGender := { user } <<| getGender
    END

END
