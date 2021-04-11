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
    parentheseOuverte = 258,
    parentheseFermee = 259,
    virgule = 260,
    double_point = 261,
    egal = 262,
    fonction = 263,
    procedure = 264,
    algorithme = 265,
    fonction_lire = 266,
    fonction_ecrire = 267,
    declaration = 268,
    debut = 269,
    fin = 270,
    retourne = 271,
    debut_si = 272,
    debut_alors = 273,
    sinon = 274,
    fin_si = 275,
    debut_switch = 276,
    debut_parmi = 277,
    fin_switch = 278,
    defaut = 279,
    debut_pour = 280,
    debut_pour_allant_de = 281,
    debut_pour_pas = 282,
    faire = 283,
    fin_pour = 284,
    debut_pour_a = 285,
    debut_tant_que = 286,
    fin_tant_que = 287,
    typeReel = 288,
    typeEntier = 289,
    variable = 290,
    operateur_plus = 291,
    operateur_diviser = 292,
    operateur_moins = 293,
    operateur_modulo = 294,
    operateur_multiplier = 295,
    operateur_et = 296,
    operateur_ou = 297,
    operateur_non = 298,
    operateur_egal_egal = 299,
    operateur_inferieur_egal = 300,
    operateur_superieur_egal = 301,
    operateur_non_egal = 302,
    operateur_inferieur = 303,
    operateur_superieur = 304,
    ENTIER = 305,
    operateur_mult = 306
  };
#endif
/* Tokens.  */
#define parentheseOuverte 258
#define parentheseFermee 259
#define virgule 260
#define double_point 261
#define egal 262
#define fonction 263
#define procedure 264
#define algorithme 265
#define fonction_lire 266
#define fonction_ecrire 267
#define declaration 268
#define debut 269
#define fin 270
#define retourne 271
#define debut_si 272
#define debut_alors 273
#define sinon 274
#define fin_si 275
#define debut_switch 276
#define debut_parmi 277
#define fin_switch 278
#define defaut 279
#define debut_pour 280
#define debut_pour_allant_de 281
#define debut_pour_pas 282
#define faire 283
#define fin_pour 284
#define debut_pour_a 285
#define debut_tant_que 286
#define fin_tant_que 287
#define typeReel 288
#define typeEntier 289
#define variable 290
#define operateur_plus 291
#define operateur_diviser 292
#define operateur_moins 293
#define operateur_modulo 294
#define operateur_multiplier 295
#define operateur_et 296
#define operateur_ou 297
#define operateur_non 298
#define operateur_egal_egal 299
#define operateur_inferieur_egal 300
#define operateur_superieur_egal 301
#define operateur_non_egal 302
#define operateur_inferieur 303
#define operateur_superieur 304
#define ENTIER 305
#define operateur_mult 306

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
