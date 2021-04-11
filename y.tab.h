/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ENTIER = 258,
    REEL = 259,
    parentheseOuverte = 260,
    parentheseFermee = 261,
    virgule = 262,
    double_point = 263,
    egal = 264,
    fonction = 265,
    procedure = 266,
    algorithme = 267,
    lire = 268,
    ecrire = 269,
    declaration = 270,
    debut = 271,
    fin = 272,
    retourne = 273,
    debut_si = 274,
    debut_alors = 275,
    sinon = 276,
    fin_si = 277,
    debut_switch = 278,
    debut_parmi = 279,
    fin_switch = 280,
    defaut = 281,
    debut_pour = 282,
    debut_pour_allant_de = 283,
    debut_pour_pas = 284,
    faire = 285,
    fin_pour = 286,
    debut_pour_a = 287,
    debut_tant_que = 288,
    fin_tant_que = 289,
    typeReel = 290,
    typeEntier = 291,
    variable = 292,
    operateur_plus = 293,
    operateur_diviser = 294,
    operateur_moins = 295,
    operateur_modulo = 296,
    operateur_multiplier = 297,
    operateur_et = 298,
    operateur_ou = 299,
    operateur_non = 300,
    operateur_egal_egal = 301,
    operateur_inferieur_egal = 302,
    operateur_superieur_egal = 303,
    operateur_non_egal = 304,
    operateur_inferieur = 305,
    operateur_superieur = 306
  };
#endif
/* Tokens.  */
#define ENTIER 258
#define REEL 259
#define parentheseOuverte 260
#define parentheseFermee 261
#define virgule 262
#define double_point 263
#define egal 264
#define fonction 265
#define procedure 266
#define algorithme 267
#define lire 268
#define ecrire 269
#define declaration 270
#define debut 271
#define fin 272
#define retourne 273
#define debut_si 274
#define debut_alors 275
#define sinon 276
#define fin_si 277
#define debut_switch 278
#define debut_parmi 279
#define fin_switch 280
#define defaut 281
#define debut_pour 282
#define debut_pour_allant_de 283
#define debut_pour_pas 284
#define faire 285
#define fin_pour 286
#define debut_pour_a 287
#define debut_tant_que 288
#define fin_tant_que 289
#define typeReel 290
#define typeEntier 291
#define variable 292
#define operateur_plus 293
#define operateur_diviser 294
#define operateur_moins 295
#define operateur_modulo 296
#define operateur_multiplier 297
#define operateur_et 298
#define operateur_ou 299
#define operateur_non 300
#define operateur_egal_egal 301
#define operateur_inferieur_egal 302
#define operateur_superieur_egal 303
#define operateur_non_egal 304
#define operateur_inferieur 305
#define operateur_superieur 306

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
