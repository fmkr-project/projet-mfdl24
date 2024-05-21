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
  Local_List_Variables(Machine(Network))==(hasWRights,hasRRights,getAge,getGender,getContentOwner,contents,users);
  List_Variables(Machine(Network))==(hasWRights,hasRRights,getAge,getGender,getContentOwner,contents,users);
  External_List_Variables(Machine(Network))==(hasWRights,hasRRights,getAge,getGender,getContentOwner,contents,users)
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
  List_Invariant(Machine(Network))==(users <: USERS & contents <: CONTENTS & getContentOwner: contents --> users & getGender: users --> GENDERS & getAge: users --> NATURAL & hasRRights: contents <-> users & hasWRights: contents <-> users)
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
  Expanded_List_Initialisation(Machine(Network))==(users,contents,getContentOwner,getGender,getAge,hasRRights,hasWRights:={},{},{},{},{},{},{});
  Context_List_Initialisation(Machine(Network))==(skip);
  List_Initialisation(Machine(Network))==(users:={} || contents:={} || getContentOwner:={} || getGender:={} || getAge:={} || hasRRights:={} || hasWRights:={})
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
  Internal_List_Operations(Machine(Network))==(SetGender,SetAge,AddUser,DeleteUser,PublishContent,GrantRRights);
  List_Operations(Machine(Network))==(SetGender,SetAge,AddUser,DeleteUser,PublishContent,GrantRRights)
END
&
THEORY ListInputX IS
  List_Input(Machine(Network),SetGender)==(user,gender);
  List_Input(Machine(Network),SetAge)==(user,age);
  List_Input(Machine(Network),AddUser)==(user,gender,age);
  List_Input(Machine(Network),DeleteUser)==(user);
  List_Input(Machine(Network),PublishContent)==(user,content);
  List_Input(Machine(Network),GrantRRights)==(from,content,target)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Network),SetGender)==(?);
  List_Output(Machine(Network),SetAge)==(?);
  List_Output(Machine(Network),AddUser)==(?);
  List_Output(Machine(Network),DeleteUser)==(?);
  List_Output(Machine(Network),PublishContent)==(?);
  List_Output(Machine(Network),GrantRRights)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Network),SetGender)==(SetGender(user,gender));
  List_Header(Machine(Network),SetAge)==(SetAge(user,age));
  List_Header(Machine(Network),AddUser)==(AddUser(user,gender,age));
  List_Header(Machine(Network),DeleteUser)==(DeleteUser(user));
  List_Header(Machine(Network),PublishContent)==(PublishContent(user,content));
  List_Header(Machine(Network),GrantRRights)==(GrantRRights(from,content,target))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Network),SetGender)==(user: users & gender: GENDERS);
  List_Precondition(Machine(Network),SetAge)==(user: users & age: NATURAL & age>=18);
  List_Precondition(Machine(Network),AddUser)==(user: USERS & user/:users & gender: GENDERS & age: NATURAL & age>=18);
  List_Precondition(Machine(Network),DeleteUser)==(user: USERS & user: users);
  List_Precondition(Machine(Network),PublishContent)==(user: USERS & user: users & content: CONTENTS & content/:contents);
  List_Precondition(Machine(Network),GrantRRights)==(from: USERS & from: users & content: CONTENTS & content: contents & target: USERS & target: users & target/=from & getContentOwner(content) = from)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Network),GrantRRights)==(from: USERS & from: users & content: CONTENTS & content: contents & target: USERS & target: users & target/=from & getContentOwner(content) = from | hasRRights:=hasRRights\/{content|->target});
  Expanded_List_Substitution(Machine(Network),PublishContent)==(user: USERS & user: users & content: CONTENTS & content/:contents | contents,getContentOwner,hasRRights,hasWRights:=contents\/{content},getContentOwner\/{content|->user},hasRRights\/{content|->user},hasWRights\/{content|->user});
  Expanded_List_Substitution(Machine(Network),DeleteUser)==(user: USERS & user: users | users,getGender,getAge,contents,getContentOwner,hasRRights,hasWRights:=users-{user},{user}<<|getGender,{user}<<|getAge,contents-dom(getContentOwner|>{user}),getContentOwner|>>{user},dom(getContentOwner|>>{user})<|(hasRRights|>>{user}),dom(getContentOwner|>>{user})<|(hasWRights|>>{user}));
  Expanded_List_Substitution(Machine(Network),AddUser)==(user: USERS & user/:users & gender: GENDERS & age: NATURAL & age>=18 | users,getGender,getAge:=users\/{user},getGender<+{user|->gender},getAge<+{user|->age});
  Expanded_List_Substitution(Machine(Network),SetAge)==(user: users & age: NATURAL & age>=18 | getAge:=getAge<+{user|->age});
  Expanded_List_Substitution(Machine(Network),SetGender)==(user: users & gender: GENDERS | getGender:=getGender<+{user|->gender});
  List_Substitution(Machine(Network),SetGender)==(getGender:=getGender<+{user|->gender});
  List_Substitution(Machine(Network),SetAge)==(getAge:=getAge<+{user|->age});
  List_Substitution(Machine(Network),AddUser)==(users:=users\/{user} || getGender:=getGender<+{user|->gender} || getAge:=getAge<+{user|->age});
  List_Substitution(Machine(Network),DeleteUser)==(users:=users-{user} || getGender:={user}<<|getGender || getAge:={user}<<|getAge || contents:=contents-dom(getContentOwner|>{user}) || getContentOwner:=getContentOwner|>>{user} || hasRRights:=dom(getContentOwner|>>{user})<|(hasRRights|>>{user}) || hasWRights:=dom(getContentOwner|>>{user})<|(hasWRights|>>{user}));
  List_Substitution(Machine(Network),PublishContent)==(contents:=contents\/{content} || getContentOwner:=getContentOwner\/{content|->user} || hasRRights:=hasRRights\/{content|->user} || hasWRights:=hasWRights\/{content|->user});
  List_Substitution(Machine(Network),GrantRRights)==(hasRRights:=hasRRights\/{content|->target})
