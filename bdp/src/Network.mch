/* Network
 * Author: thayt
 * Creation date: 15/05/2024
 */
MACHINE
    Network

SETS
    USERS ;
    GENDERS ;
    CONTENTS

ABSTRACT_VARIABLES
    users ,
    contents ,

    // Functions
    getContentOwner ,
    getGender ,
    getAge

INVARIANT
    users <: USERS &
    contents <: CONTENTS &

    // Functions
    getContentOwner : contents --> users &
    getGender : users --> GENDERS &
    getAge : users --> NATURAL


INITIALISATION
    users := {} ||
    contents := {} ||

    getContentOwner := {} ||
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

    // User management
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

        // Delete personal information
        getGender := { user } <<| getGender ||
        getAge := { user } <<| getAge ||

        // Delete content related information
        contents := contents - dom ( getContentOwner |> { user } ) ||
        getContentOwner := getContentOwner |>> { user }
    END ;

    // Content management
    PublishContent ( user , content ) =
    PRE
        user : USERS & user : users & content : CONTENTS &
        content /: contents
    THEN
        contents := contents \/ { content } ||
        getContentOwner := getContentOwner \/ { content |-> user }
    END

END
