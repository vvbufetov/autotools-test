#
# SYNOPSIS
#
#   AX_MATH_FACTORIAL
#
# DESCRIPTION
#
#   Test for the math-factorial library.
#
#   The macro tests for libraries in the library/include path, and, when
#   provided, also in the path given by --with-math-factorial.
#
#   This macro calls:
#
#     AC_SUBST(MATH_FACTORIAL_CPPFLAGS)
#     AC_SUBST(MATH_FACTORIAL_LDFLAGS)
#     AC_SUBST(MATH_FACTORIAL_LIBS)
#
#   And sets:
#
#     HAVE_MATH_FACTORIAL
#

AC_DEFUN([AX_MATH_FACTORIAL], [
    AC_ARG_WITH([math-factorial],
        [AS_HELP_STRING([--with-math-factorial=<prefix>],[math-factorial prefix directory])],
        [
        MATH_FACTORIAL_LDFLAGS="-L${with_math_factorial}/lib/"
        MATH_FACTORIAL_CPPFLAGS="-I${with_math_factorial}/include"
        ])

    HAVE_MATH_FACTORIAL=0
    if test "$with_math_factorial" != "no"; then

        LD_FLAGS="$LDFLAGS $MATH_FACTORIAL_LDFLAGS"
        CPPFLAGS="$CPPFLAGS $MATH_FACTORIAL_CPPFLAGS"

        AC_LANG_PUSH([C])
        AC_CHECK_HEADER(factorial.h, [math_factorial_h=yes], [math_factorial_h=no])
        AC_LANG_POP([C])

        if test "$math_factorial_h" = "yes"; then
            HAVE_MATH_FACTORIAL=1
            MATH_FACTORIAL_LIBS="-lfactorial"
            AC_SUBST(MATH_FACTORIAL_LDFLAGS)
            AC_SUBST(MATH_FACTORIAL_CPPFLAGS)
            AC_SUBST(MATH_FACTORIAL_LIBS)
        else
            AC_MSG_WARN([no valid math-factorial installation was found])
        fi
    else
        AC_MSG_NOTICE([not checking for math-factorial])
    fi

    AC_DEFINE(HAVE_MATH_FACTORIAL,,[define if the math-factorial library is available])
])
