/* Network
 * Author: thayt
 * Creation date: 15/05/2024
 */
MACHINE
    Network

SETS
    USERS;
    GENDERS = {MM, FF, NB};
    CONTENTS

ABSTRACT_CONSTANTS
    masterUser

PROPERTIES
    masterUser ∈ USERS

ABSTRACT_VARIABLES
    users,
    contents,
    
    // Functions
    getContentOwner,
    getGender,
    getAge,
    hasRRights,
    hasWRights
    
INVARIANT
    users ⊆ USERS &
    masterUser ∈ users &
    contents ⊆ CONTENTS &
    
    // Functions
    getContentOwner : contents → users &
    getGender : users → GENDERS &
    getAge : users → ℕ &
    hasRRights : contents ↔ users &
    hasWRights : contents ↔ users &
    
    // Properties on constants
    dom(hasRRights ▷ {masterUser}) = contents &
    dom(hasWRights ▷ {masterUser}) = contents


INITIALISATION
    users := {masterUser} ||
    contents := {} ||
    
    getContentOwner := {} ||
    getGender := {masterUser ↦ NB} ||
    getAge := {masterUser ↦ 666} ||
    hasRRights := {} ||
    hasWRights := {}


OPERATIONS
    // Gender operations
    SetGender(user, gender) =
    PRE
        user : users & gender : GENDERS
    THEN
        getGender := getGender ⋖ {(user ↦ gender)}
    END;
    
    // Age operations
    // Only allow +18 to register
    SetAge(user, age) =
    PRE
        user : users & age : ℕ & age ≥ 18
    THEN
        getAge := getAge ⋖ {(user ↦ age)}
    END;
    
    // User management
    AddUser(user, gender, age) =
    PRE
        user : USERS & user ∉ users & user ≠ masterUser &
        gender : GENDERS &
        age : ℕ & age ≥ 18
    THEN
        users := users ∪ {user} ||
        getGender := getGender ∪ {(user ↦ gender)} ||
        getAge := getAge ⋖ {(user ↦ age)}
    END;
    
    DeleteUser(user) =
    PRE
        user : USERS & user ∈ users &
        user ≠ masterUser // masterUser cannot be deleted, EVER!
    THEN
        users := users - {user} ||
        
        // Delete personal information
        getGender := {user} ◀ getGender ||
        getAge := {user} ◀ getAge ||
        
        // Delete content related information
        contents := contents - dom(getContentOwner ▷ {user}) ||
        getContentOwner := getContentOwner ▶ {user} ||
        
        // Delete RW rights associated with the user's contents
        // Delete RW rights of the user on other people's contents
        hasRRights := dom(getContentOwner ▶ {user}) ◁ (hasRRights ▶ {user}) ||
        hasWRights := dom(getContentOwner ▶ {user}) ◁ (hasWRights ▶ {user})
    END;
    
    // Content management
    PublishContent(user, content) =
    PRE
        user : USERS & user ∈ users & content : CONTENTS &
        content ∉ contents // Le contenu est original
    THEN
        contents := contents ∪ {content} ||
        getContentOwner := getContentOwner ∪ {content ↦ user} ||
        // Content creator has RW rights
        // Master user always has RW rights
        hasRRights := hasRRights ∪ {content ↦ user, content ↦ masterUser} ||
        hasWRights := hasWRights ∪ {content ↦ user, content ↦ masterUser}
    END;
    
    // Rights management
    GrantRRights(from, content, target) =
    PRE
        from : USERS & from ∈ users &
        content : CONTENTS & content ∈ contents &
        target : USERS & target ∈ users & target ≠ from &
        getContentOwner(content) = from
    THEN
        hasRRights := hasRRights ∪ {content ↦ target}
    END;
    
    GrantWRights(from, content, target) =
    PRE
        from : USERS & from ∈ users &
        content : CONTENTS & content ∈ contents &
        target : USERS & target ∈ users & target ≠ from &
        getContentOwner(content) = from
    THEN
        hasWRights := hasWRights ∪ {content ↦ target}
    END

END
