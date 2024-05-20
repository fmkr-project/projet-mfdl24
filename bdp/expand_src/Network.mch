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
    getGender ,
    getAge

INVARIANT
    users <: USERS &
    getGender : users --> GENDERS &
    getAge : users --> NATURAL


INITIALISATION
    users := {} ||
    getGender := {} ||
    getAge := {}


OPERATIONS
    // Gender operations
    SetGender ( user , gender ) =
    PRE
        user : users & gender : GENDERS
    THEN
        getGender := getGender <+ { ( user |-> gender ) }
    END ;

    // Age operations
    // Only allow +18 to register
    SetAge ( user , age ) =
    PRE
        user : users & age : NATURAL & age >= 18
    THEN
        getAge := getAge <+ { ( user |-> age ) }
    END ;

    AddUser ( user , gender , age ) =
    PRE
        user : USERS & user /: users &
        gender : GENDERS &
        age : NATURAL & age >= 18
    THEN
        users := users \/ { user } ||
        getGender := getGender <+ { ( user |-> gender ) } ||
        getAge := getAge <+ { ( user |-> age ) }
    END ;

    DeleteUser ( user ) =
    PRE
        user : USERS & user : users
    THEN
        users := users - { user } ||
        getGender := { user } <<| getGender ||
        getAge := { user } <<| getAge
    END

END
