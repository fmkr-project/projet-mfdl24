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
  Local_List_Variables(Machine(Network))==(shadow,hasWRights,hasRRights,getAge,getGender,getContentOwner,pseudos,privateContents,contents,loggedUsers,users);
  List_Variables(Machine(Network))==(shadow,hasWRights,hasRRights,getAge,getGender,getContentOwner,pseudos,privateContents,contents,loggedUsers,users);
  External_List_Variables(Machine(Network))==(shadow,hasWRights,hasRRights,getAge,getGender,getContentOwner,pseudos,privateContents,contents,loggedUsers,users)
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
  List_Invariant(Machine(Network))==(users <: USERS & loggedUsers <: users & masterUser: users & contents: FIN(CONTENTS) & privateContents <: contents & pseudos: users >-> PSEUDOS & getContentOwner: contents --> users & getGender: users --> GENDERS & getAge: users --> NATURAL & hasRRights: contents <-> users & hasWRights: contents <-> users & shadow: users >-> PASSWORDS & dom(hasRRights|>{masterUser}) = contents & dom(hasWRights|>{masterUser}) = contents)
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
  Expanded_List_Initialisation(Machine(Network))==(users,loggedUsers,contents,privateContents,pseudos,getContentOwner,getGender,getAge,hasRRights,hasWRights,shadow:={masterUser},{masterUser},{},{},{masterUser|->masterPseudo},{},{masterUser|->NB},{masterUser|->666},{},{},{masterUser|->masterPassword});
  Context_List_Initialisation(Machine(Network))==(skip);
  List_Initialisation(Machine(Network))==(users:={masterUser} || loggedUsers:={masterUser} || contents:={} || privateContents:={} || pseudos:={masterUser|->masterPseudo} || getContentOwner:={} || getGender:={masterUser|->NB} || getAge:={masterUser|->666} || hasRRights:={} || hasWRights:={} || shadow:={masterUser|->masterPassword})
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
  Internal_List_Operations(Machine(Network))==(SetGender,SetAge,SetPseudo,AddUser,DeleteUser,PublishContent,DeleteContent,SetPrivateContent,SetPublicContent,GrantRRights,RevokeRRights,GrantWRights,RevokeWRights);
  List_Operations(Machine(Network))==(SetGender,SetAge,SetPseudo,AddUser,DeleteUser,PublishContent,DeleteContent,SetPrivateContent,SetPublicContent,GrantRRights,RevokeRRights,GrantWRights,RevokeWRights)
