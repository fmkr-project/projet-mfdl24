Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Network))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Network))==(Machine(Network));
  Level(Machine(Network))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Network)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Network))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Network))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Network))==(?);
  List_Includes(Machine(Network))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Network))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Network))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Network))==(?);
  Context_List_Variables(Machine(Network))==(?);
  Abstract_List_Variables(Machine(Network))==(?);
  Local_List_Variables(Machine(Network))==(users);
  List_Variables(Machine(Network))==(users);
  External_List_Variables(Machine(Network))==(users)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Network))==(?);
  Abstract_List_VisibleVariables(Machine(Network))==(?);
  External_List_VisibleVariables(Machine(Network))==(?);
  Expanded_List_VisibleVariables(Machine(Network))==(?);
  List_VisibleVariables(Machine(Network))==(?);
  Internal_List_VisibleVariables(Machine(Network))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Network))==(btrue);
  Gluing_List_Invariant(Machine(Network))==(btrue);
  Expanded_List_Invariant(Machine(Network))==(btrue);
  Abstract_List_Invariant(Machine(Network))==(btrue);
  Context_List_Invariant(Machine(Network))==(btrue);
  List_Invariant(Machine(Network))==(users <: USERS)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Network))==(btrue);
  Abstract_List_Assertions(Machine(Network))==(btrue);
  Context_List_Assertions(Machine(Network))==(btrue);
  List_Assertions(Machine(Network))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Network))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Network))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Network))==(users:={});
  Context_List_Initialisation(Machine(Network))==(skip);
  List_Initialisation(Machine(Network))==(users:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Network))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Network))==(btrue);
  List_Constraints(Machine(Network))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Network))==(?);
  List_Operations(Machine(Network))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Network))==(?);
  Inherited_List_Constants(Machine(Network))==(?);
  List_Constants(Machine(Network))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Network),USERS)==(?);
  Context_List_Enumerated(Machine(Network))==(?);
  Context_List_Defered(Machine(Network))==(?);
  Context_List_Sets(Machine(Network))==(?);
  List_Valuable_Sets(Machine(Network))==(USERS,GENDERS);
  Inherited_List_Enumerated(Machine(Network))==(?);
  Inherited_List_Defered(Machine(Network))==(?);
  Inherited_List_Sets(Machine(Network))==(?);
  List_Enumerated(Machine(Network))==(?);
  List_Defered(Machine(Network))==(USERS,GENDERS);
  List_Sets(Machine(Network))==(USERS,GENDERS);
  Set_Definition(Machine(Network),GENDERS)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Network))==(?);
  Expanded_List_HiddenConstants(Machine(Network))==(?);
  List_HiddenConstants(Machine(Network))==(?);
  External_List_HiddenConstants(Machine(Network))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Network))==(btrue);
  Context_List_Properties(Machine(Network))==(btrue);
  Inherited_List_Properties(Machine(Network))==(btrue);
  List_Properties(Machine(Network))==(USERS: FIN(INTEGER) & not(USERS = {}) & GENDERS: FIN(INTEGER) & not(GENDERS = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Network)) == (USERS,GENDERS | ? | users | ? | ? | ? | ? | ? | Network);
  List_Of_HiddenCst_Ids(Machine(Network)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Network)) == (?);
  List_Of_VisibleVar_Ids(Machine(Network)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Network)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Network)) == (Type(USERS) == Cst(SetOf(atype(USERS,"[USERS","]USERS")));Type(GENDERS) == Cst(SetOf(atype(GENDERS,"[GENDERS","]GENDERS"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Network)) == (Type(users) == Mvl(SetOf(atype(USERS,?,?))))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
