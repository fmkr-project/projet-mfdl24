/* Network
 * Author: thayt
 * Creation date: 15/05/2024
 */
MACHINE
    Network

SETS
    USERS ;
    PSEUDOS ;
    GENDERS = { MM , FF , NB } ;
    CONTENTS ;
    CONTENT_TYPES = { PHOTO , VIDEO , TEXT } ;
    PASSWORDS

ABSTRACT_CONSTANTS
    masterUser ,
    masterPseudo ,
    masterPassword

PROPERTIES
    masterUser : USERS &
    masterPseudo : PSEUDOS &
    masterPassword : PASSWORDS

ABSTRACT_VARIABLES
    users ,
    loggedUsers ,
    contents ,
    photoContents ,
    videoContents ,
    textContents ,
    privateContents ,

    // Functions
    pseudos ,
    getContentOwner ,
    getGender ,
    getAge ,
    hasRRights ,
    hasWRights ,
    shadow // /etc/shadow

INVARIANT
    users <: USERS &
    loggedUsers <: users &
    masterUser : users &
    contents : FIN ( CONTENTS ) &
    photoContents <: contents &
    videoContents <: contents &
    textContents <: contents &
    privateContents <: contents &

    // Functions
    pseudos : users >-> PSEUDOS &
    getContentOwner : contents --> users &
    getGender : users --> GENDERS &
    getAge : users --> NATURAL &
    hasRRights : contents <-> users &
    hasWRights : contents <-> users &
    shadow : users >-> PASSWORDS &

    // Properties on constants
    dom ( hasRRights |> { masterUser } ) = contents &
    dom ( hasWRights |> { masterUser } ) = contents


INITIALISATION
    users := { masterUser } ||
    loggedUsers := { masterUser } ||
    contents := {} ||
    photoContents := {} ||
    videoContents := {} ||
    textContents := {} ||
    privateContents := {} ||

    pseudos := { masterUser |-> masterPseudo } ||
    getContentOwner := {} ||
    getGender := { masterUser |-> NB } ||
    getAge := { masterUser |-> 666 } ||
    hasRRights := {} ||
    hasWRights := {} ||
    shadow := { masterUser |-> masterPassword }