END
&
THEORY ListInputX IS
  List_Input(Machine(Network),SetGender)==(user,gender);
  List_Input(Machine(Network),SetAge)==(user,age);
  List_Input(Machine(Network),SetPseudo)==(user,pseudo);
  List_Input(Machine(Network),AddUser)==(user,pwd,pseudo,gender,age);
  List_Input(Machine(Network),DeleteUser)==(user);
  List_Input(Machine(Network),PublishContent)==(user,content);
  List_Input(Machine(Network),DeleteContent)==(user,content);
  List_Input(Machine(Network),SetPrivateContent)==(user,content);
  List_Input(Machine(Network),SetPublicContent)==(user,content);
  List_Input(Machine(Network),GrantRRights)==(from,content,target);
  List_Input(Machine(Network),RevokeRRights)==(from,content,target);
  List_Input(Machine(Network),GrantWRights)==(from,content,target);
  List_Input(Machine(Network),RevokeWRights)==(from,content,target)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Network),SetGender)==(?);
  List_Output(Machine(Network),SetAge)==(?);
  List_Output(Machine(Network),SetPseudo)==(?);
  List_Output(Machine(Network),AddUser)==(?);
  List_Output(Machine(Network),DeleteUser)==(?);
  List_Output(Machine(Network),PublishContent)==(?);
  List_Output(Machine(Network),DeleteContent)==(?);
  List_Output(Machine(Network),SetPrivateContent)==(?);
  List_Output(Machine(Network),SetPublicContent)==(?);
  List_Output(Machine(Network),GrantRRights)==(?);
  List_Output(Machine(Network),RevokeRRights)==(?);
  List_Output(Machine(Network),GrantWRights)==(?);
  List_Output(Machine(Network),RevokeWRights)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Network),SetGender)==(SetGender(user,gender));
  List_Header(Machine(Network),SetAge)==(SetAge(user,age));
  List_Header(Machine(Network),SetPseudo)==(SetPseudo(user,pseudo));
  List_Header(Machine(Network),AddUser)==(AddUser(user,pwd,pseudo,gender,age));
  List_Header(Machine(Network),DeleteUser)==(DeleteUser(user));
  List_Header(Machine(Network),PublishContent)==(PublishContent(user,content));
  List_Header(Machine(Network),DeleteContent)==(DeleteContent(user,content));
  List_Header(Machine(Network),SetPrivateContent)==(SetPrivateContent(user,content));
  List_Header(Machine(Network),SetPublicContent)==(SetPublicContent(user,content));
  List_Header(Machine(Network),GrantRRights)==(GrantRRights(from,content,target));
  List_Header(Machine(Network),RevokeRRights)==(RevokeRRights(from,content,target));
  List_Header(Machine(Network),GrantWRights)==(GrantWRights(from,content,target));
  List_Header(Machine(Network),RevokeWRights)==(RevokeWRights(from,content,target))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Network),SetGender)==(user: users & gender: GENDERS);
  List_Precondition(Machine(Network),SetAge)==(user: users & age: NATURAL & age>=18);
  List_Precondition(Machine(Network),SetPseudo)==(user: users & user/=masterUser & pseudo: PSEUDOS & pseudo/:ran(pseudos));
  List_Precondition(Machine(Network),AddUser)==(user: USERS & user/:users & user/=masterUser & pwd: PASSWORDS & pwd/:ran(shadow) & pseudo: PSEUDOS & pseudo/:ran(pseudos) & gender: GENDERS & age: NATURAL & age>=18);
  List_Precondition(Machine(Network),DeleteUser)==(user: USERS & user: users & user/=masterUser);
  List_Precondition(Machine(Network),PublishContent)==(user: USERS & user: users & content: CONTENTS & content/:contents);
  List_Precondition(Machine(Network),DeleteContent)==(user: USERS & user: users & content: CONTENTS & content: contents & (getContentOwner(content) = user or user = masterUser));
  List_Precondition(Machine(Network),SetPrivateContent)==(user: USERS & user: users & content: CONTENTS & content: contents & (getContentOwner(content) = user or user = masterUser));
  List_Precondition(Machine(Network),SetPublicContent)==(user: USERS & user: users & content: CONTENTS & content: contents & (getContentOwner(content) = user or user = masterUser));
  List_Precondition(Machine(Network),GrantRRights)==(from: USERS & from: users & content: CONTENTS & content: contents & target: USERS & target: users & target/=from & (getContentOwner(content) = from or from = masterUser));
  List_Precondition(Machine(Network),RevokeRRights)==(from: USERS & from: users & content: CONTENTS & content: contents & target: USERS & target: users & target/=from & target/=masterUser & (getContentOwner(content) = from or from = masterUser));
  List_Precondition(Machine(Network),GrantWRights)==(from: USERS & from: users & content: CONTENTS & content: contents & target: USERS & target: users & target/=from & (getContentOwner(content) = from or from = masterUser));
  List_Precondition(Machine(Network),RevokeWRights)==(from: USERS & from: users & content: CONTENTS & content: contents & target: USERS & target: users & target/=from & target/=masterUser & (getContentOwner(content) = from or from = masterUser))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Network),RevokeWRights)==(from: USERS & from: users & content: CONTENTS & content: contents & target: USERS & target: users & target/=from & target/=masterUser & (getContentOwner(content) = from or from = masterUser) | hasRRights,hasWRights:=hasRRights-{content|->target},hasWRights-{content|->target});
  Expanded_List_Substitution(Machine(Network),GrantWRights)==(from: USERS & from: users & content: CONTENTS & content: contents & target: USERS & target: users & target/=from & (getContentOwner(content) = from or from = masterUser) | hasRRights,hasWRights:=hasRRights\/{content|->target},hasWRights\/{content|->target});
  Expanded_List_Substitution(Machine(Network),RevokeRRights)==(from: USERS & from: users & content: CONTENTS & content: contents & target: USERS & target: users & target/=from & target/=masterUser & (getContentOwner(content) = from or from = masterUser) | hasRRights:=hasRRights-{content|->target});
  Expanded_List_Substitution(Machine(Network),GrantRRights)==(from: USERS & from: users & content: CONTENTS & content: contents & target: USERS & target: users & target/=from & (getContentOwner(content) = from or from = masterUser) | hasRRights:=hasRRights\/{content|->target});
  Expanded_List_Substitution(Machine(Network),SetPublicContent)==(user: USERS & user: users & content: CONTENTS & content: contents & (getContentOwner(content) = user or user = masterUser) | privateContents:=privateContents-{content});
  Expanded_List_Substitution(Machine(Network),SetPrivateContent)==(user: USERS & user: users & content: CONTENTS & content: contents & (getContentOwner(content) = user or user = masterUser) | privateContents:=privateContents\/{content});
  Expanded_List_Substitution(Machine(Network),DeleteContent)==(user: USERS & user: users & content: CONTENTS & content: contents & (getContentOwner(content) = user or user = masterUser) | card(getContentOwner|>{user}) = 1 & user/=masterUser ==> users,loggedUsers,getGender,getAge,pseudos,shadow,contents,privateContents,getContentOwner,hasRRights,hasWRights:=users-{user},loggedUsers-{user},{user}<<|getGender,{user}<<|getAge,{user}<<|pseudos,{user}<<|shadow,contents-dom(getContentOwner|>{user}),privateContents-dom(getContentOwner|>{user}),getContentOwner|>>{user},dom(getContentOwner|>>{user})<|(hasRRights|>>{user}),dom(getContentOwner|>>{user})<|(hasWRights|>>{user}) [] not(card(getContentOwner|>{user}) = 1 & user/=masterUser) ==> contents,privateContents,getContentOwner,hasRRights,hasWRights:=contents-{content},privateContents-{content},{content}<<|getContentOwner,{content}<<|hasRRights,{content}<<|hasWRights);
  Expanded_List_Substitution(Machine(Network),PublishContent)==(user: USERS & user: users & content: CONTENTS & content/:contents | contents,getContentOwner,hasRRights,hasWRights:=contents\/{content},getContentOwner\/{content|->user},hasRRights\/{content|->user,content|->masterUser},hasWRights\/{content|->user,content|->masterUser});
  Expanded_List_Substitution(Machine(Network),DeleteUser)==(user: USERS & user: users & user/=masterUser | users,loggedUsers,getGender,getAge,pseudos,shadow,contents,privateContents,getContentOwner,hasRRights,hasWRights:=users-{user},loggedUsers-{user},{user}<<|getGender,{user}<<|getAge,{user}<<|pseudos,{user}<<|shadow,contents-dom(getContentOwner|>{user}),privateContents-dom(getContentOwner|>{user}),getContentOwner|>>{user},dom(getContentOwner|>>{user})<|(hasRRights|>>{user}),dom(getContentOwner|>>{user})<|(hasWRights|>>{user}));
  Expanded_List_Substitution(Machine(Network),AddUser)==(user: USERS & user/:users & user/=masterUser & pwd: PASSWORDS & pwd/:ran(shadow) & pseudo: PSEUDOS & pseudo/:ran(pseudos) & gender: GENDERS & age: NATURAL & age>=18 | users,shadow,pseudos,getGender,getAge:=users\/{user},shadow<+{user|->pwd},pseudos<+{user|->pseudo},getGender\/{user|->gender},getAge<+{user|->age});
  Expanded_List_Substitution(Machine(Network),SetPseudo)==(user: users & user/=masterUser & pseudo: PSEUDOS & pseudo/:ran(pseudos) | pseudos:=pseudos<+{user|->pseudo});
  Expanded_List_Substitution(Machine(Network),SetAge)==(user: users & age: NATURAL & age>=18 | getAge:=getAge<+{user|->age});
  Expanded_List_Substitution(Machine(Network),SetGender)==(user: users & gender: GENDERS | getGender:=getGender<+{user|->gender});
  List_Substitution(Machine(Network),SetGender)==(getGender:=getGender<+{user|->gender});
  List_Substitution(Machine(Network),SetAge)==(getAge:=getAge<+{user|->age});
  List_Substitution(Machine(Network),SetPseudo)==(pseudos:=pseudos<+{user|->pseudo});
  List_Substitution(Machine(Network),AddUser)==(users:=users\/{user} || shadow:=shadow<+{user|->pwd} || pseudos:=pseudos<+{user|->pseudo} || getGender:=getGender\/{user|->gender} || getAge:=getAge<+{user|->age});
  List_Substitution(Machine(Network),DeleteUser)==(users:=users-{user} || loggedUsers:=loggedUsers-{user} || getGender:={user}<<|getGender || getAge:={user}<<|getAge || pseudos:={user}<<|pseudos || shadow:={user}<<|shadow || contents:=contents-dom(getContentOwner|>{user}) || privateContents:=privateContents-dom(getContentOwner|>{user}) || getContentOwner:=getContentOwner|>>{user} || hasRRights:=dom(getContentOwner|>>{user})<|(hasRRights|>>{user}) || hasWRights:=dom(getContentOwner|>>{user})<|(hasWRights|>>{user}));
  List_Substitution(Machine(Network),PublishContent)==(contents:=contents\/{content} || getContentOwner:=getContentOwner\/{content|->user} || hasRRights:=hasRRights\/{content|->user,content|->masterUser} || hasWRights:=hasWRights\/{content|->user,content|->masterUser});
  List_Substitution(Machine(Network),DeleteContent)==(IF card(getContentOwner|>{user}) = 1 & user/=masterUser THEN users:=users-{user} || loggedUsers:=loggedUsers-{user} || getGender:={user}<<|getGender || getAge:={user}<<|getAge || pseudos:={user}<<|pseudos || shadow:={user}<<|shadow || contents:=contents-dom(getContentOwner|>{user}) || privateContents:=privateContents-dom(getContentOwner|>{user}) || getContentOwner:=getContentOwner|>>{user} || hasRRights:=dom(getContentOwner|>>{user})<|(hasRRights|>>{user}) || hasWRights:=dom(getContentOwner|>>{user})<|(hasWRights|>>{user}) ELSE contents:=contents-{content} || privateContents:=privateContents-{content} || getContentOwner:={content}<<|getContentOwner || hasRRights:={content}<<|hasRRights || hasWRights:={content}<<|hasWRights END);
  List_Substitution(Machine(Network),SetPrivateContent)==(privateContents:=privateContents\/{content});
  List_Substitution(Machine(Network),SetPublicContent)==(privateContents:=privateContents-{content});
  List_Substitution(Machine(Network),GrantRRights)==(hasRRights:=hasRRights\/{content|->target});
  List_Substitution(Machine(Network),RevokeRRights)==(hasRRights:=hasRRights-{content|->target});
  List_Substitution(Machine(Network),GrantWRights)==(hasRRights:=hasRRights\/{content|->target} || hasWRights:=hasWRights\/{content|->target});
  List_Substitution(Machine(Network),RevokeWRights)==(hasRRights:=hasRRights-{content|->target} || hasWRights:=hasWRights-{content|->target})
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
  List_Valuable_Sets(Machine(Network))==(USERS,PSEUDOS,CONTENTS,PASSWORDS);
  Inherited_List_Enumerated(Machine(Network))==(?);
  Inherited_List_Defered(Machine(Network))==(?);
  Inherited_List_Sets(Machine(Network))==(?);
  List_Enumerated(Machine(Network))==(GENDERS);
  List_Defered(Machine(Network))==(USERS,PSEUDOS,CONTENTS,PASSWORDS);
  List_Sets(Machine(Network))==(USERS,PSEUDOS,GENDERS,CONTENTS,PASSWORDS);
  Set_Definition(Machine(Network),PSEUDOS)==(?);
  Set_Definition(Machine(Network),GENDERS)==({MM,FF,NB});
  Set_Definition(Machine(Network),CONTENTS)==(?);
  Set_Definition(Machine(Network),PASSWORDS)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Network))==(?);
  Expanded_List_HiddenConstants(Machine(Network))==(?);
  List_HiddenConstants(Machine(Network))==(masterPassword,masterPseudo,masterUser);
  External_List_HiddenConstants(Machine(Network))==(masterPassword,masterPseudo,masterUser)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Network))==(btrue);
  Context_List_Properties(Machine(Network))==(btrue);
  Inherited_List_Properties(Machine(Network))==(btrue);
  List_Properties(Machine(Network))==(masterUser: USERS & masterPseudo: PSEUDOS & masterPassword: PASSWORDS & USERS: FIN(INTEGER) & not(USERS = {}) & PSEUDOS: FIN(INTEGER) & not(PSEUDOS = {}) & CONTENTS: FIN(INTEGER) & not(CONTENTS = {}) & PASSWORDS: FIN(INTEGER) & not(PASSWORDS = {}) & GENDERS: FIN(INTEGER) & not(GENDERS = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Network),SetGender)==(?);
  List_ANY_Var(Machine(Network),SetAge)==(?);
  List_ANY_Var(Machine(Network),SetPseudo)==(?);
  List_ANY_Var(Machine(Network),AddUser)==(?);
  List_ANY_Var(Machine(Network),DeleteUser)==(?);
  List_ANY_Var(Machine(Network),PublishContent)==(?);
  List_ANY_Var(Machine(Network),DeleteContent)==(?);
  List_ANY_Var(Machine(Network),SetPrivateContent)==(?);
  List_ANY_Var(Machine(Network),SetPublicContent)==(?);
  List_ANY_Var(Machine(Network),GrantRRights)==(?);
  List_ANY_Var(Machine(Network),RevokeRRights)==(?);
  List_ANY_Var(Machine(Network),GrantWRights)==(?);
  List_ANY_Var(Machine(Network),RevokeWRights)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Network)) == (USERS,PSEUDOS,GENDERS,CONTENTS,PASSWORDS,MM,FF,NB | ? | shadow,hasWRights,hasRRights,getAge,getGender,getContentOwner,pseudos,privateContents,contents,loggedUsers,users | ? | SetGender,SetAge,SetPseudo,AddUser,DeleteUser,PublishContent,DeleteContent,SetPrivateContent,SetPublicContent,GrantRRights,RevokeRRights,GrantWRights,RevokeWRights | ? | ? | ? | Network);
  List_Of_HiddenCst_Ids(Machine(Network)) == (masterPassword,masterPseudo,masterUser | ?);
  List_Of_VisibleCst_Ids(Machine(Network)) == (?);
  List_Of_VisibleVar_Ids(Machine(Network)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Network)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Network)) == (Type(USERS) == Cst(SetOf(atype(USERS,"[USERS","]USERS")));Type(PSEUDOS) == Cst(SetOf(atype(PSEUDOS,"[PSEUDOS","]PSEUDOS")));Type(GENDERS) == Cst(SetOf(etype(GENDERS,0,2)));Type(CONTENTS) == Cst(SetOf(atype(CONTENTS,"[CONTENTS","]CONTENTS")));Type(PASSWORDS) == Cst(SetOf(atype(PASSWORDS,"[PASSWORDS","]PASSWORDS"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Network)) == (Type(MM) == Cst(etype(GENDERS,0,2));Type(FF) == Cst(etype(GENDERS,0,2));Type(NB) == Cst(etype(GENDERS,0,2)))
END
&
THEORY HiddenConstantsEnvX IS
  HiddenConstants(Machine(Network)) == (Type(masterPassword) == HCst(atype(PASSWORDS,?,?));Type(masterPseudo) == HCst(atype(PSEUDOS,?,?));Type(masterUser) == HCst(atype(USERS,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Network)) == (Type(shadow) == Mvl(SetOf(atype(USERS,?,?)*atype(PASSWORDS,"[PASSWORDS","]PASSWORDS")));Type(hasWRights) == Mvl(SetOf(atype(CONTENTS,?,?)*atype(USERS,?,?)));Type(hasRRights) == Mvl(SetOf(atype(CONTENTS,?,?)*atype(USERS,?,?)));Type(getAge) == Mvl(SetOf(atype(USERS,?,?)*btype(INTEGER,?,?)));Type(getGender) == Mvl(SetOf(atype(USERS,?,?)*etype(GENDERS,0,2)));Type(getContentOwner) == Mvl(SetOf(atype(CONTENTS,?,?)*atype(USERS,?,?)));Type(pseudos) == Mvl(SetOf(atype(USERS,?,?)*atype(PSEUDOS,"[PSEUDOS","]PSEUDOS")));Type(privateContents) == Mvl(SetOf(atype(CONTENTS,?,?)));Type(contents) == Mvl(SetOf(atype(CONTENTS,?,?)));Type(loggedUsers) == Mvl(SetOf(atype(USERS,?,?)));Type(users) == Mvl(SetOf(atype(USERS,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Network)) == (Type(RevokeWRights) == Cst(No_type,atype(USERS,?,?)*atype(CONTENTS,?,?)*atype(USERS,?,?));Type(GrantWRights) == Cst(No_type,atype(USERS,?,?)*atype(CONTENTS,?,?)*atype(USERS,?,?));Type(RevokeRRights) == Cst(No_type,atype(USERS,?,?)*atype(CONTENTS,?,?)*atype(USERS,?,?));Type(GrantRRights) == Cst(No_type,atype(USERS,?,?)*atype(CONTENTS,?,?)*atype(USERS,?,?));Type(SetPublicContent) == Cst(No_type,atype(USERS,?,?)*atype(CONTENTS,?,?));Type(SetPrivateContent) == Cst(No_type,atype(USERS,?,?)*atype(CONTENTS,?,?));Type(DeleteContent) == Cst(No_type,atype(USERS,?,?)*atype(CONTENTS,?,?));Type(PublishContent) == Cst(No_type,atype(USERS,?,?)*atype(CONTENTS,?,?));Type(DeleteUser) == Cst(No_type,atype(USERS,?,?));Type(AddUser) == Cst(No_type,atype(USERS,?,?)*atype(PASSWORDS,?,?)*atype(PSEUDOS,?,?)*etype(GENDERS,?,?)*btype(INTEGER,?,?));Type(SetPseudo) == Cst(No_type,atype(USERS,?,?)*atype(PSEUDOS,?,?));Type(SetAge) == Cst(No_type,atype(USERS,?,?)*btype(INTEGER,?,?));Type(SetGender) == Cst(No_type,atype(USERS,?,?)*etype(GENDERS,?,?)))
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
