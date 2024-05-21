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
    getAge ,
    hasRRights ,
    hasWRights

INVARIANT
    users <: USERS &
    contents <: CONTENTS &

    // Functions
    getContentOwner : contents --> users &
    getGender : users --> GENDERS &
    getAge : users --> NATURAL &
    hasRRights : contents <-> users &
    hasWRights : contents <-> users


INITIALISATION
    users := {} ||
    contents := {} ||

    getContentOwner := {} ||
    getGender := {} ||
    getAge := {} ||
    hasRRights := {} ||
    hasWRights := {}


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
        getContentOwner := getContentOwner |>> { user } ||

        // Delete RW rights associated with the user's contents
        // Delete RW rights of the user on other people's contents
        hasRRights := dom ( getContentOwner |>> { user } ) <| ( hasRRights |>> { user } ) ||
        hasWRights := dom ( getContentOwner |>> { user } ) <| ( hasWRights |>> { user } )
    END ;

    // Content management
    PublishContent ( user , content ) =
    PRE
        user : USERS & user : users & content : CONTENTS &
        content /: contents // Le contenu est original
    THEN
        contents := contents \/ { content } ||
        getContentOwner := getContentOwner \/ { content |-> user } ||
        // Content creator has RW rights
        hasRRights := hasRRights \/ { content |-> user } ||
        hasWRights := hasWRights \/ { content |-> user }
    END ;

    // Rights management
    GrantRRights ( from , content , target ) =
    PRE
        from : USERS & from : users &
        content : CONTENTS & content : contents &
        target : USERS & target : users & target /= from &
        getContentOwner ( content ) = from
    THEN
        hasRRights := hasRRights \/ { content |-> target }
    END

END
