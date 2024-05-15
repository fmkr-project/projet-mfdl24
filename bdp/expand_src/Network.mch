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
    users

INVARIANT
    users <: USERS


INITIALISATION
    users := {}


END