END
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
  List_Valuable_Sets(Machine(Network))==(USERS,GENDERS,CONTENTS);
  Inherited_List_Enumerated(Machine(Network))==(?);
  Inherited_List_Defered(Machine(Network))==(?);
  Inherited_List_Sets(Machine(Network))==(?);
  List_Enumerated(Machine(Network))==(?);
  List_Defered(Machine(Network))==(USERS,GENDERS,CONTENTS);
  List_Sets(Machine(Network))==(USERS,GENDERS,CONTENTS);
  Set_Definition(Machine(Network),GENDERS)==(?);
  Set_Definition(Machine(Network),CONTENTS)==(?)
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
  List_Properties(Machine(Network))==(USERS: FIN(INTEGER) & not(USERS = {}) & GENDERS: FIN(INTEGER) & not(GENDERS = {}) & CONTENTS: FIN(INTEGER) & not(CONTENTS = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Network),SetGender)==(?);
  List_ANY_Var(Machine(Network),SetAge)==(?);
  List_ANY_Var(Machine(Network),AddUser)==(?);
  List_ANY_Var(Machine(Network),DeleteUser)==(?);
  List_ANY_Var(Machine(Network),PublishContent)==(?);
  List_ANY_Var(Machine(Network),GrantRRights)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Network)) == (USERS,GENDERS,CONTENTS | ? | hasWRights,hasRRights,getAge,getGender,getContentOwner,contents,users | ? | SetGender,SetAge,AddUser,DeleteUser,PublishContent,GrantRRights | ? | ? | ? | Network);
  List_Of_HiddenCst_Ids(Machine(Network)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Network)) == (?);
  List_Of_VisibleVar_Ids(Machine(Network)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Network)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Network)) == (Type(USERS) == Cst(SetOf(atype(USERS,"[USERS","]USERS")));Type(GENDERS) == Cst(SetOf(atype(GENDERS,"[GENDERS","]GENDERS")));Type(CONTENTS) == Cst(SetOf(atype(CONTENTS,"[CONTENTS","]CONTENTS"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Network)) == (Type(hasWRights) == Mvl(SetOf(atype(CONTENTS,?,?)*atype(USERS,?,?)));Type(hasRRights) == Mvl(SetOf(atype(CONTENTS,?,?)*atype(USERS,?,?)));Type(getAge) == Mvl(SetOf(atype(USERS,?,?)*btype(INTEGER,?,?)));Type(getGender) == Mvl(SetOf(atype(USERS,?,?)*atype(GENDERS,"[GENDERS","]GENDERS")));Type(getContentOwner) == Mvl(SetOf(atype(CONTENTS,?,?)*atype(USERS,?,?)));Type(contents) == Mvl(SetOf(atype(CONTENTS,?,?)));Type(users) == Mvl(SetOf(atype(USERS,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Network)) == (Type(GrantRRights) == Cst(No_type,atype(USERS,?,?)*atype(CONTENTS,?,?)*atype(USERS,?,?));Type(PublishContent) == Cst(No_type,atype(USERS,?,?)*atype(CONTENTS,?,?));Type(DeleteUser) == Cst(No_type,atype(USERS,?,?));Type(AddUser) == Cst(No_type,atype(USERS,?,?)*atype(GENDERS,?,?)*btype(INTEGER,?,?));Type(SetAge) == Cst(No_type,atype(USERS,?,?)*btype(INTEGER,?,?));Type(SetGender) == Cst(No_type,atype(USERS,?,?)*atype(GENDERS,?,?)))
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
