(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* ::Input::Initialization:: *)
BeginPackage["QNMspectral`"];


(* ::Input::Initialization:: *)
GetModes::usage ="GetModes[\!\(\*
StyleBox[\"equation\",\nFontSlant->\"Italic\"]\),{\!\(\*
StyleBox[\"N\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\",\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\"prec\",\nFontSlant->\"Italic\"]\)}] computes the quasinormal mode spectrum of \!\(\*
StyleBox[\"equation\",\nFontSlant->\"Italic\"]\) using a spectral grid of \!\(\*
StyleBox[\"N\",\nFontSlant->\"Italic\"]\)+1 points with \!\(\*
StyleBox[\"prec\",\nFontSlant->\"Italic\"]\) digits of precision.";
GetAccurateModes::usage = "GetAccurateModes[\!\(\*
StyleBox[\"equation\",\nFontSlant->\"Italic\"]\),{\!\(\*
StyleBox[\"N1\",\nFontSlant->\"Italic\"]\),\!\(\*
StyleBox[\"prec1\",\nFontSlant->\"Italic\"]\)},{\!\(\*
StyleBox[\"N2\",\nFontSlant->\"Italic\"]\),\!\(\*
StyleBox[\"prec2\",\nFontSlant->\"Italic\"]\)}] computes the quasinormal mode spectrum using GetModes with two different grid sizes and precisions specified by {\!\(\*
StyleBox[\"N1\",\nFontSlant->\"Italic\"]\),\!\(\*
StyleBox[\"prec1\",\nFontSlant->\"Italic\"]\)} and {\!\(\*
StyleBox[\"N2\",\nFontSlant->\"Italic\"]\),\!\(\*
StyleBox[\"prec2\",\nFontSlant->\"Italic\"]\)} returning only those digits which are the same for both.";
PlotFrequencies::usage = "PlotFrequencies[\!\(\*
StyleBox[\"modes\",\nFontSlant->\"Italic\"]\)] plots the quasinormal mode frequencies contained in \!\(\*
StyleBox[\"modes\",\nFontSlant->\"Italic\"]\) on the complex plane.";
MakeTable::usage = "MakeTable[\!\(\*
StyleBox[\"modes\",\nFontSlant->\"Italic\"]\)] creates a table of quasinormal mode frequencies.";
ShowModes::usage = "ShowModes[\!\(\*
StyleBox[\"modes\",\nFontSlant->\"Italic\"]\)] gives a plot and a table of the quasinormal modes contained in \!\(\*
StyleBox[\"modes\",\nFontSlant->\"Italic\"]\).";
PlotEigenfunctions::usage = "PlotEigenfunctions[\!\(\*
StyleBox[\"modes\",\nFontSlant->\"Italic\"]\)] plots the eigenfunctions contained in \!\(\*
StyleBox[\"modes\",\nFontSlant->\"Italic\"]\).";
FitFunction::usage = "FitFunction[\!\(\*
StyleBox[\"modes\",\nFontSlant->\"Italic\"]\),\!\(\*
StyleBox[\"f\",\nFontSlant->\"Italic\"]\)] fits the eigenfunctions in \!\(\*
StyleBox[\"modes\",\nFontSlant->\"Italic\"]\) to the function \!\(\*
StyleBox[\"f\",\nFontSlant->\"Italic\"]\).";
PlotFit::usage = "PlotFit[\!\(\*
StyleBox[\"fit\",\nFontSlant->\"Italic\"]\)] plots the time evolution of the \!\(\*
StyleBox[\"fit\",\nFontSlant->\"Italic\"]\) as given by the corresponding quasinormal modes.";

FilterEigenfunctions::usage = "Deletes modes whose eigenfunction is not smooth, finite and nonzero.";
FilterModes::usage="Deletes any modes with imaginary part exactly equal to zero."


(* ::Input::Initialization:: *)
analyzeEquation::usage = "analyzeEquation[\!\(\*
StyleBox[\"equation\",\nFontSlant->\"Italic\"]\)] extracts all the information needed for the computation.";
computeMatrix::usage = "computeMatrix[\!\(\*
StyleBox[\"analyzedEquation\",\nFontSlant->\"Italic\"]\),{\!\(\*
StyleBox[\"N\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\",\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\"p\",\nFontSlant->\"Italic\"]\)}], where \!\(\*
StyleBox[\"analyzedEquation\",\nFontSlant->\"Italic\"]\) is the output of analyzeEquation, computes the matrix discretizing the equation, with a grid of \!\(\*
StyleBox[\"N\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\"+\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\"1\",\nFontSlant->\"Italic\"]\) points using \!\(\*
StyleBox[\"p\",\nFontSlant->\"Italic\"]\) digits of precision. Output is as a first argument the spectral grid, and as second argument a list of the matrix coefficients of the powers of the frequency.";
computeLinearMatrix::usage="computeLinearMatrix[\!\(\*
StyleBox[\"matrixList\",\nFontSlant->\"Italic\"]\)], where \!\(\*
StyleBox[\"matrixList\",\nFontSlant->\"Italic\"]\) is the second part of the output of computeMatrix, rearranges the matrices into two possibly bigger matrices linearizing the equation in the frequency.";
reorganize::usage="reorganize[\!\(\*
StyleBox[\"eigensyst\",\nFontSlant->\"Italic\"]\),\!\(\*
StyleBox[\"grid\",\nFontSlant->\"Italic\"]\),\!\(\*
StyleBox[\"Neqs\",\nFontSlant->\"Italic\"]\)], where \!\(\*
StyleBox[\"eigensyst\",\nFontSlant->\"Italic\"]\) is the output of applying either Eigenvalues or Eigensystem to the output of computeLinearMatrix, \!\(\*
StyleBox[\"grid\",\nFontSlant->\"Italic\"]\) is the spectral grid and \!\(\*
StyleBox[\"Neqs\",\nFontSlant->\"Italic\"]\) is the number of equations that were solved, rearranges the results, matching the eigenfunctions to the eigenvalues, normalizing them, and sorting by imaginary part of the eigenvalues.";

sameModes::usage="Internal function used by GetAccurateModes. SameModes[\!\(\*
StyleBox[\"modes1\",\nFontSlant->\"Italic\"]\),\!\(\*
StyleBox[\"modes2\",\nFontSlant->\"Italic\"]\)] compares two lists of modes and returns those that occur in both lists.";
detFunction::usage = "Internal function used for sweeping.";


(* ::Input::Initialization:: *)
$QNMMemory::usage = "Global option that determines whether or not results are saved in GetModes (True by default).";
$QNMQuiet::usage="Global option that determines whether anything is printed (False by default).";


(* ::Input::Initialization:: *)
Horizon::usage="Option for GetModes that specifies the location of the horizon (defaults to 1).";
Eigenfunctions::usage="Option for GetModes that specifies whether or not to compute the eigenfunctions (defaults to False).";
NumericalBackground::usage="Option for GetModes that allows to specify numerical background functions directly as values on the same spectral grid.";


(* ::Input::Initialization:: *)
Protect@@{Horizon,Eigenfunctions,Method,NumericalBackground,SweepGrid,Parallel,Plot,Quiet,Cutoff,NModes,Precision,FunctionNumber,Rescale,RealCutoff,FrequencySign,tMax,GridPoint,Rescale,RescaleFrequency,Name,Conjugates,ConjugateCutoff};


(* ::Input::Initialization:: *)
Begin["`Private`"];


(* ::Input::Initialization:: *)
paQ=Developer`PackedArrayQ;
topa=Developer`ToPackedArray;
format[expr_]:=If[$MinPrecision<=$MachinePrecision//TrueQ,expr//N//topa,(expr//(SetPrecision[#,$MinPrecision]&))/. 0 ->SetAccuracy[0,$MinPrecision]]


(* ::Input::Initialization:: *)
Attributes[catchError]=Attributes[throwError]={HoldAll};
catchError[expr_,returnLocation___]:=Catch[expr,$Failed,Return[#1,returnLocation]&]
throwError[message_,messageArguments___]:=(Message[message,messageArguments];Throw[$Failed,$Failed])


(* ::Input::Initialization:: *)
printIf[expr_]:=If[Not@$QNMQuiet,Print[expr]]
printTemporaryIf[expr_]:=If[Not@$QNMQuiet,PrintTemporary[expr]]


(* ::Input::Initialization:: *)
coefficientToMatrixC=Compile[{{vecList,_Complex,2},{matList,_Real,3}},Total[vecList*matList],CompilationTarget->"C"];
freqToMatrixC=Compile[{{freqList,_Complex,1},{matList,_Complex,3}},Total[freqList*matList],CompilationTarget->"C"];


(* ::Input::Initialization:: *)
$QNMMemory=True;
$QNMQuiet=False;


(* ::Input::Initialization:: *)
Options[GetModes]={Horizon->1,Eigenfunctions->False,Method->"Direct",NumericalBackground->False,SweepGrid->{{-1,5,10^-1},{-5,1,10^-1}},Parallel->False,Plot->False,Quiet->False};
GetModes[equation_,{order_},opts : OptionsPattern[]]:=GetModes[equation,{order,order/2},opts]
GetModes[equation_,{order_,precision_ },opts : OptionsPattern[]]:=
Block[{method=OptionValue[Method],hor=OptionValue[Horizon],numBG=OptionValue[NumericalBackground],quiet=OptionValue[Quiet],eigenfuncts=OptionValue[Eigenfunctions],
eqn,Neqs,functs,var,\[Omega],bgfuncts,maxder,maxpower,
grid,Mcoeffs,
computeEigensyst,eigensyst,
result},

catchError[{eqn,Neqs,functs,var,\[Omega],bgfuncts,maxder,maxpower}=analyzeEquation[equation,numBG,order],Block];

If[method=!="Sweep"&&quiet==False,\[Omega]powerMessage[maxpower,Neqs,order]];

{grid,Mcoeffs}=computeMatrix[eqn,Neqs,functs,var,\[Omega],bgfuncts,maxder,{order,precision},hor];
Sow[{grid,Mcoeffs,Neqs},"Mcoeffs"];

computeEigensyst=catchError[Switch[method,
"Direct",direct,
"Sweep",sweep[##,order,OptionValue[SweepGrid],OptionValue[Parallel],OptionValue[Plot]]&,
_,throwError[GetModes::method,ToString@method]],Block];

eigensyst=catchError[computeEigensyst[Mcoeffs,precision,maxpower,eigenfuncts],Block];

result=reorganize[eigensyst,grid,Neqs];

If[TrueQ@$QNMMemory,
GetModes[equation,{order,precision},opts]=result;
eigenfunctionData[equation,{order,precision},opts]={grid,Mcoeffs,Neqs};
];

result
]


(* ::Input::Initialization:: *)
GetModes::method="Unknown Method `1`.";


(* ::Input::Initialization:: *)
analyzeEquation[equation_,numBG_ : False,order_ : False]:=Block[{eqn=equation/.(a_==b_:>a-b)//Expand,Neqs,functs,var,\[Omega],bgfuncts,maxpower,maxder},
If[Head[eqn]=!=List,eqn={eqn}];

With[{symbols=Union@Cases[eqn,s_Symbol/;Not@NumericQ[s],\[Infinity]]},
If[Length[symbols]>2,throwError[analyzeEquation::manysymb,ToString@symbols]];
If[Length[symbols]<2,throwError[analyzeEquation::fewsymb,ToString@symbols]];
];

var=Union[Cases[eqn,f_Symbol[z_Symbol]:>z,\[Infinity]],Cases[eqn,
\!\(\*SuperscriptBox[\(f_Symbol\), 
TagBox[
RowBox[{"(", "n_", ")"}],
Derivative],
MultilineFunction->None]\)[z_Symbol]:>z,\[Infinity]]]//Last;
\[Omega]=Union@Cases[equation,_Symbol,\[Infinity]]//DeleteCases[#,var]&//Last;

(* Check which functions are background functions supplied with their value on the grid, and if it is done correctly (check if length equals length of grid) *)
bgfuncts=If[numBG===False,{},
If[Not@(And@@(Length[#[[2]]]==order+1&)/@numBG),throwError[analyzeEquation::bg],
numBG/.(f_Symbol[var]->values_List):>(f->values)]];

functs=Complement[Union[Cases[equation,f_Symbol[var]/;Context[f]=!="System`":> f,\[Infinity]]~Join~Cases[equation,
\!\(\*SuperscriptBox[\(f_Symbol\), 
TagBox[
RowBox[{"(", "_", ")"}],
Derivative],
MultilineFunction->None]\)[var]:>f,\[Infinity]]],bgfuncts[[All,1]]];

Neqs=Length[eqn];
If[Neqs<Length[functs],throwError[analyzeEquation::manyfcts,ToString@functs]];
If[Neqs>Length[functs],throwError[analyzeEquation::fewfcts,ToString@functs]];

maxpower=Cases[eqn,\[Omega]^(pow_ : 1):>pow,\[Infinity]]//Max;
maxder=(Cases[eqn,
\!\(\*SuperscriptBox[\(f_\), 
TagBox[
RowBox[{"(", "n_", ")"}],
Derivative],
MultilineFunction->None]\)[var]:>n/;Intersection[{f},functs]!={},\[Infinity]]//Max)/.-\[Infinity]->0;

{eqn,Neqs,functs,var,\[Omega],bgfuncts,maxder,maxpower}
]


(* ::Input::Initialization:: *)
analyzeEquation::manysymb="Too many symbols in equation, symbols found: `1`.";
analyzeEquation::fewsymb="Too few symbols in equation, symbols found: `1`.";
analyzeEquation::bg="Background not given as values evaluated on grid of same size.";
analyzeEquation::manyfcts="More functions than equations, functions found: `1`.";
analyzeEquation::fewfcts="More equations than functions, functions found: `1`.";


(* ::Input::Initialization:: *)
\[Omega]powerMessage[maxpower_,Neqs_,order_]:=Switch[{Neqs,maxpower},
{1,1},0,
{1,_},printTemporaryIf["Equation depending on frequency to power "<>ToString[maxpower]<>", computing with matrix of size "<>ToString[(order+1)maxpower]<>" ("<>ToString[maxpower]<>" times the gridsize)."];,
{_,1},
printTemporaryIf["System of "<>ToString[Neqs]<>" coupled equations, computing with matrix of size "<>ToString[(order+1)Neqs]<>" ("<>ToString[Neqs]<>" times the gridsize)."];,
{_,_},
printTemporaryIf["System of "<>ToString[Neqs]<>" coupled equations depending on frequency to power "<>ToString[maxpower]<>", computing with matrix of size "<>ToString[maxpower Neqs (order+1)]<>" ("<>ToString[Neqs maxpower]<>" times the gridsize)."]];



(* ::Input::Initialization:: *)
computeMatrix[equation_,Neqs_,functs_,var_,\[Omega]_,numBG_,maxder_,{order_,precision_},hor_ ]:=Block[{grid,der,coeffs,coeffsEval,M\[Omega]List},

coeffs=coefficients[equation,functs,var,\[Omega],maxder];

makeSpectralGrid[{grid,der},{order,precision,hor}];

coeffsEval=evaluateCoefficients[coeffs,grid,der,var,numBG,precision];

M\[Omega]List=coeffsToMatrix[coeffsEval,der,maxder,Neqs,precision];

{grid,M\[Omega]List}
]

computeMatrix[{equation_,Neqs_,functs_,var_,\[Omega]_,bgfuncts_,maxder_,maxpower_},{order_,precision_}, hor_ : 1]:=
computeMatrix[equation,Neqs,functs,var,\[Omega],{},maxder,{order,precision},hor ] (* for easy manual use, e.g. debugging, first list is the output of analyzeEquation *)


(* ::Input::Initialization:: *)
coefficients[equation_,functs_,var_,\[Omega]_,maxder_]:=Block[{\[Omega]coeffs,functsAndDers},
\[Omega]coeffs=CoefficientList[equation,\[Omega]]//PadRight;

functsAndDers=Table[
\!\(\*SuperscriptBox[\(#1\), 
TagBox[
RowBox[{"(", "i", ")"}],
Derivative],
MultilineFunction->None]\)[var],{i,0,maxder}]&/@functs//Flatten;

Map[Coefficient[#,functsAndDers]&,\[Omega]coeffs,{2}]//Transpose
]


(* ::Input::Initialization:: *)
Attributes[makeSpectralGrid]={HoldFirst};
makeSpectralGrid[{grid_Symbol,der_Symbol},{order_Integer,prec_?NumericQ,hor_ : 1 }]/;NumericQ[hor]:=Block[{$MinPrecision=prec},
grid=Rescale[Cos[\[Pi]/order format@Range[0,order]],{-1,1},{0,hor}] //format;
der[0]=IdentityMatrix[order+1]//format;(* Note there is a bug with the function below, using ["DifferentiationMatrix"] gives a wrong last column *)
der[n_]:=der[n]=(-1)^n NDSolve`FiniteDifferenceDerivative[n,grid//Reverse,DifferenceOrder->"Pseudospectral"]/@IdentityMatrix[order+1]//Transpose;
]


(* ::Input::Initialization:: *)
evaluateCoefficients[coeffs_,grid_,der_,var_,numBG_,precision_]:=Block[{$MinPrecision=Max[precision,$MachinePrecision],maxderBG,replace,idVec},
maxderBG=Cases[coeffs,
\!\(\*SuperscriptBox[\(f_\), 
TagBox[
RowBox[{"(", "n_", ")"}],
Derivative],
MultilineFunction->None]\)[var]:>n,\[Infinity]]//Max;

replace=If[numBG=!={},Flatten[Table[
\!\(\*SuperscriptBox[\(f\[LeftDoubleBracket]1\[RightDoubleBracket]\), 
TagBox[
RowBox[{"(", "n", ")"}],
Derivative],
MultilineFunction->None]\)[var]->der[n].f[[2]],{f,format@numBG},{n,0,maxderBG}],1],{}]~Join~{var->grid};

idVec=Table[1,{Length@grid}]//format;
Map[idVec*#&,coeffs/.replace,{3}]
]


(* ::Input::Initialization:: *)
coeffsToMatrix[coeffs_,der_,maxder_,Neqs_,precision_]:=Block[{$MinPrecision=Max[precision,$MachinePrecision],Nfuncts=Neqs,Mpart,ders,coeffToMatFunc},
Mpart=Map[First[Partition[Partition[#,maxder+1],Nfuncts]]&,coeffs,{2}];

ders=der/@Range[0,maxder];

coeffToMatFunc=If[$MinPrecision<=$MachinePrecision,coefficientToMatrixC,{vs,ms}\[Function]Total[vs*ms]];
ArrayFlatten/@Map[coeffToMatFunc[# , ders]&,Mpart,{3}]//If[$MinPrecision<=$MachinePrecision,#+0.0I,#]&//format
]


(* ::Input::Initialization:: *)
direct[Mcoeffs_,precision_,maxpower_,eigenfuncts_]:=Block[{\[Alpha],\[Beta]},
{\[Alpha],\[Beta]}=computeLinearMatrix[Mcoeffs,precision,maxpower];

If[TrueQ@eigenfuncts,Eigensystem[{\[Alpha],\[Beta]}],Eigenvalues[{\[Alpha],\[Beta]}]]
]


(* ::Input::Initialization:: *)
computeLinearMatrix[Mcoeffs_]:=computeLinearMatrix[Mcoeffs,Precision@Mcoeffs[[1]],Length[Mcoeffs]-1] (* to use manually, for debugging *)
computeLinearMatrix[Mcoeffs_,precision_,maxpower_]:=
Block[{$MinPrecision=Max[precision,$MachinePrecision],
\[Alpha],\[Beta],mat0=0 IdentityMatrix[Length@First[Mcoeffs]],mat1=IdentityMatrix[Length@First[Mcoeffs]]},

If[maxpower==1,\[Alpha]=Mcoeffs[[0+1]];\[Beta]=-Mcoeffs[[1+1]];,
\[Alpha]=Table[If[i==0,Mcoeffs[[j+1]],If[i==j,mat1,mat0]],{i,0,maxpower-1},{j,0,maxpower-1}]//ArrayFlatten;
\[Beta]=Table[If[i==0&&j==maxpower-1,-Mcoeffs[[maxpower+1]],If[i==j+1,mat1,mat0]],{i,0,maxpower-1},{j,0,maxpower-1}]//ArrayFlatten;];

\[Alpha]=\[Alpha]+If[$MinPrecision<$MachinePrecision,0. I,0]//format; 
\[Beta]=\[Beta]+If[$MinPrecision<$MachinePrecision,0. I,0]//format;

{\[Alpha],\[Beta]}
]


(* ::Input::Initialization:: *)
sweep[Mcoeffs_,precision_,maxpower_,eigenfuncts_,order_,sweepGrid_,parallel_,plot_]:=Block[{$MinPrecision=Max[precision,$MachinePrecision],
eigensyst0,detf,
\[Omega]ReMin,\[Omega]ReMax,\[Delta]\[Omega]Re,\[Omega]ImMin,\[Omega]ImMax,\[Delta]\[Omega]Im,
\[Omega]grid,detgrid,\[Omega]detgrid,\[Omega]ReVals,\[Omega]ImVals,\[Omega]DetVals,neighbors,tests,count,map,
eigenvalues,eigenvectors,
M,\[Omega]},
If[MatchQ[sweepGrid,{{_?NumericQ,_?NumericQ,_?NumericQ},{_?NumericQ,_?NumericQ,_?NumericQ}}]//TrueQ,
{{\[Omega]ReMin,\[Omega]ReMax,\[Delta]\[Omega]Re},{\[Omega]ImMin,\[Omega]ImMax,\[Delta]\[Omega]Im}}=sweepGrid//format,
throwError[sweep::grid]];
\[Omega]grid=Table[a+b I,{a,\[Omega]ReMin,\[Omega]ReMax,\[Delta]\[Omega]Re},{b,\[Omega]ImMin,\[Omega]ImMax,\[Delta]\[Omega]Im}]//Flatten[#,1]&//format;

detf=detFunction[Mcoeffs];

count=0;
If[TrueQ@parallel,SetSharedVariable[count];DistributeDefinitions[detf];map=ParallelMap;ParallelEvaluate[detf=detf;];,map=Map;
];(* Note: this isn't working properly, actually slows things down alot*)
\[Omega]detgrid=Monitor[(*If[TrueQ@parallel,ParallelMap,Map]*)map[{Re[#],Im[#],count++;Quiet[detf[#],LinearSolve::luc]}&,\[Omega]grid],
{ProgressIndicator[count,{0,Length@\[Omega]grid}],ToString[count]<>"/"<>ToString[Length@\[Omega]grid]}];
(* slightly faster, but without progress indicator *)
(*detgrid=Quiet[detf[\[Omega]grid],LinearSolve::luc];
\[Omega]detgrid=MapThread[Append,{\[Omega]grid/.Complex[a_,b_]\[RuleDelayed]{a,b},detgrid}];*)

If[TrueQ@plot,printIf[Show[ListContourPlot[\[Omega]detgrid,FrameLabel->{"Re \[Omega]","Im \[Omega]"}],ListPlot[\[Omega]detgrid[[All,1;;2]],PlotStyle->Red]]]];

neighbors=List@@@DelaunayMesh[\[Omega]detgrid[[All,1;;2]]]["VertexVertexConnectivityRules"];
{\[Omega]ReVals,\[Omega]ImVals,\[Omega]DetVals}=Transpose[\[Omega]detgrid];
tests=And@@Thread[\[Omega]DetVals[[#1]]<\[Omega]DetVals[[#2]]&&\[Omega]ReMin<\[Omega]ReVals[[#1]]<\[Omega]ReMax&&\[Omega]ImMin<\[Omega]ImVals[[#1]]<\[Omega]ImMax]&@@@neighbors;

eigenvalues=#[[1]]+I #[[2]]&/@Pick[\[Omega]detgrid[[All,1;;2]],tests];
If[TrueQ@eigenfuncts,
eigenvectors=(Eigensystem[M/.\[Omega]->#,-1][[2,1]]&)/@eigenvalues; 
{eigenvalues,eigenvectors},
eigenvalues]
]


(* ::Input::Initialization:: *)
sweep::grid="Grid should be of the form {{\[Omega]ReMin,\[Omega]ReMax,\[Delta]\[Omega]Re},{\[Omega]ImMin,\[Omega]ImMax,\[Delta]\[Omega]Im}} .";


(* ::Input::Initialization:: *)
detFunction[M0_List]:=Block[{$MinPrecision=Quiet[Max[Precision@M0,$MachinePrecision],Precision::mnprec],\[Omega]},
With[{Mpref=\[Omega]^Range[0,Length[M0]-1]//format,dMpref=Range[1,Length[M0]-1]\[Omega]^Range[0,Length[M0]-2]//format},

Hold[{{\[Omega],_Complex,0}},
Module[{M=Total[Mpref*M0],dM=Total[dMpref*Rest[M0]]},
1/Abs[Tr@LinearSolve[M,dM]]
]
,CompilationOptions->{"InlineExternalDefinitions"->True},RuntimeAttributes->{Listable}]/.Hold[args_,code_,opts__]:>If[$MinPrecision<=$MachinePrecision,Compile[args,code,opts],Function[Evaluate@(First/@args),code]]

]]


(* ::Input::Initialization:: *)
reorganize[eigensyst0_,grid_,Neqs_]:=Block[{order=Length[grid]-1,eigensyst,eigensystFormatted},

If[Length[Dimensions@eigensyst0]==1,
Return[eigensyst0//Select[#,NumericQ]&//SortBy[#,-Im[#]-10^-10 Re[#]&]&]
];

eigensyst=Transpose[eigensyst0]//Select[#,NumericQ[#[[1]]]&]&//SortBy[#,-Im[#[[1]]]&]&;

eigensystFormatted=formatEigenfunctions[eigensyst,grid,Neqs]
]


(* ::Input::Initialization:: *)
formatEigenfunctions[eigensyst_,grid_,Neqs_]:=Block[{order=Length[grid]-1,freqs,evecs,evecsUnique,evecsSorted,evecsNormalized,evecsGrid},
{freqs,evecs}=Transpose[eigensyst];

evecsUnique=Take[Transpose[evecs],Neqs (order+1)]; 
evecsSorted=Transpose[Partition[evecsUnique,(order+1)],{2,3,1}]; 
evecsNormalized=Map[If[Max[Abs@#]>10^-10&&Norm[First@#]>0,Conjugate[First@#]/Norm[First@#]^2,1]#&,evecsSorted,{2}];
evecsGrid=Map[Transpose[{grid,#}]&,evecsNormalized,{2}];

Transpose[{freqs,evecsGrid}]
]


(* ::Input::Initialization:: *)
Options[GetAccurateModes]={Cutoff->1,FilterEigenfunctions->False,FilterModes->False};
GetAccurateModes[equation_,{N1_,M1_  : "default",opts1___},{N2_,M2_  : "default",opts2___},opts:OptionsPattern[{GetAccurateModes,GetModes}]]:=Block[
{prec1=M1/."default"->N1/2,prec2=M2/."default"->N2/2,filtermds=OptionValue[FilterModes],filterEfs=OptionValue[FilterEigenfunctions],efs=OptionValue[Eigenfunctions],
Npmax,Npmin,optsmin,optsmax,modesMax,modesMin,samemodes,
reap,grid,matrices,Neqs},

If[TrueQ@(filterEfs&&Not[efs]),efs=True];

{Npmin,Npmax}=SortBy[{{N1,prec1},{N2,prec2}},First];
If[Npmax=={N1,M1},optsmax=opts1;optsmin=opts2;,optsmax=opts2;optsmin=opts1;];

reap=Reap[modesMax=GetModes[equation,Npmax,filterOpts[{optsmax},{opts}]],"Mcoeffs"];
modesMin=GetModes[equation,Npmin,filterOpts[{optsmin},{opts}]];

{grid,matrices,Neqs}=If[Length[Dimensions@reap[[2]]]>=2,reap[[2,1,1]],eigenfunctionData[equation,Npmax,filterOpts[{optsmax},{opts}]]];

samemodes=sameModes[modesMax,modesMin,OptionValue[Cutoff]]//If[filtermds,FilterModes[#],#]&;

If[efs==="Later",samemodes=ComputeEigenfunctions[{grid,matrices,Neqs},samemodes]];

samemodes//If[filterEfs,FilterEigenfunctions[#],#]&
]


(* ::Input::Initialization:: *)
filterOpts[{opts1___},{opts___}]:=FilterRules[{opts1,opts},Options[GetModes]]/.HoldPattern[Eigenfunctions->"Later"]->Sequence[]/.{}->Sequence[]


(* ::Input::Initialization:: *)
sameModes[modes1_,modes2_,cutoff_ : 1]:=Block[{modesMax,modesMin,prec1=Precision[modes1],prec2=Precision[modes2],agreedModes1,agreedModes2},
{modesMax,modesMin}=Sort[{modes1,modes2},Length[#1]>Length[#2]&];

agreedModes1=Cases[modesMax,(mode_/;minDiff[modesMin][mode]<10^-cutoff)];

catchError[If[agreedModes1==={},throwError[sameModes::noconvergedmodes,cutoff]],Block];

agreedModes2=(-Floor@Log[10,Abs@minDiff[modesMin][#]])/.{Indeterminate->#,prec_:>SetPrecision[#,prec]}&/@agreedModes1;

agreedModes2//If[Length[#[[1]]]==0,SortBy[#,(-Im[#1]&)],SortBy[#,(-Im[First@#1]&)]]&
]


(* ::Input::Initialization:: *)
sameModes::noconvergedmodes="No modes found that agree up to order \!\(\*SuperscriptBox[\(10\), \(-`1`\)]\)";


(* ::Input::Initialization:: *)
minDiff[refmodes_][singleMode_]:=If[Length[singleMode]==0,
Abs[MinimalBy[Abs][(#-refmodes)]&[singleMode]]//Last,
Abs[MinimalBy[Abs][(#-refmodes[[All,1]])]&[singleMode[[1]]]]//Last]


(* ::Input::Initialization:: *)
FilterModes[modes_]:=Block[{crit=If[eigenfunctionsQ@modes,(Im[#[[1]]]=!=0&),(Im[#]=!=0&)]},Select[modes,crit]]


(* ::Input::Initialization:: *)
convQ[ef_]:=Abs[ef[[-2,2]]]<1
smoothQ[ef_]:=Count[ef[[All,2]]//Re//Sign//Split,x_/;Length[x]==1]<5&&Count[ef[[All,2]]//Im//Chop//Sign//Split,x_/;Length[x]==1]<5
nonzeroQ[ef_]:=Length[ef]-Count[ef[[All,2]],0]>5

FilterEigenfunctions[modes_?eigenfunctionsQ,test_Function : (convQ[#]&&smoothQ[#]&&nonzeroQ[#]&)]:=Select[modes,And@@(test/@#[[2]])&]
FilterEigenfunctions[modes_,test_Function : None]:=Message[FilterEigenfunctions::efcomputed]
FilterEigenfunctions[modes_?eigenfunctionsQ,test_]:=Message[FilterEigenfunctions::test]


(* ::Input::Initialization:: *)
FilterEigenfunctions::efcomputed="Eigenfunctions not computed, use option Eigenfunctions -> True in GetModes.";
FilterEigenfunctions::test="Second argument should be a pure function.";


(* ::Input::Initialization:: *)
Options[ComputeEigenfunctions]={Horizon->1,NumericalBackground->False,Quiet->False};

ComputeEigenfunctions[equation_,\[Omega]list_,{N_,p_},opts : OptionsPattern[]]:=Block[{grid,matrices,Neqs,$MinPrecision=Max[$MachinePrecision,p],result},
{grid,matrices,Neqs}=GetModes[equation,{N,p},ReturnMatrices->True,opts];

If[TrueQ@$QNMMemory,
ComputeEigenfunctions[equation,\[Omega]list,{N,p},opts ]=Block[{$QNMMemory=False},ComputeEigenfunctions[{grid,matrices,Neqs},\[Omega]list//format]],
ComputeEigenfunctions[{grid,matrices,Neqs},\[Omega]list//format]]
]

ComputeEigenfunctions[{grid_,matrices_,Neqs_},\[Omega]_?NumericQ]:=ComputeEigenfunctions[{grid,matrices,Neqs},{\[Omega]}]


(* ::Input::Initialization:: *)
ComputeEigenfunctions[{grid_,matrices_,Neqs_},\[Omega]list0_List]:=With[{p=Precision[grid]},Block[{\[Omega]list,\[Omega]powers,Mlist,$MinPrecision=Max[p,$MachinePrecision],freqtomat,evecs,result},
\[Omega]list=\[Omega]list0//format;
\[Omega]powers=Evaluate[#^Range[0,Length[matrices]-1]]&/@\[Omega]list//format;

freqtomat=If[p<=$MachinePrecision,Function[{freqpowers},freqToMatrixC[freqpowers,matrices]],Function[{freqpowers},Total[freqpowers*matrices]]];
Mlist=freqtomat/@\[Omega]powers;

evecs=Eigensystem[#,-1][[2,1]]&/@Mlist;

result=formatEigenfunctions[Transpose[{\[Omega]list0,evecs}],grid,Neqs];

If[TrueQ@$QNMMemory,ComputeEigenfunctions[{matrices,grid,Neqs},\[Omega]list0]=result;];

result
]]


(* ::Input::Initialization:: *)
plotopts=Sequence[
Axes->True,
ImageSize->600,
Frame->True,
PlotStyle->{{Blue,Thick}},
AxesOrigin->{0,0},
BaseStyle->{FontSize->30},
LabelStyle->{FontSize->30}];


(* ::Input::Initialization:: *)
Options[PlotFrequencies]={NModes->All,Name->"\[Omega]"};
PlotFrequencies[modes_,opts : OptionsPattern[{PlotFrequencies,ListPlot}]]:=Block[{n=OptionValue[NModes]/.All->-1,\[Omega]=OptionValue[Name],freqs},
catchError[If[Not@StringQ@\[Omega],throwError[PlotFrequencies::name]],Block];

If[n>Length[modes],Message[PlotFrequencies::nmodes,n,n=Length[modes]]];

freqs=modes[[1;;n]]//If[eigenfunctionsQ[#],#[[All,1]],#]&;

ListPlot[freqs/.{Complex[a_,b_]:>{a,b},0->{0,0}},FilterRules[{opts},Options[ListPlot]],FrameLabel->{"Re "<>\[Omega],"Im "<>\[Omega]},PlotStyle->{Blue,PointSize[Large]},plotopts]
]


(* ::Input::Initialization:: *)
PlotFrequencies::nmodes="There are not as many modes as `1`, plotting all `2` instead.";
PlotFrequencies::name="The name should be a string.";


(* ::Input::Initialization:: *)
eigenfunctionsQ[modes_]:=Length[Dimensions@modes]==2


(* ::Input::Initialization:: *)
nrtostring[nr_]:=ToString[nr,TraditionalForm];


(* ::Input::Initialization:: *)
Options[MakeTable]={NModes->All,Precision->10,Name->"\!\(\*SubscriptBox[\(\[Omega]\), \(n\)]\)",ConjugateCutoff->3};

MakeTable[modes_,OptionsPattern[]]:=Block[{n=OptionValue[NModes]/.All->-1,prec=OptionValue[Precision],\[Omega]=OptionValue[Name],conjCutoff=OptionValue[ConjugateCutoff],
conjQ,uniquefreqs},
catchError[If[Not@StringQ@\[Omega],throwError[MakeTable::name]],Block];

catchError[conjQ=If[conjCutoff===False,(False&),
If[NumericQ@conjCutoff,
(Abs[Im[#1]-Im[#2]]<10^-conjCutoff||N[Abs[Im[#1]-Im[#2]]]==0.&),
throwError[MakeTable::conjugates]]],
Block];

uniquefreqs=modes//If[eigenfunctionsQ[#],#[[All,1]],#]&//DeleteDuplicates[#,conjQ]&;
If[n>Length[uniquefreqs],Message[MakeTable::nmodes,n,n=Length[uniquefreqs]]];
uniquefreqs=uniquefreqs[[1;;n]];

Block[{
setPrec=If[prec==\[Infinity]//TrueQ,#&,N[#,   Min[Precision[#],prec]      ]&]},
{{"n","Re "<>\[Omega],"Im "<>\[Omega]}}~Join~Table[
{i,If[Abs[Re[uniquefreqs[[i]]]]>10^-10,"\[PlusMinus] ",""]<>nrtostring[Abs@Re@uniquefreqs[[i]]//setPrec],Im@uniquefreqs[[i]]//setPrec},
{i,1,Length@uniquefreqs}]//Grid[#,Frame->All]&
]
]


(* ::Input::Initialization:: *)
MakeTable::nmodes="There are not as many modes as `1`, showing all `2` instead.";
MakeTable::name="The name should be a string.";
MakeTable::conjugateCutoff="Option ConjugateCutoff should be a number.";


(* ::Input::Initialization:: *)
ShowModes[modes_,opts :OptionsPattern[{PlotFrequencies,ListPlot,MakeTable}]]:=Block[{n=OptionValue[NModes]},
If[n>Length[modes],Message[ShowModes::nmodes,n,n=Length[modes]]];

{PlotFrequencies[modes,FilterRules[{NModes->n,opts},Options[PlotFrequencies]~Join~Options[ListPlot]]],MakeTable[modes,FilterRules[{NModes->n,opts},Options[MakeTable]]]}
]


(* ::Input::Initialization:: *)
ShowModes::nmodes="There are not as many modes as `1`, showing all `2` instead.";


(* ::Input::Initialization:: *)
Options[PlotEigenfunctions]={NModes->All,FunctionNumber->1,Rescale->0,Conjugates ->(#[[-3]]<0&)};

PlotEigenfunctions[modes_,opts : OptionsPattern[{PlotEigenfunctions,Plot}]]:=Block[{n=OptionValue[NModes]/.All->Length[modes],fn=OptionValue[FunctionNumber],resc=OptionValue[Rescale],conjQ=OptionValue[Conjugates]/.False->(False&),eigenfcts,grid,fRe,fIm,hor,fname},

If[n>Length[modes],Message[PlotEigenfunctions::nmodes,n,n=Length[modes]]];
catchError[If[Not@eigenfunctionsQ[modes],throwError[PlotEigenfunctions::efcomputed]],Block];
If[fn>Length[modes[[1,2]]],Message[PlotEigenfunctions::nfuncts,fn];fn=1];

grid=modes[[1,2,1,All,1]];hor=grid[[1]];
eigenfcts=If[resc==0,1,(grid/hor)^resc] #&/@ modes[[1;;n,2,fn,All,2]];
fRe=eigenfcts//Re;
fIm=eigenfcts//Im;

fIm=DeleteCases[fIm,x_/;conjQ[x]];

fRe=Transpose[{grid,#}]&/@fRe;
fIm=Transpose[{grid,#}]&/@fIm;

fname="\!\(\*SubscriptBox[\(f\), \(n\)]\)(z)"<>If[resc==0//TrueQ,"","\!\(\*SuperscriptBox[\(z\), \("<>nrtostring[resc]<>"\)]\)"];
ListPlot[fRe~Join~fIm,FilterRules[{opts},Options[Plot]],PlotRange->{{0,hor},Automatic},Joined->True,
PlotStyle->Table[{Blue,Thick},{n}]~Join~Table[{Red,Thick},{n}],
PlotLegends->Placed[LineLegend[{Blue,Red},{"Re","Im"},LegendFunction->(Framed[#,RoundingRadius->5,Background->White]&)],{.9,.825}],
FrameLabel->{"z",fname},plotopts]
]


(* ::Input::Initialization:: *)
PlotEigenfunctions::nmodes="There are not as many modes as `1`, using all `2` instead.";
PlotEigenfunctions::efcomputed="Eigenfunctions not computed, use option Eigenfunctions -> True in GetModes.";
PlotEigenfunctions::nfuncts="There are not as many functions as `1`, plotting the first function instead.";


(* ::Input::Initialization:: *)
Options[FitFunction]={FunctionNumber->1,NModes->All,RealCutoff->10^-5,FrequencySign->-1};

FitFunction[modes_List,function_,OptionsPattern[]]:=(Message[FitFunction::puref];Return[$Failed])

FitFunction[modes_List,function_Function,OptionsPattern[]]:=FitFunction[modes,function]=
Block[{n=OptionValue[NModes]/.All->-1,fn=OptionValue[FunctionNumber],
modes2,realModes,complexModes,
eigenfunctions,realEigenfunctions,complexEigenfunctions,
grid,
mat,vec,cns0,cns,cnsRe,cnsComplex,cnsSorted,
fitFunc,errors,frequencies,timeFunc},

If[n>Length[modes],Message[FitFunction::nmodes,n,n=Length[modes]]];
catchError[If[Not@eigenfunctionsQ[modes],throwError[FitFunction::efcomputed]],Block];
If[fn>Length[modes[[1,2]]],Message[FitFunction::nfuncts,fn];fn=1];

printTemporaryIf["Fitting "<>ToString[n/.-1->Length[modes]]<>" modes..."];

grid=modes[[1,2,1,All,1]];

(* All real modes, and all complex modes with any missing conjugates added and conjugate pairs reduced to one *)
(* In the critically overdamped case where eigenfunctions are real and doubly degenerate, if we remove the doubled modes the fit is worse..? *)
modes2=(SetPrecision[#,Max[Precision[#],Length[modes[[1,2,fn]]]/2]]&)/@modes[[1;;n]];
realModes=Select[modes2,Max[Abs[Im@#[[2,fn,All,2]]]]<OptionValue[RealCutoff]&](*//DeleteDuplicates[#,Norm[(#1\[LeftDoubleBracket]2,fn,All,2\[RightDoubleBracket]-#2\[LeftDoubleBracket]2,fn,All,2\[RightDoubleBracket])]<10^-3&]&*);
complexModes=Complement[modes2,realModes]//#~Join~(#/.{freq_,vec_}:>{-Conjugate[freq],Conjugate[vec]})&//DeleteDuplicates[#,Max[Abs/@(#1[[2,fn,All,2]]-#2[[2,fn,All,2]])]<10^-3&]&//Select[#,Im[#[[2,fn,All,2]][[-4]]]>10^-8&]&;

(* Real eigenfunctions, complex eigenfunctions *)
realEigenfunctions=If[Length[realModes]==0,{},realModes[[All,2,fn,All,2]]]//Re;
complexEigenfunctions=If[Length[complexModes]==0,{},complexModes[[All,2,fn,All,2]]];

(* Corresponding frequencies and eigenfunctions including conjugates *)
eigenfunctions=realEigenfunctions~Join~complexEigenfunctions~Join~Conjugate[complexEigenfunctions];
frequencies=(realModes[[All,1]]/.Complex[a_,b_]:>Complex[0,b])~Join~complexModes[[All,1]]~Join~(-Conjugate[complexModes[[All,1]]]);
printTemporaryIf["with "<>ToString[Length@realEigenfunctions]<>" real eigenfunctions and "<>ToString[Length@complexEigenfunctions]<>" complex eigenfunctions."];

(* Construct the matrix equation fitting the real part of the sum of QNM's to the given function *)
mat=realEigenfunctions~Join~Re[complexEigenfunctions]~Join~(-Im[complexEigenfunctions])//Transpose;
vec=function/@grid;

(* Solve it, using LeastSquares and not LinearSolve because the system is overconstrained *) 
cns0=LeastSquares[mat,vec];
(* Recombine coefficients to complex numbers for complex eigenfunctions *)
cnsRe=cns0[[1;;Length[realEigenfunctions]]];
cnsComplex=1/2 If[Length[complexEigenfunctions]==0,{},(cns0[[Length[realEigenfunctions]+1;;Length[realEigenfunctions]+Length[complexEigenfunctions]]]+I cns0[[-Length[complexEigenfunctions];;-1]])];
cns=cnsRe~Join~cnsComplex~Join~Conjugate[cnsComplex];

(* The results: fitted function, errors, coefficients, and resulting function of time*)
fitFunc=Transpose[{grid,(cns*eigenfunctions//Re//Total)}];
errors=Transpose[{grid,fitFunc[[All,2]]-vec}];

timeFunc=Exp[OptionValue[FrequencySign]I frequencies #]cns*eigenfunctions//Total //Re;

(* sort coefficients by imaginary part of corresponding frequency *)
cnsSorted=Transpose[{cns,frequencies}]//SortBy[#,OptionValue[FrequencySign] Im[Last@#1]&]&//#[[All,1]]&;

(* Output the result, the errors, the coefficients and the resulting function on the boundary *)
{fitFunc,errors,cnsSorted,timeFunc}
]


(* ::Input::Initialization:: *)
FitFunction::nmodes="There are not as many modes as `1`, using all `2` instead.";
FitFunction::efcomputed="Eigenfunctions not computed, use option Eigenfunctions -> True in GetModes.";
FitFunction::nfuncts="There are not as many functions as `1`, plotting the first function instead.";
FitFunction::puref="The second argument must be a pure function.";


(* ::Input::Initialization:: *)
Options[PlotFit]={tMax->1,GridPoint->-1,Rescale->0,RescaleFrequency->1};
PlotFit[fit_List,opts: OptionsPattern[{PlotFit,Plot}]]:=Block[{tmax=OptionValue[tMax]//SetPrecision[#,Max[Precision[#],100]]&,
\[Omega]resc=OptionValue[RescaleFrequency]//SetPrecision[#,Max[Precision[#],100]]&,
gridpoint=OptionValue[GridPoint],resc=OptionValue[Rescale],grid=fit[[1,All,1]],
fitfunc,fitlist},
fitfunc=(If[resc==0//TrueQ,func[fit[[-1,gridpoint]]],func[fit[[-1,gridpoint/.-1->-2]]/grid[[gridpoint/.-1->-2]]^resc]]//SetPrecision[#,100]&)/.func->Function;
fitlist={#,fitfunc[\[Omega]resc #]}&/@Range[0,tmax,tmax/200];
ListPlot[fitlist,FilterRules[{opts},Options[Plot]]//Evaluate,FrameLabel->{"t",""},Joined->True,plotopts//Evaluate]
]


(* ::Input::Initialization:: *)
End[];
EndPackage[];