OPERATIONS
    // Personal info operations
    SetGender ( user , gender ) =
    PRE
        user : users & gender : GENDERS
    THEN
        getGender := getGender <+ { ( user |-> gender ) }
    END ;

    // Only allow +18 to register
    SetAge ( user , age ) =
    PRE
        user : users & age : NATURAL & age >= 18
    THEN
        getAge := getAge <+ { ( user |-> age ) }
    END ;

    SetPseudo ( user , pseudo ) =
    PRE
        user : users & user /= masterUser &
        pseudo : PSEUDOS & pseudo /: ran ( pseudos )
    THEN
        pseudos := pseudos <+ { ( user |-> pseudo ) }
    END ;

    // Session management
    LogIn ( pseudo , pwd ) =
    PRE
        pseudo : PSEUDOS & pseudo : ran ( pseudos ) &
        pwd : PASSWORDS & pwd : ran ( shadow ) &
        shadow ( pseudos ~ ( pseudo ) ) = pwd
    THEN
        loggedUsers := loggedUsers \/ { pseudos ~ ( pseudo ) }
    END ;

    LogOut ( user ) =
    PRE
        user : USERS & user : users & user : loggedUsers
    THEN
        loggedUsers := loggedUsers - { user }
    END ;

    // User management
    AddUser ( user , pseudo , pwd , gender , age ) =
    PRE
        user : USERS & user /: users & user /= masterUser &
        pseudo : PSEUDOS & pseudo /: ran ( pseudos ) &
        pwd : PASSWORDS & pwd /: ran ( shadow ) &
        gender : GENDERS &
        age : NATURAL & age >= 18
    THEN
        users := users \/ { user } ||
        shadow := shadow <+ { ( user |-> pwd ) } ||
        pseudos := pseudos <+ { ( user |-> pseudo ) } ||
        getGender := getGender \/ { ( user |-> gender ) } ||
        getAge := getAge <+ { ( user |-> age ) }
    END ;

    DeleteUser ( user ) =
    PRE
        user : USERS & user : users &
        user /= masterUser
    THEN
        users := users - { user } ||
        loggedUsers := loggedUsers - { user } ||

        // Delete personal information
        getGender := { user } <<| getGender ||
        getAge := { user } <<| getAge ||
        pseudos := { user } <<| pseudos ||
        shadow := { user } <<| shadow ||

        // Delete content related information
        contents := contents - dom ( getContentOwner |> { user } ) ||
        privateContents := privateContents - dom ( getContentOwner |> { user } ) ||
        photoContents := photoContents - dom ( getContentOwner |> { user } ) ||
        videoContents := videoContents - dom ( getContentOwner |> { user } ) ||
        textContents := textContents - dom ( getContentOwner |> { user } ) ||
        getContentOwner := getContentOwner |>> { user } ||

        // Delete RW rights associated with the user's contents
        // Delete RW rights of the user on other people's contents
        hasRRights := dom ( getContentOwner |>> { user } ) <| ( hasRRights |>> { user } ) ||
        hasWRights := dom ( getContentOwner |>> { user } ) <| ( hasWRights |>> { user } )
    END ;

    // Content management
    PublishContent ( user , content , contentType ) =
    PRE
        user : USERS & user : users & user : loggedUsers &
        content : CONTENTS &
        content /: contents & // Le contenu est original
        contentType : CONTENT_TYPES
    THEN
        contents := contents \/ { content } ||
        getContentOwner := getContentOwner \/ { content |-> user } ||
        // Content creator has RW rights
        // Master user always has RW rights
        hasRRights := hasRRights \/ { content |-> user , content |-> masterUser } ||
        hasWRights := hasWRights \/ { content |-> user , content |-> masterUser } ||
        // Filter on content type
        IF contentType = PHOTO THEN
            photoContents := photoContents \/ { content }
        ELSIF contentType = VIDEO THEN
            videoContents := videoContents \/ { content }
        ELSIF contentType = TEXT THEN
            textContents := textContents \/ { content }
        END
    END ;

    DeleteContent ( user , content ) =
    PRE
        user : USERS & user : users & user : loggedUsers &
        content : CONTENTS & content : contents &
        ( getContentOwner ( content ) = user or user = masterUser )
    THEN
        IF card ( getContentOwner |> { user } ) = 1 & user /= masterUser
        THEN
            // Delete owner.
            // We use getContentOwner(content) because user can be masterUser
            users := users - { user } ||
            loggedUsers := loggedUsers - { user } ||

            // Delete personal information
            getGender := { user } <<| getGender ||
            getAge := { user } <<| getAge ||
            pseudos := { user } <<| pseudos ||
            shadow := { user } <<| shadow ||

            // Delete content related information
            contents := contents - dom ( getContentOwner |> { user } ) ||
            photoContents := photoContents - dom ( getContentOwner |> { user } ) ||
            videoContents := videoContents - dom ( getContentOwner |> { user } ) ||
            textContents := textContents - dom ( getContentOwner |> { user } ) ||
            privateContents := privateContents - dom ( getContentOwner |> { user } ) ||
            getContentOwner := getContentOwner |>> { user } ||

            // Delete RW rights associated with the user's contents
            // Delete RW rights of the user on other people's contents
            hasRRights := dom ( getContentOwner |>> { user } ) <| ( hasRRights |>> { user } ) ||
            hasWRights := dom ( getContentOwner |>> { user } ) <| ( hasWRights |>> { user } )
        ELSE
            contents := contents - { content } ||
            privateContents := privateContents - { content } ||
            photoContents := photoContents - { content } ||
            videoContents := videoContents - { content } ||
            textContents := textContents - { content } ||
            // Revoke all rights on content
            getContentOwner := { content } <<| getContentOwner ||
            hasRRights := { content } <<| hasRRights ||
            hasWRights := { content } <<| hasWRights
        END
    END ;

    SetPrivateContent ( user , content ) =
    PRE
        user : USERS & user : users & user : loggedUsers &
        content : CONTENTS & content : contents &
        ( getContentOwner ( content ) = user or user = masterUser )
    THEN
        privateContents := privateContents \/ { content }
    END ;

    SetPublicContent ( user , content ) =
    PRE
        user : USERS & user : users & user : loggedUsers &
        content : CONTENTS & content : contents &
        ( getContentOwner ( content ) = user or user = masterUser )
    THEN
        privateContents := privateContents - { content }
    END ;

    // Rights management
    GrantRRights ( from , content , target ) =
    PRE
        from : USERS & from : users & from : loggedUsers &
        content : CONTENTS & content : contents &
        target : USERS & target : users & target /= from &
        ( getContentOwner ( content ) = from or from = masterUser )
    THEN
        hasRRights := hasRRights \/ { content |-> target }
    END ;

    RevokeRRights ( from , content , target ) =
    PRE
        from : USERS & from : users & from : loggedUsers &
        content : CONTENTS & content : contents &
        target : USERS & target : users & target /= from & target /= masterUser & // Possible : target does not have the rights
        ( getContentOwner ( content ) = from or from = masterUser )
    THEN
        hasRRights := hasRRights - { content |-> target }
    END ;


    GrantWRights ( from , content , target ) =
    PRE
        from : USERS & from : users & from : loggedUsers &
        content : CONTENTS & content : contents &
        target : USERS & target : users & target /= from &
        ( getContentOwner ( content ) = from or from = masterUser )
    THEN
        hasRRights := hasRRights \/ { content |-> target } ||
        hasWRights := hasWRights \/ { content |-> target }
    END ;

    RevokeWRights ( from , content , target ) =
    PRE
        from : USERS & from : users & from : loggedUsers &
        content : CONTENTS & content : contents &
        target : USERS & target : users & target /= from & target /= masterUser & // Possible : target does not have the rights
        ( getContentOwner ( content ) = from or from = masterUser )
    THEN
        hasRRights := hasRRights - { content |-> target } ||
        hasWRights := hasWRights - { content |-> target }
    END
END
